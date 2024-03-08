//
//  SwiftUiManipulation.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiManipulationView: View {
    let links: [LinkData] = [
        LinkData(title: "Layout", routePath: Router.routePaths.swiftUiLayout),
        LinkData(title: "Dimensions and constraints", routePath: Router.routePaths.swiftUiDimensionsAndConstraints),
        LinkData(title: "Spacing", routePath: Router.routePaths.swiftUiSpacing),
        LinkData(title: "Colors and backgrounds", routePath: Router.routePaths.swiftUiColorsAndBackgrounds),
        LinkData(title: "Alignment", routePath: Router.routePaths.swiftUiAlignment),
        LinkData(title: "Text", routePath: Router.routePaths.swiftUiText),
        LinkData(title: "Borders", routePath: Router.routePaths.swiftUiBorders),
        LinkData(title: "Icons and images", routePath: Router.routePaths.swiftUiIconsAndImages),
        LinkData(title: "Effects", routePath: Router.routePaths.swiftUiEffects),
        LinkData(title: "Positioning", routePath: Router.routePaths.swiftUiPositioning),
        LinkData(title: "Visibility", routePath: Router.routePaths.swiftUiVisibility),
        LinkData(title: "Interactive behaviours", routePath: Router.routePaths.swiftUiInteractiveBehaviours),
        LinkData(title: "Hyperlinks", routePath: Router.routePaths.swiftUiHyperlinks),
        LinkData(title: "Form inputs", routePath: Router.routePaths.swiftUiFormInputs),
        LinkData(title: "Media", routePath: Router.routePaths.swiftUiMedia),
        
    ]
    
    var body: some View {
        PageScaffold(
            pageTitle: "UI manipulation",
            content: {
                Links(links: links)
            }
        )
    }
}

#Preview {
    SwiftUiManipulationView()
}
