//
//  ExceptionMapperTests.swift
//  IosDevelopersGuideTests
//
//  Created by Claude on 04/07/26.
//

import Testing
import Foundation
@testable import IosDevelopersGuide

struct ExceptionMapperTests {

    // MARK: - NetworkException Mapping Tests

    @Test("ExceptionMapper should map timeout to NetworkFailure")
    func mapTimeoutToNetworkFailure() throws {
        // Arrange
        let exception = NetworkException.timeout(
            cause: URLError(.timedOut),
            context: "Test timeout"
        )

        // Act
        let failure = ExceptionMapper.mapExceptionToFailure(exception)

        // Assert
        #expect(failure is NetworkFailure)
        let networkFailure = failure as! NetworkFailure
        #expect(networkFailure.severity == .warning)
        #expect(networkFailure.localizedDescription.contains("timed"))
    }

    @Test("ExceptionMapper should map no connection to NetworkFailure")
    func mapNoConnectionToNetworkFailure() throws {
        // Arrange
        let exception = NetworkException.noConnection(
            cause: URLError(.notConnectedToInternet),
            context: "Test no connection"
        )

        // Act
        let failure = ExceptionMapper.mapExceptionToFailure(exception)

        // Assert
        #expect(failure is NetworkFailure)
        let networkFailure = failure as! NetworkFailure
        #expect(networkFailure.severity == .warning)
    }

    // MARK: - ServerException Mapping Tests

    @Test("ExceptionMapper should map internal server error to ServerFailure")
    func mapInternalServerErrorToServerFailure() throws {
        // Arrange
        let exception = ServerException.internalServerError(
            statusCode: 500,
            cause: nil,
            context: "Test internal error"
        )

        // Act
        let failure = ExceptionMapper.mapExceptionToFailure(exception)

        // Assert
        #expect(failure is ServerFailure)
        let serverFailure = failure as! ServerFailure
        #expect(serverFailure.statusCode == .some(500))
        #expect(serverFailure.severity == .critical)
    }

    @Test("ExceptionMapper should map not found to ServerFailure")
    func mapNotFoundToServerFailure() throws {
        // Arrange
        let exception = ServerException.notFound(
            statusCode: 404,
            cause: nil,
            context: "Test not found"
        )

        // Act
        let failure = ExceptionMapper.mapExceptionToFailure(exception)

        // Assert
        #expect(failure is ServerFailure)
        let serverFailure = failure as! ServerFailure
        #expect(serverFailure.statusCode == .some(404))
        #expect(serverFailure.severity == .warning)
    }

    @Test("ExceptionMapper should map unauthorized to ServerFailure")
    func mapUnauthorizedToServerFailure() throws {
        // Arrange
        let exception = ServerException.unauthorized(
            statusCode: 401,
            cause: nil,
            context: "Test unauthorized"
        )

        // Act
        let failure = ExceptionMapper.mapExceptionToFailure(exception)

        // Assert
        #expect(failure is ServerFailure)
        let serverFailure = failure as! ServerFailure
        #expect(serverFailure.statusCode == .some(401))
        #expect(serverFailure.severity == .warning)
    }

    // MARK: - DatabaseException Mapping Tests

    @Test("ExceptionMapper should map read failed to CacheFailure")
    func mapReadFailedToCacheFailure() throws {
        // Arrange
        let exception = DatabaseException.readFailed(
            cause: nil,
            context: "Test read failed"
        )

        // Act
        let failure = ExceptionMapper.mapExceptionToFailure(exception)

        // Assert
        #expect(failure is CacheFailure)
        let cacheFailure = failure as! CacheFailure
        #expect(cacheFailure.severity == .info)
    }

    @Test("ExceptionMapper should map write failed to CacheFailure")
    func mapWriteFailedToCacheFailure() throws {
        // Arrange
        let exception = DatabaseException.writeFailed(
            cause: nil,
            context: "Test write failed"
        )

        // Act
        let failure = ExceptionMapper.mapExceptionToFailure(exception)

        // Assert
        #expect(failure is CacheFailure)
        let cacheFailure = failure as! CacheFailure
        #expect(cacheFailure.severity == .info)
    }

    @Test("ExceptionMapper should map connection failed to CacheFailure")
    func mapConnectionFailedToCacheFailure() throws {
        // Arrange
        let exception = DatabaseException.connectionFailed(
            cause: nil,
            context: "Test connection failed"
        )

        // Act
        let failure = ExceptionMapper.mapExceptionToFailure(exception)

        // Assert
        #expect(failure is CacheFailure)
        let cacheFailure = failure as! CacheFailure
        #expect(cacheFailure.severity == .info)
    }

    // MARK: - DecodingException Mapping Tests

    @Test("ExceptionMapper should map JSON decoding failed to ServerFailure")
    func mapJsonDecodingFailedToServerFailure() throws {
        // Arrange
        let exception = DecodingException.jsonDecodingFailed(
            cause: nil,
            context: "Test decoding failed"
        )

        // Act
        let failure = ExceptionMapper.mapExceptionToFailure(exception)

        // Assert
        #expect(failure is ServerFailure)
        let serverFailure = failure as! ServerFailure
        #expect(serverFailure.severity == .warning)
    }

    // MARK: - Failure Severity Tests

    @Test("Critical failures should have critical severity")
    func criticalSeverityMapping() throws {
        // Arrange & Act
        let serverFailure = ExceptionMapper.mapExceptionToFailure(
            ServerException.internalServerError(statusCode: 500, cause: nil, context: "Test")
        )

        // Assert
        #expect((serverFailure as? ServerFailure)?.severity == .critical)
    }

    @Test("Warning failures should have warning severity")
    func warningSeverityMapping() throws {
        // Arrange & Act
        let notFoundFailure = ExceptionMapper.mapExceptionToFailure(
            ServerException.notFound(statusCode: 404, cause: nil, context: "Test")
        )
        let decodingFailure = ExceptionMapper.mapExceptionToFailure(
            DecodingException.jsonDecodingFailed(cause: nil, context: "Test")
        )
        let networkFailure = ExceptionMapper.mapExceptionToFailure(
            NetworkException.timeout(cause: URLError(.timedOut), context: "Test")
        )

        // Assert
        #expect((notFoundFailure as? ServerFailure)?.severity == .warning)
        #expect((decodingFailure as? ServerFailure)?.severity == .warning)
        #expect((networkFailure as? NetworkFailure)?.severity == .warning)
    }

    @Test("Info failures should have info severity")
    func infoSeverityMapping() throws {
        // Arrange & Act
        let connectionFailure = ExceptionMapper.mapExceptionToFailure(
            DatabaseException.connectionFailed(cause: nil, context: "Test")
        )
        let readFailure = ExceptionMapper.mapExceptionToFailure(
            DatabaseException.readFailed(cause: nil, context: "Test")
        )

        // Assert
        #expect((connectionFailure as? CacheFailure)?.severity == .info)
        #expect((readFailure as? CacheFailure)?.severity == .info)
    }
}
