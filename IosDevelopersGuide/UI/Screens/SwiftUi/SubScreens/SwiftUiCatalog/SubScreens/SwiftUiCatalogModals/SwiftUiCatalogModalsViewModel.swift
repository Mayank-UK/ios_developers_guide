//
//  File.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import Foundation

@MainActor
class SwiftUiCatalogModalsViewModel: ObservableObject {
    
    let links: [LinkData] = [
        LinkData(title: "Alert", routePath: Router.routePaths.swiftUiCatalogAlert),
        LinkData(title: "Confirmation dialog", routePath: Router.routePaths.swiftUiCatalogConfirmationDialog),
        LinkData(title: "Notification", routePath: Router.routePaths.swiftUiCatalogNotification),
        LinkData(title: "Sheet", routePath: Router.routePaths.swiftUiCatalogSheet),
        LinkData(title: "Inspector", routePath: Router.routePaths.swiftUiCatalogInspector),
        LinkData(title: "Popover", routePath: Router.routePaths.swiftUiCatalogPopover),
    ]
    
    // inject the usecases, repositories, services through constructor pattern but use simple utilities, data variables from within
    init() {
        
    }
}
