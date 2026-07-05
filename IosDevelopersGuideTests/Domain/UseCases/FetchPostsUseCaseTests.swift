//
//  FetchPostsUseCaseTests.swift
//  IosDevelopersGuideTests
//
//  Created by Claude on 04/07/26.
//

import Testing
import Foundation
@testable import IosDevelopersGuide

struct FetchPostsUseCaseTests {

    // MARK: - Success Cases

    @Test("FetchPostsUseCase should return posts when repository succeeds")
    func fetchPostsSuccess() async throws {
        // Arrange
        let expectedPosts = TestDataBuilder.createMultiplePosts(count: 3)
        let mockRepository = MockPostRepository(result: .success(expectedPosts))
        let useCase = FetchPostsUseCase(repository: mockRepository)

        // Act
        let result = await useCase.execute()

        // Assert
        let posts = try TestHelpers.unwrapSuccess(result)
        #expect(posts.count == 3)
        #expect(posts[0].title == "Test Post 1")
        #expect(posts[1].title == "Test Post 2")
        #expect(posts[2].title == "Test Post 3")
    }

    @Test("FetchPostsUseCase should return single post")
    func fetchPostsSinglePost() async throws {
        // Arrange
        let expectedPosts = [TestDataBuilder.createPost()]
        let mockRepository = MockPostRepository(result: .success(expectedPosts))
        let useCase = FetchPostsUseCase(repository: mockRepository)

        // Act
        let result = await useCase.execute()

        // Assert
        let posts = try TestHelpers.unwrapSuccess(result)
        #expect(posts.count == 1)
        #expect(posts[0].title == "Test Post")
    }

    @Test("FetchPostsUseCase should return empty array when no posts")
    func fetchPostsEmpty() async throws {
        // Arrange
        let mockRepository = MockPostRepository(result: .success([]))
        let useCase = FetchPostsUseCase(repository: mockRepository)

        // Act
        let result = await useCase.execute()

        // Assert
        let posts = try TestHelpers.unwrapSuccess(result)
        #expect(posts.isEmpty)
    }

    // MARK: - Failure Cases

    @Test("FetchPostsUseCase should return network failure when repository fails")
    func fetchPostsNetworkFailure() async throws {
        // Arrange
        let expectedFailure = NetworkFailure.networkUnavailable(
            "Test network failure",
            severity: .critical
        )
        let mockRepository = MockPostRepository(result: .failure(expectedFailure))
        let useCase = FetchPostsUseCase(repository: mockRepository)

        // Act
        let result = await useCase.execute()

        // Assert
        let failure = try TestHelpers.unwrapFailure(result) as! NetworkFailure
        #expect(failure.severity == .critical)
    }

    @Test("FetchPostsUseCase should return server failure when repository fails")
    func fetchPostsServerFailure() async throws {
        // Arrange
        let expectedFailure = ServerFailure.internalServerError(
            "Test server error",
            severity: .critical,
            statusCode: 500
        )
        let mockRepository = MockPostRepository(result: .failure(expectedFailure))
        let useCase = FetchPostsUseCase(repository: mockRepository)

        // Act
        let result = await useCase.execute()

        // Assert
        let failure = try TestHelpers.unwrapFailure(result) as! ServerFailure
        #expect(failure.severity == .critical)
        #expect(failure.statusCode == .some(500))
    }

    @Test("FetchPostsUseCase should return cache failure when repository fails")
    func fetchPostsCacheFailure() async throws {
        // Arrange
        let expectedFailure = CacheFailure.readFailed(
            "Test cache failure",
            severity: .warning
        )
        let mockRepository = MockPostRepository(result: .failure(expectedFailure))
        let useCase = FetchPostsUseCase(repository: mockRepository)

        // Act
        let result = await useCase.execute()

        // Assert
        let failure = try TestHelpers.unwrapFailure(result) as! CacheFailure
        #expect(failure.severity == .warning)
    }
}

// MARK: - Mock Repository

class MockPostRepository: PostRepository {
    private let result: Result<[Post]>

    init(result: Result<[Post]>) {
        self.result = result
    }

    func fetchPosts() async -> Result<[Post]> {
        return result
    }
}
