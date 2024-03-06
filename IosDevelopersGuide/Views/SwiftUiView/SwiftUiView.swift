//
//  SwiftUi.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct SwiftUiView: View {
    let links: [LinkData] = [
        LinkData(title: "UI manipulation", routePath: Router.routePaths._temp),
        LinkData(title: "Life cycle", routePath: Router.routePaths._temp),
        LinkData(title: "Navigation & routing", routePath: Router.routePaths._temp),
        LinkData(title: "State management", routePath: Router.routePaths._temp),
        LinkData(title: "API handling", routePath: Router.routePaths._temp),
        LinkData(title: "Code architecture", routePath: Router.routePaths._temp),
        LinkData(title: "View catalog", routePath: Router.routePaths._temp),
        LinkData(title: "Debugging", routePath: Router.routePaths._temp),
        LinkData(title: "Testing", routePath: Router.routePaths._temp),
        LinkData(title: "Supporting classes & enums", routePath: Router.routePaths._temp),
        LinkData(title: "Native features handling", routePath: Router.routePaths._temp),
        LinkData(title: "SwiftUI best practices", routePath: Router.routePaths._temp),
    ]
    
    var body: some View {
        PageScaffold(
            isScrollable: false,
            pageTitle: "SwiftUI",
            content: {
                Spacer().frame(height: 32)
                LinksList(links: links)
            }
        )
    }
}
