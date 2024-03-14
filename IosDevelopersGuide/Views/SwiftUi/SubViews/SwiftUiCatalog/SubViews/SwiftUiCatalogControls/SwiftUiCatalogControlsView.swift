//
//  SwiftUiControls.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiCatalogControlsView: View {
    let links: [LinkData] = [
        LinkData(title: "Buttons", routePath: Router.routePaths.swiftUiCatalogButtons),
        LinkData(title: "Toggle", routePath: Router.routePaths.swiftUiCatalogToggle),
        LinkData(title: "TextFields", routePath: Router.routePaths.swiftUiCatalogTextField),
        LinkData(title: "Slider", routePath: Router.routePaths.swiftUiCatalogSlider),
        LinkData(title: "Pickers", routePath: Router.routePaths.swiftUiCatalogPickers),
        LinkData(title: "Stepper", routePath: Router.routePaths.swiftUiCatalogStepper),
        LinkData(title: "Menus", routePath: Router.routePaths.swiftUiCatalogMenus),
    ]
    
    var body: some View {
        PageScaffold(
            pageTitle: "Controls",
            content: {
                Links(links: links)
            }
        )
    }
}

#Preview {
    SwiftUiCatalogControlsView()
}
