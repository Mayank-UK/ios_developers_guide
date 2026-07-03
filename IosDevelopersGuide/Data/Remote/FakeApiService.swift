//
//  FakeApiService.swift
//  IosDevelopersGuide
//
//  Created by [Your Name]
//  Copyright © 2026. All rights reserved.
//

import Foundation

// MARK: - Api Scenario Enum

enum ApiScenario {
    case success              // Normal successful responses
    case networkError         // No internet connection
    case timeout              // Request timeout
    case serverError          // Server error (500)
    case notFound             // Resource not found (404)
    case unauthorized         // Unauthorized (401)
    case invalidJson          // Malformed JSON response
}

// MARK: - Fake API Service

/// Fake API service for testing different error scenarios
/// This service implements the same protocol as real API service but allows controlled error simulation
///
/// ## Usage Example
/// ```swift
/// let fakeService = FakeApiService(scenario: .networkError)
/// // All calls will simulate network errors
///
/// // Change scenario dynamically:
/// fakeService.setScenario(.timeout)
/// ```
class FakeApiService: APIServiceProtocol {
    
    // MARK: - Properties
    
    private var scenario: ApiScenario
    private var latency: TimeInterval = 0.6 // Default 600ms latency
    
    // MARK: - Fake Data
    
    private let fakePosts: [PostDTO] = [
        PostDTO(id: 1, title: "Fake Post 1", body: "This is a fake post from FakeApiService"),
        PostDTO(id: 2, title: "Fake Post 2", body: "Another fake post for testing"),
        PostDTO(id: 3, title: "Fake Post 3", body: "Testing error handling scenarios"),
    ]
    
    // MARK: - Initialization
    
    init(scenario: ApiScenario = .success, latency: TimeInterval = 0.6) {
        // self.scenario = .success
        self.scenario = .serverError
        self.latency = latency
    }
    
    // MARK: - Scenario Management
    
    /// Update the current scenario for testing
    func setScenario(_ scenario: ApiScenario) {
        self.scenario = scenario
    }
    
    // MARK: - APIServiceProtocol Implementation
    
    func fetchPosts() async throws -> [PostDTO] {
        return try await simulateApiCall("fetchPosts") {
            return self.fakePosts
        }
    }
    
    // MARK: - Simulation Logic
    
    /// Simulates an API call with configured scenario and latency
    private func simulateApiCall<T>(_ operation: String, success: @escaping () -> T) async throws -> T {
        // Simulate network latency
        try await Task.sleep(nanoseconds: UInt64(latency * 1_000_000_000))

        // Handle different scenarios
        switch scenario {
        case .success:
            return success()

        case .networkError:
            throw NetworkException.noConnection(
                cause: URLError(.notConnectedToInternet),
                context: "FakeApiService network error simulation"
            )

        case .timeout:
            throw NetworkException.timeout(
                cause: URLError(.timedOut),
                context: "FakeApiService timeout simulation"
            )

        case .serverError:
            throw ServerException.internalServerError(
                statusCode: 500,
                cause: nil,
                context: "FakeApiService server error simulation"
            )

        case .notFound:
            throw ServerException.notFound(
                statusCode: 404,
                cause: nil,
                context: "FakeApiService not found simulation"
            )

        case .unauthorized:
            throw ServerException.unauthorized(
                statusCode: 401,
                cause: nil,
                context: "FakeApiService unauthorized simulation"
            )

        case .invalidJson:
            throw DecodingException.jsonDecodingFailed(
                cause: nil,
                context: "FakeApiService invalid JSON simulation"
            )
        }
    }
}
