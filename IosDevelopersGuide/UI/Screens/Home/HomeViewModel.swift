//
//  File.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    
    let links: [LinkData] = [
        LinkData(title: "IOS fundamentals", routePath: Router.routePaths.iosFundamentals),
        LinkData(title: "Swift fundamentals", routePath: Router.routePaths.swiftFundamentals),
        LinkData(title: "SwiftUI", routePath: Router.routePaths.swiftUi),
        LinkData(title: "UIKit", routePath: Router.routePaths.uiKit),
        LinkData(title: "Other basics", routePath: Router.routePaths.otherBasics),
        LinkData(title: "API handling", routePath: Router.routePaths.apiHandling),
        LinkData(title: "Database handling", routePath: Router.routePaths.databaseHandling),
        LinkData(title: "Architecture", routePath: Router.routePaths.architecture),
        LinkData(title: "Dependency management", routePath: Router.routePaths.dependencyManagement),
        LinkData(title: "Deployment", routePath: Router.routePaths.deployment),
        LinkData(title: "Best practices", routePath: Router.routePaths.bestPractices),
    ]
    
    // inject the usecases, repositories, services through constructor pattern but use simple utilities, data variables from within
    init() {
        
    }
}
