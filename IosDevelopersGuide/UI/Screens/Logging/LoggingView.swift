//
//  LoggingView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import SwiftUI

struct LoggingView: View {
    // inject the viewModel from route
    @StateObject var viewModel: LoggingViewModel
    
    func basics() -> some View {
        return CustomSection(
            snippetTitle: "Logging with OSLog (Unified Logging)",
            snippetDescription: """
            The project logs through Apple's Unified Logging System (OSLog) via an AppLoggerProtocol abstraction, with OSLogLogger as the production implementation. Each logger is created with a LogCategory (Database, Network, UI, Analytics, Repository, ViewModel, General) under a shared subsystem, so logs can be filtered in Console.app or Instruments.

            Five severity levels map directly to OSLog types: debug, info, notice, error and fault. Each call also takes a PrivacyLevel (.publicData, .privateData, .sensitive) so personal data is never written to logs in the clear — public data is visible in Console, while private / sensitive data is redacted unless captured from a trusted device.

            Because logging sits behind a protocol, tests can inject a fake / null logger, and debug logs are compiled out entirely in release builds (#if DEBUG).
            """,
            snippetCode: """
            protocol AppLoggerProtocol {
                func debug(_ message: String, privacy: PrivacyLevel, file: String, function: String, line: Int)
                func info(_ message: String, privacy: PrivacyLevel, file: String, function: String, line: Int)
                func notice(_ message: String, privacy: PrivacyLevel, file: String, function: String, line: Int)
                func error(_ message: String, privacy: PrivacyLevel, file: String, function: String, line: Int)
                func fault(_ message: String, privacy: PrivacyLevel, file: String, function: String, line: Int)
            }

            enum LogCategory: String {
                case database, network, ui, analytics, repository, viewModel, general
            }

            enum PrivacyLevel { case publicData, privateData, sensitive }

            final class OSLogLogger: AppLoggerProtocol {
                private let logger: Logger
                init(category: LogCategory, subsystem: String = "com.iosdevelopers.guide") {
                    self.logger = Logger(subsystem: subsystem, category: category.rawValue)
                }
            }

            // Usage inside a repository — private data is auto-redacted in Console.app
            logger.error("Network error: \\(error.localizedDescription)", privacy: .privateData)
            logger.notice("Cached \\(posts.count) posts")
            """
        )
    }

    var body: some View {
        PageScaffold(
            pageTitle: "Logging",
            content: {
                basics()
            }
        )
    }
}

//#Preview {
//    TempView()
//}
