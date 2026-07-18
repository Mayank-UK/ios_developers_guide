//
//  PostFetchingIntegrationTests.swift
//  IosDevelopersGuideTests
//
//  Created by Claude on 04/07/26.
//

import Testing
import Foundation
import FactoryKit
@testable import IosDevelopersGuide

struct PostFetchingIntegrationTests {

    // MARK: - End-to-End Success Scenarios

    @Test("Integration: Complete happy path - API to UseCase")
    func happyPath_CompleteFlow() async throws {
        // Arrange
        let fakeApi = FakeApiService(scenario: .success)
        let fakeDb = FakeAppDatabase(scenario: .success)
        let logger = Container.shared.repositoryLogger()

        let repository = PostRepositoryImplementation(
            remote: fakeApi,
            local: fakeDb,
            logger: logger
        )

        let useCase = FetchPostsUseCase(repository: repository)

        // Act
        let result = await useCase.execute()

        // Assert
        let posts = try TestAssertions.assertSuccess(result)
        #expect(posts.count == 3)
        #expect(posts[0].title == "Fake Post 1")
        #expect(posts[1].title == "Fake Post 2")
        #expect(posts[2].title == "Fake Post 3")

        // Verify caching happened
        let cachedPosts = try fakeDb.fetchPosts()
        #expect(cachedPosts.count == 3)
    }

    @Test("Integration: Network failure should fallback to cache")
    func networkFallback_CompleteFlow() async throws {
        // Arrange
        let fakePosts = TestDataBuilder.createMultiplePostDTOs(count: 2)
        let fakeApi = FakeApiService(scenario: .networkError)
        var fakeDb = FakeAppDatabase(scenario: .success)

        // Pre-populate cache
        try fakeDb.replacePosts(fakePosts)

        let logger = Container.shared.repositoryLogger()
        let repository = PostRepositoryImplementation(
            remote: fakeApi,
            local: fakeDb,
            logger: logger
        )

        let useCase = FetchPostsUseCase(repository: repository)

        // Act
        let result = await useCase.execute()

        // Assert
        let posts = try TestAssertions.assertSuccess(result)
        #expect(posts.count == 2)
        #expect(posts[0].title == "Test Post 1")
        #expect(posts[1].title == "Test Post 2")
    }

    @Test("Integration: Server failure should fallback to cache")
    func serverFallback_CompleteFlow() async throws {
        // Arrange
        let fakePosts = TestDataBuilder.createMultiplePostDTOs(count: 2)
        let fakeApi = FakeApiService(scenario: .serverError)
        var fakeDb = FakeAppDatabase(scenario: .success)

        // Pre-populate cache
        try fakeDb.replacePosts(fakePosts)

        let logger = Container.shared.repositoryLogger()
        let repository = PostRepositoryImplementation(
            remote: fakeApi,
            local: fakeDb,
            logger: logger
        )

        let useCase = FetchPostsUseCase(repository: repository)

        // Act
        let result = await useCase.execute()

        // Assert
        let posts = try TestAssertions.assertSuccess(result)
        #expect(posts.count == 2)
    }

    @Test("Integration: Complete failure when both API and cache fail")
    func completeFailure_CompleteFlow() async throws {
        // Arrange
        let fakeApi = FakeApiService(scenario: .networkError)
        let fakeDb = FakeAppDatabase(scenario: .empty)
        let logger = Container.shared.repositoryLogger()

        let repository = PostRepositoryImplementation(
            remote: fakeApi,
            local: fakeDb,
            logger: logger
        )

        let useCase = FetchPostsUseCase(repository: repository)

        // Act
        let result = await useCase.execute()

        // Assert
        let failure = try TestAssertions.assertFailureType(result, expectedType: NetworkFailure.self)
    }

    // MARK: - Data Consistency Tests

    @Test("Integration: Database should be updated after successful API call")
    func databaseUpdate_CompleteFlow() async throws {
        // Arrange
        let fakeApi = FakeApiService(scenario: .success)
        var fakeDb = FakeAppDatabase(scenario: .success)
        let logger = Container.shared.repositoryLogger()

        let repository = PostRepositoryImplementation(
            remote: fakeApi,
            local: fakeDb,
            logger: logger
        )

        let useCase = FetchPostsUseCase(repository: repository)

        // Act
        let result = await useCase.execute()

        // Assert
        let posts = try TestAssertions.assertSuccess(result)
        #expect(posts.count == 3)

        // Verify database was updated
        let cachedPosts = try fakeDb.fetchPosts()
        #expect(cachedPosts.count == 3)
        #expect(cachedPosts.map { $0.title } == posts.map { $0.title })
    }

    @Test("Integration: Multiple calls should maintain data consistency")
    func multipleCalls_CompleteFlow() async throws {
        // Arrange
        let fakeApi = FakeApiService(scenario: .success)
        var fakeDb = FakeAppDatabase(scenario: .success)
        let logger = Container.shared.repositoryLogger()

        let repository = PostRepositoryImplementation(
            remote: fakeApi,
            local: fakeDb,
            logger: logger
        )

        let useCase = FetchPostsUseCase(repository: repository)

        // Act - First call
        let result1 = await useCase.execute()
        let posts1 = try TestAssertions.assertSuccess(result1)

        // Act - Second call (should use fresh data)
        let result2 = await useCase.execute()
        let posts2 = try TestAssertions.assertSuccess(result2)

        // Assert
        #expect(posts1.count == 3)
        #expect(posts2.count == 3)
        #expect(posts1.map { $0.id } == posts2.map { $0.id })
    }

    // MARK: - Error Recovery Scenarios

    @Test("Integration: Timeout recovery with cache")
    func timeoutRecovery_CompleteFlow() async throws {
        // Arrange
        let fakePosts = TestDataBuilder.createMultiplePostDTOs(count: 1)
        let fakeApi = FakeApiService(scenario: .timeout)
        var fakeDb = FakeAppDatabase(scenario: .success)

        // Pre-populate cache
        try fakeDb.replacePosts(fakePosts)

        let logger = Container.shared.repositoryLogger()
        let repository = PostRepositoryImplementation(
            remote: fakeApi,
            local: fakeDb,
            logger: logger
        )

        let useCase = FetchPostsUseCase(repository: repository)

        // Act
        let result = await useCase.execute()

        // Assert
        let posts = try TestAssertions.assertSuccess(result)
        #expect(posts.count == 1)
    }

    @Test("Integration: 404 recovery with cache")
    func notFoundRecovery_CompleteFlow() async throws {
        // Arrange
        let fakePosts = TestDataBuilder.createMultiplePostDTOs(count: 2)
        let fakeApi = FakeApiService(scenario: .notFound)
        var fakeDb = FakeAppDatabase(scenario: .success)

        // Pre-populate cache
        try fakeDb.replacePosts(fakePosts)

        let logger = Container.shared.repositoryLogger()
        let repository = PostRepositoryImplementation(
            remote: fakeApi,
            local: fakeDb,
            logger: logger
        )

        let useCase = FetchPostsUseCase(repository: repository)

        // Act
        let result = await useCase.execute()

        // Assert
        let posts = try TestAssertions.assertSuccess(result)
        #expect(posts.count == 2)
    }

    // MARK: - Cache Edge Cases

    @Test("Integration: Empty cache should still try API first")
    func emptyCache_ApiFirst_CompleteFlow() async throws {
        // Arrange
        let fakeApi = FakeApiService(scenario: .success)
        let fakeDb = FakeAppDatabase(scenario: .empty)
        let logger = Container.shared.repositoryLogger()

        let repository = PostRepositoryImplementation(
            remote: fakeApi,
            local: fakeDb,
            logger: logger
        )

        let useCase = FetchPostsUseCase(repository: repository)

        // Act
        let result = await useCase.execute()

        // Assert
        let posts = try TestAssertions.assertSuccess(result)
        #expect(posts.count == 3)

        // Verify cache was populated
        let cachedPosts = try fakeDb.fetchPosts()
        #expect(cachedPosts.count == 3)
    }

    @Test("Integration: Database write failure should not affect API response")
    func dbWriteFailure_ApiSuccess_CompleteFlow() async throws {
        // Arrange
        let fakeApi = FakeApiService(scenario: .success)
        let fakeDb = FakeAppDatabase(scenario: .writeError)
        let logger = Container.shared.repositoryLogger()

        let repository = PostRepositoryImplementation(
            remote: fakeApi,
            local: fakeDb,
            logger: logger
        )

        let useCase = FetchPostsUseCase(repository: repository)

        // Act
        let result = await useCase.execute()

        // Assert - Should still get API data even though cache write failed
        let failure = try TestAssertions.assertFailureType(result, expectedType: CacheFailure.self)
    }
}
