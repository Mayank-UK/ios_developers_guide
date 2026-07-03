//
//  ResultType.swift
//  IosDevelopersGuide
//
//  Created by [Your Name]
//  Copyright © 2026. All rights reserved.
//

import Foundation

/// A type-safe result wrapper that represents either a success with a value, or a failure with an error.
/// This provides a structured alternative to throwing exceptions across layer boundaries.
///
/// ## Usage Example
/// ```swift
/// func fetchPosts() async -> Result<[Post]> {
///     do {
///         let posts = try await apiService.fetchPosts()
///         return .success(posts)
///     } catch {
///         return .failure(NetworkFailure("Failed to fetch posts"))
///     }
/// }
///
/// // Consuming the result
/// let result = await fetchPosts()
/// switch result {
/// case .success(let posts):
///     print("Fetched \(posts.count) posts")
/// case .failure(let failure):
///     print("Error: \(failure.message)")
/// }
/// ```
enum Result<T> {
    
    /// Represents a successful operation with an associated value.
    case success(T)
    
    /// Represents a failed operation with an associated failure.
    case failure(Failure)
    
    // MARK: - Computed Properties
    
    /// Returns `true` if the result is a success, `false` otherwise.
    var isSuccess: Bool {
        if case .success = self {
            return true
        }
        return false
    }
    
    /// Returns `true` if the result is a failure, `false` otherwise.
    var isFailure: Bool {
        !isSuccess
    }
    
    /// Returns the success value if available, `nil` otherwise.
    var successValue: T? {
        if case .success(let value) = self {
            return value
        }
        return nil
    }
    
    /// Returns the failure if available, `nil` otherwise.
    var failureValue: Failure? {
        if case .failure(let failure) = self {
            return failure
        }
        return nil
    }
    
    // MARK: - Transformations
    
    /// Maps the success value to a new type using the provided transform.
    /// - Parameter transform: A closure that transforms the success value.
    /// - Returns: A new result with the transformed success value, or the original failure.
    func map<U>(_ transform: (T) -> U) -> Result<U> {
        switch self {
        case .success(let value):
            return .success(transform(value))
        case .failure(let failure):
            return .failure(failure)
        }
    }
    
    /// Flat maps the success value to a new result using the provided transform.
    /// - Parameter transform: A closure that transforms the success value into a new result.
    /// - Returns: The result of the transform, or the original failure.
    func flatMap<U>(_ transform: (T) -> Result<U>) -> Result<U> {
        switch self {
        case .success(let value):
            return transform(value)
        case .failure(let failure):
            return .failure(failure)
        }
    }
    
    /// Maps the failure to a new result using the provided recover transform.
    /// - Parameter recover: A closure that attempts to recover from the failure.
    /// - Returns: The original success, or the result of the recovery attempt.
    func recover(with recover: (Failure) -> Result<T>) -> Result<T> {
        switch self {
        case .success:
            return self
        case .failure(let failure):
            return recover(failure)
        }
    }
    
    /// Returns the success value, or throws the failure as an error.
    /// - Throws: The failure if the result is not a success.
    /// - Returns: The success value.
    func get() throws -> T {
        switch self {
        case .success(let value):
            return value
        case .failure(let failure):
            throw failure
        }
    }
    
    /// Returns the success value, or a default value if the result is a failure.
    /// - Parameter defaultValue: The default value to return if the result is a failure.
    /// - Returns: The success value, or the default value.
    func or(_ defaultValue: T) -> T {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return defaultValue
        }
    }
    
    // MARK: - Side Effects
    
    /// Executes the provided closure if the result is a success.
    /// - Parameter onSuccess: A closure to execute with the success value.
    /// - Returns: The original result for chaining.
    @discardableResult
    func onSuccess(_ onSuccess: (T) -> Void) -> Result<T> {
        if case .success(let value) = self {
            onSuccess(value)
        }
        return self
    }
    
    /// Executes the provided closure if the result is a failure.
    /// - Parameter onFailure: A closure to execute with the failure.
    /// - Returns: The original result for chaining.
    @discardableResult
    func onFailure(_ onFailure: (Failure) -> Void) -> Result<T> {
        if case .failure(let failure) = self {
            onFailure(failure)
        }
        return self
    }
}

// MARK: - Equatable Conformance

extension Result: Equatable where T: Equatable {
    static func == (lhs: Result<T>, rhs: Result<T>) -> Bool {
        switch (lhs, rhs) {
        case (.success(let lhsValue), .success(let rhsValue)):
            return lhsValue == rhsValue
        case (.failure(let lhsFailure), .failure(let rhsFailure)):
            return lhsFailure.isEqual(to: rhsFailure)
        default:
            return false
        }
    }
}

// MARK: - Sendable Concurrency Support

@available(iOS 13.0, *)
extension Result: Sendable where T: Sendable {
}

// MARK: - Custom String Convertible

extension Result: CustomStringConvertible {
    var description: String {
        switch self {
        case .success(let value):
            return "Success(\(value))"
        case .failure(let failure):
            return "Failure(\(failure))"
        }
    }
}
