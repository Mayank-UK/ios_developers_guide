//
//  PostRepositoryImplTests.swift
//  IosDevelopersGuideTests
//
//  Created by Claude on 04/07/26.
//

import Testing
import Foundation
import FactoryKit
@testable import IosDevelopersGuide

struct PostRepositoryImplTests {

    // MARK: - Success Cases

    @Test("PostRepository should return posts when API succeeds")
    func fetchPosts_API_Success() async throws {
        // Arrange
        let fakePosts = TestDataBuilder.createMultiplePostDTOs(count: 3)
        let fakeApi = FakeApiService(scenario: .success)
        let fakeDb = FakeAppDatabase(scenario: .success)
        let logger = Container.shared.repositoryLogger()

        // Inject test data by accessing internals
        let repository = PostRepositoryImplementation(
            remote: fakeApi,
            local: fakeDb,
            logger: logger
        )

        // Act
        let result = await repository.fetchPosts()

        // Assert
        let posts = try TestAssertions.assertSuccess(result)
        #expect(posts.count == 3)
        #expect(posts[0].title == "Fake Post 1")
        #expect(posts[1].title == "Fake Post 2")
        #expect(posts[2].title == "Fake Post 3")
    }

    @Test("PostRepository should cache posts when API succeeds")
    func fetchPosts_CachesResults() async throws {
        // Arrange
        let fakeApi = FakeApiService(scenario: .success)
        let fakeDb = FakeAppDatabase(scenario: .success)
        let logger = Container.shared.repositoryLogger()

        let repository = PostRepositoryImplementation(
            remote: fakeApi,
            local: fakeDb,
            logger: logger
        )

        // Act
        let result = await repository.fetchPosts()

        // Assert
        let posts = try TestAssertions.assertSuccess(result)
        #expect(posts.count == 3)

        // Verify database was called (fakeDb should have cached posts)
        let cachedPosts = try fakeDb.fetchPosts()
        #expect(cachedPosts.count == 3)
    }

    // MARK: - Fallback to Cache Cases

    @Test("PostRepository should return cached posts when network fails")
    func fetchPosts_NetworkFailure_WithCache() async throws {
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

        // Act
        let result = await repository.fetchPosts()

        // Assert
        let posts = try TestAssertions.assertSuccess(result)
        #expect(posts.count == 2)
        #expect(posts[0].title == "Test Post 1")
        #expect(posts[1].title == "Test Post 2")
    }

    @Test("PostRepository should return cached posts when server fails")
    func fetchPosts_ServerFailure_WithCache() async throws {
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

        // Act
        let result = await repository.fetchPosts()

        // Assert
        let posts = try TestAssertions.assertSuccess(result)
        #expect(posts.count == 2)
    }

    // MARK: - Failure Cases

    @Test("PostRepository should fail when network fails and cache is empty")
    func fetchPosts_NetworkFailure_EmptyCache() async throws {
        // Arrange
        let fakeApi = FakeApiService(scenario: .networkError)
        let fakeDb = FakeAppDatabase(scenario: .empty)
        let logger = Container.shared.repositoryLogger()

        let repository = PostRepositoryImplementation(
            remote: fakeApi,
            local: fakeDb,
            logger: logger
        )

        // Act
        let result = await repository.fetchPosts()

        // Assert
        let failure = try TestAssertions.assertFailureType(result, expectedType: NetworkFailure.self)
    }

    @Test("PostRepository should fail when server fails and cache is empty")
    func fetchPosts_ServerFailure_EmptyCache() async throws {
        // Arrange
        let fakeApi = FakeApiService(scenario: .serverError)
        let fakeDb = FakeAppDatabase(scenario: .empty)
        let logger = Container.shared.repositoryLogger()

        let repository = PostRepositoryImplementation(
            remote: fakeApi,
            local: fakeDb,
            logger: logger
        )

        // Act
        let result = await repository.fetchPosts()

        // Assert
        let failure = try TestAssertions.assertFailureType(result, expectedType: ServerFailure.self)
    }

    @Test("PostRepository should fail when both network and cache fail")
    func fetchPosts_BothFail() async throws {
        // Arrange
        let fakeApi = FakeApiService(scenario: .networkError)
        let fakeDb = FakeAppDatabase(scenario: .readError)
        let logger = Container.shared.repositoryLogger()

        let repository = PostRepositoryImplementation(
            remote: fakeApi,
            local: fakeDb,
            logger: logger
        )

        // Act
        let result = await repository.fetchPosts()

        // Assert
        let failure = try TestAssertions.assertFailureType(result, expectedType: NetworkFailure.self)
        #expect(failure.localizedDescription.contains("Network failed"))
    }

    // MARK: - Timeout Cases

    @Test("PostRepository should handle timeout and return cache")
    func fetchPosts_Timeout_WithCache() async throws {
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

        // Act
        let result = await repository.fetchPosts()

        // Assert
        let posts = try TestAssertions.assertSuccess(result)
        #expect(posts.count == 1)
    }

    @Test("PostRepository should fail when timeout and cache is empty")
    func fetchPosts_Timeout_EmptyCache() async throws {
        // Arrange
        let fakeApi = FakeApiService(scenario: .timeout)
        let fakeDb = FakeAppDatabase(scenario: .empty)
        let logger = Container.shared.repositoryLogger()

        let repository = PostRepositoryImplementation(
            remote: fakeApi,
            local: fakeDb,
            logger: logger
        )

        // Act
        let result = await repository.fetchPosts()

        // Assert
        let failure = try TestAssertions.assertFailureType(result, expectedType: NetworkFailure.self)
    }

    // MARK: - Not Found Cases

    @Test("PostRepository should handle 404 and return cache")
    func fetchPosts_NotFound_WithCache() async throws {
        // Arrange
        let fakePosts = TestDataBuilder.createMultiplePostDTOs(count: 1)
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

        // Act
        let result = await repository.fetchPosts()

        // Assert
        let posts = try TestAssertions.assertSuccess(result)
        #expect(posts.count == 1)
    }
}
