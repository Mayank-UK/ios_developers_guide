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
        LinkData(title: "IOS fundamentals", routePath: Router.routePaths.iosFundamentals),
        LinkData(title: "Swift fundamentals", routePath: Router.routePaths.swiftFundamentals),
        LinkData(title: "SwiftUI", routePath: Router.routePaths.swiftUi),
        LinkData(title: "UIKit", routePath: Router.routePaths.uiKit),
        LinkData(title: "API handling", routePath: Router.routePaths.apiHandling),
        LinkData(title: "Database handling", routePath: Router.routePaths.databaseHandling),
        LinkData(title: "Architecture", routePath: Router.routePaths.architecture),
        LinkData(title: "Dependency injection", routePath: Router.routePaths.dependencyInjection),
        LinkData(title: "Dependency management", routePath: Router.routePaths.dependencyManagement),
        LinkData(title: "Deployment", routePath: Router.routePaths.deployment),
        LinkData(title: "Best practices", routePath: Router.routePaths.bestPractices),
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
