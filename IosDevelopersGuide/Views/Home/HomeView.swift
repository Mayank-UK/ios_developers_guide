//
//  ContentView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 01/03/24.
//

import SwiftUI

struct HomeView: View {
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
    
    var body: some View {
        PageScaffold(
            pageTitle: "IOS developer's guide",
            content: {
                Links(links: links)
            }
        )
    }
}

#Preview {
    HomeView()
}
