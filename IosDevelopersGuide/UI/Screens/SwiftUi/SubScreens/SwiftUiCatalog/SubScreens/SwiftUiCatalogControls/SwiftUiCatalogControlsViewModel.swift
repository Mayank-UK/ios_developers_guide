//
//  File.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import Foundation

@MainActor
class SwiftUiCatalogControlsViewModel: ObservableObject {
    
    let links: [LinkData] = [
        LinkData(title: "Buttons", routePath: Router.routePaths.swiftUiCatalogButtons),
        LinkData(title: "Toggle", routePath: Router.routePaths.swiftUiCatalogToggle),
        LinkData(title: "TextField", routePath: Router.routePaths.swiftUiCatalogTextField),
        LinkData(title: "TextEditor", routePath: Router.routePaths.swiftUiCatalogTextEditor),
        LinkData(title: "SecureField", routePath: Router.routePaths.swiftUiCatalogSecureField),
        LinkData(title: "Slider", routePath: Router.routePaths.swiftUiCatalogSlider),
        LinkData(title: "Pickers", routePath: Router.routePaths.swiftUiCatalogPickers),
        LinkData(title: "Stepper", routePath: Router.routePaths.swiftUiCatalogStepper),
        LinkData(title: "Menus", routePath: Router.routePaths.swiftUiCatalogMenus),
    ]
    
    // inject the usecases, repositories, services through constructor pattern but use simple utilities, data variables from within
    init() {
        
    }
}
