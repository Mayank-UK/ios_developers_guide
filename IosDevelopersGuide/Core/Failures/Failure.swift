//
//  Failure.swift
//  IosDevelopersGuide
//
//  Created by [Your Name]
//  Copyright © 2026. All rights reserved.
//

import Foundation

/// The severity level of a failure, which determines UI behavior.
enum FailureSeverity: String {
    /// Informational - non-blocking, shows as subtle notification
    case info
    
    /// Warning - non-blocking, shows as banner or snackbar
    case warning
    
    /// Critical - blocking, shows as full error screen with retry option
    case critical
    
    /// User-friendly display name
    var displayName: String {
        switch self {
        case .info: return "Info"
        case .warning: return "Warning"
        case .critical: return "Error"
        }
    }
    
    /// System icon for the severity level
    var iconName: String {
        switch self {
        case .info: return "info.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .critical: return "xmark.circle.fill"
        }
    }
}

/// Base protocol for all failure types.
/// Failures represent domain-level errors that are meaningful to the business logic and UI layer.
///
/// ## Design Philosophy
/// - **Failures vs Exceptions**: Exceptions are technical (data layer), Failures are domain (presentation layer)
/// - **Severity-based**: UI behavior is determined by severity level
/// - **Causal Chaining**: Failures can chain to show error propagation path
/// - **User-friendly**: Messages are ready for direct display to users
protocol Failure: Error, CustomStringConvertible {
    
    /// The user-facing error message
    var message: String { get }
    
    /// The severity level that determines UI presentation
    var severity: FailureSeverity { get }
    
    /// Optional causal failure for error chaining
    var cause: Failure? { get }
    
    /// Technical details for debugging (not shown to users)
    var technicalDetails: String? { get }
    
    /// Checks equality with another failure
    func isEqual(to other: Failure) -> Bool
}

/// Base implementation for common failure functionality
extension Failure {
    
    /// Default technical details - generates from message and cause
    var technicalDetails: String? {
        var details = "Failure: \(message)"
        if let cause = cause {
            details += "\nCaused by: \(cause.description)"
        }
        return details
    }
    
    /// Default description for CustomStringConvertible
    var description: String {
        if let cause = cause {
            return "\(message) (caused by: \(cause.message))"
        }
        return message
    }
    
    /// Builds the full causal chain for debugging
    var chain: String {
        var chain = message
        var currentCause = cause
        while let nextCause = currentCause {
            chain += " → " + nextCause.message
            currentCause = nextCause.cause
        }
        return chain
    }
}

// MARK: - Equatable Support for Failure Protocol

extension Failure where Self: Equatable {
    func isEqual(to other: Failure) -> Bool {
        guard let other = other as? Self else { return false }
        return self == other
    }
}

// MARK: - Sendable Concurrency Support

@available(iOS 13.0, *)
extension Failure {
    // Failures are Sendable when their properties are Sendable
    // Concrete types will need to conform individually
}
