//
//  safeRepositoryCall.swift
//  IosDevelopersGuide
//
//  Created by [Your Name]
//  Copyright © 2026. All rights reserved.
//

import Foundation

/// Wraps repository calls to automatically catch exceptions and convert them to Result types.
/// This is used in the repository layer to provide type-safe error handling to the presentation layer.
///
/// ## Usage Example
/// ```swift
/// func getPosts() async -> Result<[Post]> {
///     return await safeRepositoryCall {
///         let remotePosts = try await remoteDataSource.fetchPosts()
///         return remotePosts.map { $0.toPost() }
///     }
/// }
/// ```
///
/// ## Advanced Usage with Fallbacks
/// ```swift
/// func getPosts() async -> Result<[Post]> {
///     return await safeRepositoryCall(
///         call: { try await remoteDataSource.fetchPosts() },
///         onNetworkError: { [weak self] error in
///             // Fallback to cache on network error
///             return await self?.fetchFromCache() ?? .failure(.notFound())
///         }
///     )
/// }
/// ```
///
/// ## Design Philosophy
/// - **Catches All Exceptions**: Never throws, always returns Result
/// - **Automatic Mapping**: Converts exceptions to failures automatically
/// - **Fallback Support**: Optional callbacks for graceful degradation
/// - **Type Safety**: Returns Result<T> for compile-time safety
func safeRepositoryCall<T>(
    call: @escaping () async throws -> T,
    onNetworkError: ((NetworkException) async -> Result<T>)? = nil,
    onServerError: ((ServerException) async -> Result<T>)? = nil,
    onDatabaseError: ((DatabaseException) async -> Result<T>)? = nil,
    onDecodingError: ((DecodingException) async -> Result<T>)? = nil
) async -> Result<T> {
    do {
        // Try to execute the call
        let result = try await call()
        return .success(result)
        
    } catch let networkException as NetworkException {
        // Handle network errors
        if let fallback = onNetworkError {
            return await fallback(networkException)
        } else {
            return .failure(ExceptionMapper.mapExceptionToFailure(networkException))
        }
        
    } catch let serverException as ServerException {
        // Handle server errors
        if let fallback = onServerError {
            return await fallback(serverException)
        } else {
            return .failure(ExceptionMapper.mapExceptionToFailure(serverException))
        }
        
    } catch let databaseException as DatabaseException {
        // Handle database errors
        if let fallback = onDatabaseError {
            return await fallback(databaseException)
        } else {
            return .failure(ExceptionMapper.mapExceptionToFailure(databaseException))
        }
        
    } catch let decodingException as DecodingException {
        // Handle decoding errors
        if let fallback = onDecodingError {
            return await fallback(decodingException)
        } else {
            return .failure(ExceptionMapper.mapExceptionToFailure(decodingException))
        }
        
    } catch let appException as AppException {
        // Catch any other custom exceptions
        return .failure(ExceptionMapper.mapExceptionToFailure(appException))
        
    } catch {
        // Catch any unexpected errors
        let unknownException = ServerException("Unexpected error", cause: error)
        return .failure(ExceptionMapper.mapExceptionToFailure(unknownException))
    }
}

// MARK: - Convenience Extensions

extension Result {
    
    /// Creates a Result from a throwing closure, automatically converting errors to failures.
    /// - Parameter call: The throwing closure to execute
    /// - Returns: A Result containing either the success value or a failure
    static func capturing<T>(
        from call: @escaping () async throws -> T
    ) async -> Result<T> where T == T {
        return await safeRepositoryCall(call: call)
    }
}
