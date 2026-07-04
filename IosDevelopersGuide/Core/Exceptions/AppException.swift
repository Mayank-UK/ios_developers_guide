//
//  AppException.swift
//  IosDevelopersGuide
//
//  Created by [Your Name]
//  Copyright © 2026. All rights reserved.
//

import Foundation

protocol AppException: Error, CustomStringConvertible {
    
    var message: String { get }
    
    var cause: Error? { get }
    
    var context: String? { get }
}

extension AppException {
    
    var context: String? {
        nil
    }
    
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
