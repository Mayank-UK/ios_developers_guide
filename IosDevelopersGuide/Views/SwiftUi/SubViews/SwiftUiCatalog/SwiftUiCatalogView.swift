//
//  SwiftUiViewCatalog.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiCatalogView: View {
    let links: [LinkData] = [
        LinkData(title: "Controls", routePath: Router.routePaths.swiftUiCatalogControls),
        LinkData(title: "Layouts", routePath: Router.routePaths.swiftUiCatalogLayouts),
        LinkData(title: "Display elements", routePath: Router.routePaths.swiftUiCatalogDisplayElements),
        LinkData(title: "Containers", routePath: Router.routePaths.swiftUiCatalogContainers),
        LinkData(title: "Modals", routePath: Router.routePaths.swiftUiCatalogModals),
        LinkData(title: "Miscellaneous", routePath: Router.routePaths.swiftUiCatalogMiscellaneous),
    ]
    
    var body: some View {
        PageScaffold(
            pageTitle: "SwiftUI views and modifiers catalog",
            content: {
                Links(links: links)
            }
        )
    }
}

#Preview {
    SwiftUiCatalogView()
}
