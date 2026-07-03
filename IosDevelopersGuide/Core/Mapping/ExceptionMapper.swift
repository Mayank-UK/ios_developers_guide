//
//  ExceptionMapper.swift
//  IosDevelopersGuide
//
//  Created by [Your Name]
//  Copyright © 2026. All rights reserved.
//

import Foundation

/// Maps technical exceptions to user-friendly failures.
/// This is the bridge between the data layer (exceptions) and presentation layer (failures).
///
/// ## Design Philosophy
/// - **Technical → User-Facing**: Converts debug-friendly exceptions to user-friendly failures
/// - **Severity Assignment**: Assigns appropriate severity levels for UI behavior
/// - **Causal Chaining**: Preserves error context through the transformation
/// - **Centralized Mapping**: Single place for all exception-to-failure conversions
enum ExceptionMapper {
    
    /// Maps an exception to a failure, preserving causal chains.
    /// - Parameter exception: The exception to map
    /// - Returns: A user-friendly failure with appropriate severity
    static func mapExceptionToFailure(_ exception: AppException) -> Failure {
        // First, check if there's a causal chain to preserve
        let innerCause: Failure?
        if let cause = exception.cause as? AppException {
            innerCause = mapExceptionToFailure(cause)
        } else {
            innerCause = nil
        }
        
        // Map based on exception type
        switch exception {
        case let networkException as NetworkException:
            return mapNetworkException(networkException, cause: innerCause)
            
        case let serverException as ServerException:
            return mapServerException(serverException, cause: innerCause)
            
        case let databaseException as DatabaseException:
            return mapDatabaseException(databaseException, cause: innerCause)
            
        case let decodingException as DecodingException:
            return mapDecodingException(decodingException, cause: innerCause)
            
        default:
            return mapUnknownException(exception, cause: innerCause)
        }
    }
    
    // MARK: - Specific Mappers
    
    private static func mapNetworkException(_ exception: NetworkException, cause: Failure?) -> NetworkFailure {
        let severity: FailureSeverity
        
        // Determine severity based on exception type
        if exception.message.contains("timeout") || exception.message.contains("unreachable") {
            severity = .warning
        } else {
            severity = .warning // Default network issues to warning
        }
        
        return NetworkFailure(
            mapNetworkMessageToUserFriendly(exception.message),
            severity: severity,
            cause: cause,
            technicalDetails: exception.description
        )
    }
    
    private static func mapServerException(_ exception: ServerException, cause: Failure?) -> ServerFailure {
        let severity: FailureSeverity
        
        // Determine severity based on status code
        if let statusCode = exception.statusCode {
            switch statusCode {
            case 400...499:
                severity = .warning // Client errors are warnings
            case 500...599:
                severity = .critical // Server errors are critical
            default:
                severity = .warning
            }
        } else {
            severity = .critical
        }
        
        return ServerFailure(
            mapServerMessageToUserFriendly(exception.message, statusCode: exception.statusCode),
            severity: severity,
            cause: cause,
            technicalDetails: exception.description,
            statusCode: exception.statusCode
        )
    }
    
    private static func mapDatabaseException(_ exception: DatabaseException, cause: Failure?) -> CacheFailure {
        let severity: FailureSeverity = .info // Database issues are usually informational
        
        return CacheFailure(
            mapDatabaseMessageToUserFriendly(exception.message),
            severity: severity,
            cause: cause,
            technicalDetails: exception.description
        )
    }
    
    private static func mapDecodingException(_ exception: DecodingException, cause: Failure?) -> ServerFailure {
        // Decoding errors are treated as server problems (malformed response)
        return ServerFailure(
            "Server returned invalid data format",
            severity: .warning,
            cause: cause,
            technicalDetails: exception.description,
            statusCode: nil
        )
    }
    
    private static func mapUnknownException(_ exception: AppException, cause: Failure?) -> ServerFailure {
        return ServerFailure(
            "An unexpected error occurred",
            severity: .critical,
            cause: cause,
            technicalDetails: exception.description,
            statusCode: nil
        )
    }
    
    // MARK: - Message Mappers
    
    private static func mapNetworkMessageToUserFriendly(_ technicalMessage: String) -> String {
        if technicalMessage.contains("timeout") {
            return "Request timed out. Please check your connection and try again."
        } else if technicalMessage.contains("unreachable") {
            return "Server is unreachable. Please check your internet connection."
        } else if technicalMessage.contains("connection") {
            return "Network connection issue. Please check your internet connection."
        } else {
            return "Network error occurred. Please check your connection and try again."
        }
    }
    
    private static func mapServerMessageToUserFriendly(_ technicalMessage: String, statusCode: Int?) -> String {
        if let code = statusCode {
            switch code {
            case 400:
                return "Invalid request. Please check your input and try again."
            case 401:
                return "Authentication required. Please log in and try again."
            case 403:
                return "You don't have permission to access this resource."
            case 404:
                return "The requested resource was not found."
            case 500:
                return "Server error occurred. Please try again later."
            case 503:
                return "Service temporarily unavailable. Please try again later."
            default:
                if code >= 400 && code < 500 {
                    return "Client error occurred. Please check your request."
                } else if code >= 500 && code < 600 {
                    return "Server error occurred. Please try again later."
                } else {
                    return "Server error occurred. Please try again."
                }
            }
        }
        
        // Fallback based on message content
        if technicalMessage.contains("Internal server error") {
            return "Server encountered an error. Please try again later."
        } else if technicalMessage.contains("Bad request") {
            return "Invalid request. Please check your input."
        } else if technicalMessage.contains("Unauthorized") {
            return "Authentication required. Please log in."
        } else {
            return "Server error occurred. Please try again later."
        }
    }
    
    private static func mapDatabaseMessageToUserFriendly(_ technicalMessage: String) -> String {
        if technicalMessage.contains("read") {
            return "Failed to read saved data."
        } else if technicalMessage.contains("write") {
            return "Failed to save data locally."
        } else if technicalMessage.contains("delete") {
            return "Failed to remove saved data."
        } else if technicalMessage.contains("connection") {
            return "Local database connection issue."
        } else {
            return "Local data storage issue occurred."
        }
    }
}

// MARK: - Convenience Extensions

extension Error {
    
    /// Converts any Error to the appropriate Failure type.
    /// If the error is already an AppException, it maps it. Otherwise, it wraps it as an unknown failure.
    func toFailure() -> Failure {
        if let appException = self as? AppException {
            return ExceptionMapper.mapExceptionToFailure(appException)
        } else {
            // For non-AppException errors, wrap as unknown failure
            return ServerFailure(
                "An unexpected error occurred",
                severity: .critical,
                cause: nil,
                technicalDetails: self.localizedDescription,
                statusCode: nil
            )
        }
    }
}
