//
//  DatabaseException.swift
//  IosDevelopersGuide
//
//  Created by [Your Name]
//  Copyright © 2026. All rights reserved.
//

import Foundation

/// Exception representing database/CoreData technical errors
struct DatabaseException: AppException {
    let message: String
    let cause: Error?
    let context: String?
    
    init(_ message: String, cause: Error? = nil, context: String? = nil) {
        self.message = message
        self.cause = cause
        self.context = context
    }
    
    // MARK: - Common Database Exceptions
    
    /// Failed to read from database
    static func readFailed(cause: Error? = nil, context: String? = nil) -> DatabaseException {
        DatabaseException("Failed to read from database", cause: cause, context: context)
    }
    
    /// Failed to write to database
    static func writeFailed(cause: Error? = nil, context: String? = nil) -> DatabaseException {
        DatabaseException("Failed to write to database", cause: cause, context: context)
    }
    
    /// Failed to delete from database
    static func deleteFailed(cause: Error? = nil, context: String? = nil) -> DatabaseException {
        DatabaseException("Failed to delete from database", cause: cause, context: context)
    }
    
    /// Database connection failed
    static func connectionFailed(cause: Error? = nil, context: String? = nil) -> DatabaseException {
        DatabaseException("Database connection failed", cause: cause, context: context)
    }
}
