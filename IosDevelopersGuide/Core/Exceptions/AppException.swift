//
//  AppException.swift
//  IosDevelopersGuide
//
//  Created by [Your Name]
//  Copyright © 2026. All rights reserved.
//

import Foundation

/// Base protocol for all application exceptions.
/// Exceptions represent technical errors that occur in the data layer and are converted to Failures for the presentation layer.
///
/// ## Design Philosophy
/// - **Technical vs Domain**: Exceptions are technical (data layer), Failures are domain (presentation layer)
/// - **Not User-Facing**: Exception messages are for debugging, not for users
/// - **Causal Chaining**: Exceptions can wrap other exceptions for debugging
/// - **Converted to Failures**: Exceptions are converted to Failures in the repository layer
protocol AppException: Error, CustomStringConvertible {
    
    /// Technical error message for debugging (not shown to users)
    var message: String { get }
    
    /// Optional underlying cause for error chaining
    var cause: Error? { get }
    
    /// Additional context about where/when the exception occurred
    var context: String? { get }
}

/// Base implementation for common exception functionality
extension AppException {
    
    /// Default context - nil unless overridden
    var context: String? {
        nil
    }
    
    /// Default description for CustomStringConvertible
    var description: String {
        var description = "Exception: \(message)"
        if let context = context {
            description += " | Context: \(context)"
        }
        if let cause = cause {
            description += " | Caused by: \(cause.localizedDescription)"
        }
        return description
    }
    
    /// Builds the full causal chain for debugging
    var chain: String {
        var chain = message
        var currentCause = cause
        while let nextCause = currentCause {
            chain += " → " + nextCause.localizedDescription
            currentCause = (nextCause as? AppException)?.cause
        }
        return chain
    }
}
