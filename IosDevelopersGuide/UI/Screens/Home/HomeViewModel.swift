//
//  File.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import Foundation
import FactoryKit

@MainActor
class HomeViewModel: ObservableObject {

    private let logger: AppLoggerProtocol

    let links: [LinkData] = [
        LinkData(
            title: "iOS fundamentals",
            routePath: Router.routePaths.iosFundamentals,
            description: "App lifecycle, delegates, scenes, and the platform's core mental model."
        ),
        LinkData(
            title: "Swift fundamentals",
            routePath: Router.routePaths.swiftFundamentals,
            description: "Optionals, value/reference types, protocols, generics, and concurrency."
        ),
        LinkData(
            title: "SwiftUI",
            routePath: Router.routePaths.swiftUi,
            description: "Declarative views, modifiers, layouts, and the state-driven UI model."
        ),
        LinkData(
            title: "UIKit",
            routePath: Router.routePaths.uiKit,
            description: "Windows, views, view controllers, and the imperative event-driven toolkit."
        ),
        LinkData(
            title: "API handling",
            routePath: Router.routePaths.apiHandling,
            description: "URLSession, the network stack, interceptors, DTOs, and error mapping."
        ),
        LinkData(
            title: "Database handling",
            routePath: Router.routePaths.databaseHandling,
            description: "Local persistence, the database abstraction, and fake vs real sources."
        ),
        LinkData(
            title: "Architecture",
            routePath: Router.routePaths.architecture,
            description: "Clean layering, the dependency rule, and a request traced end to end."
        ),
        LinkData(
            title: "Exception handling",
            routePath: Router.routePaths.exceptionHandling,
            description: "Result<T, Failure>, exceptions, the mapper, the guards, and error UI."
        ),
        LinkData(
            title: "Dependency injection",
            routePath: Router.routePaths.dependencyInjection,
            description: "Factory-based DI, registration scopes, and resolved dependencies."
        ),
        LinkData(
            title: "Dependency management",
            routePath: Router.routePaths.dependencyManagement,
            description: "Swift Package Manager, packages, and version resolution."
        ),
        LinkData(
            title: "Testing",
            routePath: Router.routePaths.testing,
            description: "XCTest, fakes, and testing behaviour over implementation."
        ),
        LinkData(
            title: "Environment configuration",
            routePath: Router.routePaths.devEnvironment,
            description: "Build configurations, schemes, and per-environment settings."
        ),
        LinkData(
            title: "Logging",
            routePath: Router.routePaths.logging,
            description: "Structured logging, categories, and the app's logging infrastructure."
        ),
        LinkData(
            title: "Deployment",
            routePath: Router.routePaths.deployment,
            description: "Archiving, signing, and shipping to TestFlight and the App Store."
        ),
        LinkData(
            title: "Best practices",
            routePath: Router.routePaths.bestPractices,
            description: "Conventions, idioms, and the quality bar applied across the app."
        ),
    ]

    // inject the usecases, repositories, services through constructor pattern but use simple utilities, data variables from within
    init(logger: AppLoggerProtocol = Container.shared.viewModelLogger()) {
        self.logger = logger
        logger.info("HomeViewModel initialized with \(links.count) navigation links")
    }

    func navigateToTopic(_ title: String) {
        logger.notice("User navigating to topic: \(title)")
    }
}
