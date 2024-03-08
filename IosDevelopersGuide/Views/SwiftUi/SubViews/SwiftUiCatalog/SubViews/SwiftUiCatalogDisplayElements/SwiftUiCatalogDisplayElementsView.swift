//
//  SwiftUiTextAndDisplayView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiCatalogDisplayElementsView: View {
    let links: [LinkData] = [
        LinkData(title: "Text", routePath: Router.routePaths.swiftUiCatalogText),
        LinkData(title: "Image", routePath: Router.routePaths.swiftUiCatalogImage),
        LinkData(title: "Link", routePath: Router.routePaths.swiftUiCatalogLink),
        LinkData(title: "WebView", routePath: Router.routePaths.swiftUiCatalogWebView),
        LinkData(title: "Label", routePath: Router.routePaths.swiftUiCatalogLabel),
        LinkData(title: "ProgressView", routePath: Router.routePaths.swiftUiCatalogProgressView),
        LinkData(title: "Gauge", routePath: Router.routePaths.swiftUiCatalogContentUnavailable),
        LinkData(title: "ContentUnavailable", routePath: Router.routePaths.swiftUiCatalogContentUnavailable),
        LinkData(title: "Shapes", routePath: Router.routePaths.swiftUiCatalogShapes),
        LinkData(title: "Path", routePath: Router.routePaths.swiftUiCatalogPath),
        LinkData(title: "Canvas", routePath: Router.routePaths.swiftUiCatalogCanvas),
        LinkData(title: "Color", routePath: Router.routePaths.swiftUiCatalogColor),
        LinkData(title: "Gradient", routePath: Router.routePaths.swiftUiCatalogGradient),
        LinkData(title: "Spacer", routePath: Router.routePaths.swiftUiCatalogSpacer),
        LinkData(title: "Divider", routePath: Router.routePaths.swiftUiCatalogDivider),
        LinkData(title: "Chart", routePath: Router.routePaths.swiftUiCatalogChart),
        LinkData(title: "Map", routePath: Router.routePaths.swiftUiCatalogMap),
        LinkData(title: "Table", routePath: Router.routePaths.swiftUiCatalogTable),
    ]
    
    var body: some View {
        PageScaffold(
            pageTitle: "Display elements",
            content: {
                Links(links: links)
            }
        )
    }
}

#Preview {
    SwiftUiCatalogDisplayElementsView()
}
