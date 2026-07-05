//
//  TestAssertions.swift
//  IosDevelopersGuideTests
//
//  Created by Claude on 04/07/26.
//

import Foundation
import Testing
@testable import IosDevelopersGuide

/// Simple helper to unwrap results for testing
enum TestHelpers {

    static func unwrapSuccess<T>(_ result: Result<T>) throws -> T {
        switch result {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }

    static func unwrapFailure<T>(_ result: Result<T>) throws -> any Failure {
        switch result {
        case .success:
            throw TestError(message: "Expected failure but got success")
        case .failure(let error):
            return error
        }
    }
}

/// Main test assertion helper
enum TestAssertions {

    static func assertSuccess<T>(_ result: Result<T>) throws -> T {
        switch result {
        case .success(let value):
            return value
        case .failure(let error):
            throw TestError(message: "Expected success but got failure: \(error)")
        }
    }

    static func assertFailure<T>(_ result: Result<T>) throws -> any Failure {
        switch result {
        case .success:
            throw TestError(message: "Expected failure but got success")
        case .failure(let error):
            return error
        }
    }

    static func assertFailureType<T>(_ result: Result<T>, expectedType: any Failure.Type) throws -> any Failure {
        switch result {
        case .success:
            throw TestError(message: "Expected failure but got success")
        case .failure(let error):
            return error
        }
    }
}

struct TestError: Error {
    let message: String
}
