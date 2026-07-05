//
//  ExceptionTests.swift
//  IosDevelopersGuideTests
//
//  Created by Claude on 04/07/26.
//

import Testing
import Foundation
@testable import IosDevelopersGuide

struct ExceptionTests {

    // MARK: - NetworkException Tests

    @Test("NetworkException should create timeout exception")
    func networkTimeoutException() throws {
        // Arrange
        let cause = URLError(.timedOut)

        // Act
        let exception = NetworkException.timeout(
            cause: cause,
            context: "Test timeout"
        )

        // Assert
        #expect(exception.localizedDescription.contains("timeout"))
        #expect(exception.context == .some("Test timeout"))
    }

    @Test("NetworkException should create no connection exception")
    func networkNoConnectionException() throws {
        // Arrange
        let cause = URLError(.notConnectedToInternet)

        // Act
        let exception = NetworkException.noConnection(
            cause: cause,
            context: "Test no connection"
        )

        // Assert
        #expect(exception.localizedDescription.contains("connection"))
        #expect(exception.context == .some("Test no connection"))
    }

    // MARK: - ServerException Tests

    @Test("ServerException should create internal server error")
    func serverInternalError() throws {
        // Act
        let exception = ServerException.internalServerError(
            statusCode: 500,
            cause: nil,
            context: "Test server error"
        )

        // Assert
        #expect(exception.statusCode == .some(500))
        #expect(exception.localizedDescription.contains("server error"))
        #expect(exception.context == "Test server error")
    }

    @Test("ServerException should create not found error")
    func serverNotFoundError() throws {
        // Act
        let exception = ServerException.notFound(
            statusCode: 404,
            cause: nil,
            context: "Test not found"
        )

        // Assert
        #expect(exception.statusCode == .some(404))
        #expect(exception.localizedDescription.contains("not found"))
    }

    @Test("ServerException should create unauthorized error")
    func serverUnauthorizedError() throws {
        // Act
        let exception = ServerException.unauthorized(
            statusCode: 401,
            cause: nil,
            context: "Test unauthorized"
        )

        // Assert
        #expect(exception.statusCode == .some(401))
        #expect(exception.localizedDescription.contains("unauthorized"))
    }

    // MARK: - DatabaseException Tests

    @Test("DatabaseException should create read failed error")
    func databaseReadFailed() throws {
        // Act
        let exception = DatabaseException.readFailed(
            cause: nil,
            context: "Test read failed"
        )

        // Assert
        #expect(exception.localizedDescription.contains("read"))
        #expect(exception.context == .some("Test read failed"))
    }

    @Test("DatabaseException should create write failed error")
    func databaseWriteFailed() throws {
        // Act
        let exception = DatabaseException.writeFailed(
            cause: nil,
            context: "Test write failed"
        )

        // Assert
        #expect(exception.localizedDescription.contains("write"))
        #expect(exception.context == .some("Test write failed"))
    }

    @Test("DatabaseException should create connection failed error")
    func databaseConnectionFailed() throws {
        // Act
        let exception = DatabaseException.connectionFailed(
            cause: nil,
            context: "Test connection failed"
        )

        // Assert
        #expect(exception.localizedDescription.contains("connection"))
        #expect(exception.context == .some("Test connection failed"))
    }

    // MARK: - DecodingException Tests

    @Test("DecodingException should create JSON decoding failed error")
    func jsonDecodingFailed() throws {
        // Act
        let exception = DecodingException.jsonDecodingFailed(
            cause: nil,
            context: "Test decoding failed"
        )

        // Assert
        #expect(exception.localizedDescription.contains("decoding"))
        #expect(exception.context == .some("Test decoding failed"))
    }

    // MARK: - Exception Hierarchy Tests

    @Test("All exceptions should conform to AppException")
    func exceptionConformance() throws {
        // Arrange & Act
        let networkException = NetworkException.timeout(
            cause: URLError(.timedOut),
            context: "Test"
        )
        let serverException = ServerException.internalServerError(
            statusCode: 500,
            cause: nil,
            context: "Test"
        )
        let dbException = DatabaseException.readFailed(
            cause: nil,
            context: "Test"
        )
        let decodingException = DecodingException.jsonDecodingFailed(
            cause: nil,
            context: "Test"
        )

        // Assert
        #expect(networkException is AppException)
        #expect(serverException is AppException)
        #expect(dbException is AppException)
        #expect(decodingException is AppException)
    }
}
