//
//  File.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import Foundation

@MainActor
class SwiftUiCatalogContainersViewModel: ObservableObject {
    
    let links: [LinkData] = [
        LinkData(title: "Group", routePath: Router.routePaths.swiftUiCatalogGroup),
        LinkData(title: "Form", routePath: Router.routePaths.swiftUiCatalogForm),
        LinkData(title: "Section", routePath: Router.routePaths.swiftUiCatalogSection),
        LinkData(title: "ViewThatFits", routePath: Router.routePaths.swiftUiCatalogViewThatFits),
    ]
    
    // inject the usecases, repositories, services through constructor pattern but use simple utilities, data variables from within
    init() {
        
    }
}
