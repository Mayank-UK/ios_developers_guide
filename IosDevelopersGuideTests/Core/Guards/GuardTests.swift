//
//  GuardTests.swift
//  IosDevelopersGuideTests
//
//  Created by Claude on 04/07/26.
//

import Testing
import Foundation
@testable import IosDevelopersGuide

struct GuardTests {

    // MARK: - GuardedApiCall Tests

    @Test("GuardedApiCall should handle successful API calls")
    func guardedApiCall_Success() async throws {
        // Arrange
        let apiService = FakeApiService(scenario: .success)

        // Act
        let posts = try await guardedApiCall {
            try await apiService.fetchPosts()
        }

        // Assert
        #expect(posts.count == 3)
    }

    @Test("GuardedApiCall should handle network errors")
    func guardedApiCall_NetworkError() async throws {
        // Arrange
        let apiService = FakeApiService(scenario: .networkError)

        // Act & Assert
        await #expect(throws: NetworkException.self) {
            try await guardedApiCall {
                try await apiService.fetchPosts()
            }
        }
    }

    @Test("GuardedApiCall should handle timeout errors")
    func guardedApiCall_Timeout() async throws {
        // Arrange
        let apiService = FakeApiService(scenario: .timeout)

        // Act & Assert
        await #expect(throws: NetworkException.self) {
            try await guardedApiCall {
                try await apiService.fetchPosts()
            }
        }
    }

    @Test("GuardedApiCall should handle server errors")
    func guardedApiCall_ServerError() async throws {
        // Arrange
        let apiService = FakeApiService(scenario: .serverError)

        // Act & Assert
        await #expect(throws: ServerException.self) {
            try await guardedApiCall {
                try await apiService.fetchPosts()
            }
        }
    }

    @Test("GuardedApiCall should handle not found errors")
    func guardedApiCall_NotFound() async throws {
        // Arrange
        let apiService = FakeApiService(scenario: .notFound)

        // Act & Assert
        await #expect(throws: ServerException.self) {
            try await guardedApiCall {
                try await apiService.fetchPosts()
            }
        }
    }

    @Test("GuardedApiCall should handle decoding errors")
    func guardedApiCall_DecodingError() async throws {
        // Arrange
        let apiService = FakeApiService(scenario: .invalidJson)

        // Act & Assert
        await #expect(throws: DecodingException.self) {
            try await guardedApiCall {
                try await apiService.fetchPosts()
            }
        }
    }

    // MARK: - SafeRepositoryCall Tests

    @Test("SafeRepositoryCall should handle successful repository calls")
    func safeRepositoryCall_Success() async throws {
        // Arrange
        let database = FakeAppDatabase(scenario: .success)

        // Act
        let result = await safeRepositoryCall(
            call: {
                try database.fetchPosts()
            },
            onNetworkError: { _ in
                return Result<[Post]>.failure(NetworkFailure.networkUnavailable(
                    "Test",
                    severity: .critical
                ))
            },
            onServerError: { _ in
                return Result<[Post]>.failure(ServerFailure.internalServerError(
                    "Test",
                    severity: .critical,
                    statusCode: 500
                ))
            }
        )

        // Assert
        let posts = try TestAssertions.assertSuccess(result)
        #expect(posts.isEmpty) // Empty because we didn't pre-populate
    }

    @Test("SafeRepositoryCall should handle network errors with callback")
    func safeRepositoryCall_NetworkError() async throws {
        // Arrange
        let expectedFailure = NetworkFailure.networkUnavailable(
            "Network unavailable",
            severity: .critical
        )

        // Act
        let result = await safeRepositoryCall(
            call: {
                throw NetworkException.noConnection(
                    cause: URLError(.notConnectedToInternet),
                    context: "Test"
                )
            },
            onNetworkError: { _ in
                return Result<[Post]>.failure(expectedFailure)
            },
            onServerError: { _ in
                return Result<[Post]>.failure(ServerFailure.internalServerError(
                    "Test",
                    severity: .critical,
                    statusCode: 500
                ))
            }
        )

        // Assert
        let failure = try TestAssertions.assertFailure(result)
        #expect(failure.localizedDescription.contains("Network unavailable"))
    }

    @Test("SafeRepositoryCall should handle server errors with callback")
    func safeRepositoryCall_ServerError() async throws {
        // Arrange
        let expectedFailure = ServerFailure.internalServerError(
            "Server error",
            severity: .critical,
            statusCode: 503
        )

        // Act
        let result = await safeRepositoryCall(
            call: {
                throw ServerException.internalServerError(
                    statusCode: 503,
                    cause: nil,
                    context: "Test"
                )
            },
            onNetworkError: { _ in
                return Result<[Post]>.failure(NetworkFailure.networkUnavailable(
                    "Test",
                    severity: .critical
                ))
            },
            onServerError: { _ in
                return Result<[Post]>.failure(expectedFailure)
            }
        )

        // Assert
        let failure = try TestAssertions.assertFailure(result)
        #expect((failure as? ServerFailure)?.statusCode == .some(503))
    }

    @Test("SafeRepositoryCall should propagate unexpected errors")
    func safeRepositoryCall_UnexpectedError() async throws {
        // Arrange
        struct UnexpectedError: Error {}

        // Act
        let result = await safeRepositoryCall(
            call: {
                throw UnexpectedError()
            },
            onNetworkError: { _ in
                return Result<[Post]>.failure(NetworkFailure.networkUnavailable(
                    "Test",
                    severity: .critical
                ))
            },
            onServerError: { _ in
                return Result<[Post]>.failure(ServerFailure.internalServerError(
                    "Test",
                    severity: .critical,
                    statusCode: 500
                ))
            }
        )

        // Assert
        // Should handle unexpected errors gracefully
        let failure = try TestAssertions.assertFailure(result)
        #expect(failure.message.contains("Unexpected") || failure.message.contains("error"))
    }
}
