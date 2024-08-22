//
//  File.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import Foundation

@MainActor
class SwiftUiCatalogLayoutsViewModel: ObservableObject {
    
    let links: [LinkData] = [
        LinkData(title: "Stacks", routePath: Router.routePaths.swiftUiCatalogStacks),
        LinkData(title: "List", routePath: Router.routePaths.swiftUiCatalogList),
        LinkData(title: "ForEach", routePath: Router.routePaths.swiftUiCatalogForEach),
        LinkData(title: "Grid", routePath: Router.routePaths.swiftUiCatalogGrids),
        LinkData(title: "NavigationStack", routePath: Router.routePaths.swiftUiCatalogNavigationStack),
        LinkData(title: "NavigationSplitView", routePath: Router.routePaths.swiftUiCatalogNavigationSplitView),
        LinkData(title: "Tab", routePath: Router.routePaths.swiftUiCatalogTab),
        LinkData(title: "ScrollView", routePath: Router.routePaths.swiftUiCatalogScrollView),
        LinkData(title: "GeometryReader", routePath: Router.routePaths.swiftUiCatalogGeometryReader),
        LinkData(title: "Background", routePath: Router.routePaths.swiftUiCatalogBackground),
        LinkData(title: "Overlay", routePath: Router.routePaths.swiftUiCatalogOverlay),
        LinkData(title: "DisclosureGroup", routePath: Router.routePaths.swiftUiCatalogDisclosureGroup),
        LinkData(title: "OutlineGroup", routePath: Router.routePaths.swiftUiCatalogOutlineGroup),
        LinkData(title: "Toolbar", routePath: Router.routePaths.swiftUiCatalogToolbar),
        LinkData(title: "Frame", routePath: Router.routePaths.swiftUiCatalogFrame),
        LinkData(title: "SafeAreaInset", routePath: Router.routePaths.swiftUiCatalogSafeAreaInset),
        LinkData(title: "Empty", routePath: Router.routePaths.swiftUiCatalogEmptyView),
    ]
    
    // inject the usecases, repositories, services through constructor pattern but use simple utilities, data variables from within
    init() {
        
    }
}
