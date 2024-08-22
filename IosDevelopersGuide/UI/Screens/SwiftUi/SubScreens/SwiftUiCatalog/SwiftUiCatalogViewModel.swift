//
//  File.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import Foundation

@MainActor
class SwiftUiCatalogViewModel: ObservableObject {
    
    let links: [LinkData] = [
        LinkData(title: "Controls", routePath: Router.routePaths.swiftUiCatalogControls),
        LinkData(title: "Layouts", routePath: Router.routePaths.swiftUiCatalogLayouts),
        LinkData(title: "Display elements", routePath: Router.routePaths.swiftUiCatalogDisplayElements),
        LinkData(title: "Containers", routePath: Router.routePaths.swiftUiCatalogContainers),
        LinkData(title: "Modals", routePath: Router.routePaths.swiftUiCatalogModals),
        LinkData(title: "Miscellaneous", routePath: Router.routePaths.swiftUiCatalogMiscellaneous),
    ]
    
    // inject the usecases, repositories, services through constructor pattern but use simple utilities, data variables from within
    init() {
        
    }
}
