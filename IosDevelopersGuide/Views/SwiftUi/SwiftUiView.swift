//
//  SwiftUi.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct SwiftUiView: View {
    let links: [LinkData] = [
        LinkData(title: "UI manipulation", routePath: Router.routePaths.swiftUiManipulation),
        LinkData(title: "Life cycle", routePath: Router.routePaths.swiftUiLifeCycle),
        LinkData(title: "Navigation & routing", routePath: Router.routePaths.swiftUiNavigationAndRouting),
        LinkData(title: "State management", routePath: Router.routePaths.swiftUiStateManagement),
        LinkData(title: "API handling", routePath: Router.routePaths.swiftUiApiHandling),
        LinkData(title: "Code architecture", routePath: Router.routePaths.swiftUiCodeArchitecture),
        LinkData(title: "Views and modifiers catalog", routePath: Router.routePaths.swiftUiCatalog),
        LinkData(title: "Debugging", routePath: Router.routePaths.swiftUiDebugging),
        LinkData(title: "Testing", routePath: Router.routePaths.swiftUiTesting),
        LinkData(title: "Supporting classes & enums", routePath: Router.routePaths.swiftUiSuppportingClassesAndEnums),
        LinkData(title: "Native features", routePath: Router.routePaths.swiftUiNativeFeaturesHandling),
        LinkData(title: "Responsive design", routePath: Router.routePaths.swiftUiResponsiveDesign),
        LinkData(title: "SwiftUI best practices", routePath: Router.routePaths.swiftUiBestPractices),
    ]
    
    var body: some View {
        PageScaffold(
            pageTitle: "SwiftUI",
            content: {
                Links(links: links)
            }
        )
    }
}

#Preview {
    SwiftUiView()
}
