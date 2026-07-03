//
//  guardedApiCall.swift
//  IosDevelopersGuide
//
//  Created by [Your Name]
//  Copyright © 2026. All rights reserved.
//

import Foundation

/// Wraps API calls to automatically catch and normalize exceptions.
/// This is used in the data source layer to convert third-party exceptions into our custom exceptions.
///
/// ## Usage Example
/// ```swift
/// func fetchPosts() async throws -> [PostDTO] {
///     return try await guardedApiCall {
///         let (data, _) = try await URLSession.shared.data(from: url)
///         return try JSONDecoder().decode([PostDTO].self, from: data)
///     }
/// }
/// ```
///
/// ## Design Philosophy
/// - **Catches Third-Party Errors**: URLError, DecodingError, etc.
/// - **Normalizes to Custom Exceptions**: Converts to our exception hierarchy
/// - **Context Preservation**: Maintains error context for debugging
/// - **Throws Custom Types**: Always throws AppException types
func guardedApiCall<T>(_ call: @escaping () async throws -> T) async throws -> T {
    do {
        return try await call()
    } catch let urlError as URLError {
        // Handle network errors
        throw mapURLError(urlError)
        
    } catch let decodingError as DecodingError {
        // Handle JSON decoding errors
        throw mapDecodingError(decodingError)
        
    } catch let appException as AppException {
        // Re-throw our custom exceptions (already normalized)
        throw appException
        
    } catch {
        // Catch any other unexpected errors
        throw ServerException("Unexpected API error", cause: error)
    }
}

// MARK: - Error Mappers

private func mapURLError(_ urlError: URLError) -> AppException {
    switch urlError.code {
    case .notConnectedToInternet, .networkConnectionLost, .cannotConnectToHost:
        return NetworkException.noConnection(cause: urlError)
        
    case .timedOut:
        return NetworkException.timeout(cause: urlError)
        
    case .serverCertificateUntrusted, .clientCertificateRejected, .secureConnectionFailed:
        return NetworkException.unreachable(cause: urlError)
        
    case .badURL, .unsupportedURL:
        return ServerException.badRequest(cause: urlError)
        
    case .httpTooManyRedirects:
        return NetworkException.unreachable(cause: urlError)
        
    default:
        // For any other URLError, treat as network issue
        return NetworkException("URL error: \(urlError.localizedDescription)", cause: urlError)
    }
}

private func mapDecodingError(_ decodingError: DecodingError) -> DecodingException {
    switch decodingError {
    case .typeMismatch(let type, let context):
        let fieldName = context.codingPath.map { $0.stringValue }.joined(separator: ".")
        return DecodingException.invalidType(
            fieldName: fieldName,
            expectedType: String(describing: type),
            cause: decodingError
        )
        
    case .valueNotFound(let type, let context):
        let fieldName = context.codingPath.map { $0.stringValue }.joined(separator: ".")
        return DecodingException.missingField(
            fieldName: fieldName,
            cause: decodingError
        )
        
    case .keyNotFound(let key, let context):
        let fieldName = context.codingPath.map { $0.stringValue }.joined(separator: ".")
        return DecodingException.missingField(
            fieldName: "\(fieldName).\(key.stringValue)",
            cause: decodingError
        )
        
    case .dataCorrupted(let context):
        return DecodingException.jsonDecodingFailed(
            cause: decodingError,
            context: "Data corrupted: \(context.debugDescription)"
        )
        
    @unknown default:
        return DecodingException.jsonDecodingFailed(cause: decodingError)
    }
}
