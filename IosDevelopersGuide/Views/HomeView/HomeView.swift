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
        LinkData(title: "Rest API", routePath: Router.routePaths.restApi),
        LinkData(title: "Package manager & packages", routePath: Router.routePaths.packageManager),
        LinkData(title: "Deployment", routePath: Router.routePaths.deployment),
    ]
    
    var body: some View {
        PageScaffold(
            isScrollable: false,
            pageTitle: "Ios developer's guide",
            content: {
                Spacer().frame(height: 32)
                LinksList(links: links)
            }
        )
    }
}
