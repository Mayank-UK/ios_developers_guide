//
//  ErrorTestingHelper.swift
//  IosDevelopersGuide
//
//  Created by [Your Name]
//  Copyright © 2026. All rights reserved.
//

import Foundation

/// Helper class for testing error handling scenarios
/// This simulates different error conditions for testing purposes
class ErrorTestingHelper {
    
    // MARK: - Test Scenarios
    
    /// Simulates a network timeout error
    static func simulateNetworkTimeout() -> NetworkException {
        NetworkException.timeout(
            cause: URLError(.timedOut),
            context: "Simulated timeout for testing"
        )
    }
    
    /// Simulates a no internet connection error
    static func simulateNoConnection() -> NetworkException {
        NetworkException.noConnection(
            cause: URLError(.notConnectedToInternet),
            context: "Simulated no connection for testing"
        )
    }
    
    /// Simulates a server error (500)
    static func simulateServerError() -> ServerException {
        ServerException.internalServerError(
            statusCode: 500,
            cause: nil,
            context: "Simulated server error for testing"
        )
    }
    
    /// Simulates a not found error (404)
    static func simulateNotFound() -> ServerException {
        ServerException.notFound(
            statusCode: 404,
            cause: nil,
            context: "Simulated not found for testing"
        )
    }
    
    /// Simulates a database read error
    static func simulateDatabaseError() -> DatabaseException {
        DatabaseException.readFailed(
            cause: nil,
            context: "Simulated database error for testing"
        )
    }
    
    /// Simulates a JSON decoding error
    static func simulateDecodingError() -> DecodingException {
        DecodingException.jsonDecodingFailed(
            cause: nil,
            context: "Simulated decoding error for testing"
        )
    }
}
