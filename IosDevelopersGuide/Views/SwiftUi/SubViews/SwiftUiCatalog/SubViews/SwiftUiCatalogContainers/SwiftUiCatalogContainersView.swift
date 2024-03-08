//
//  SwiftUiContainers.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiCatalogContainersView: View {
    let links: [LinkData] = [
        LinkData(title: "Group", routePath: Router.routePaths.swiftUiCatalogGroup),
        LinkData(title: "Form", routePath: Router.routePaths.swiftUiCatalogForm),
        LinkData(title: "Section", routePath: Router.routePaths.swiftUiCatalogSection),
        LinkData(title: "ViewThatFits", routePath: Router.routePaths.swiftUiCatalogViewThatFits),
    ]
    
    var body: some View {
        PageScaffold(
            pageTitle: "Containers",
            content: {
                Links(links: links)
            }
        )
    }
}

#Preview {
    SwiftUiCatalogContainersView()
}
