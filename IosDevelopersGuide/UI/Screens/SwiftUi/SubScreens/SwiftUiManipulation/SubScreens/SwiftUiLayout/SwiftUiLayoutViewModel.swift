//
//  File.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import Foundation

@MainActor
class SwiftUiLayoutViewModel: ObservableObject {
    
    let links: [LinkData] = [
        LinkData(title: "Page layout", routePath: Router.routePaths.swiftUiPageLayout),
        LinkData(title: "Basic layout", routePath: Router.routePaths.swiftUiBasicLayout),
    ]
    
    // inject the usecases, repositories, services through constructor pattern but use simple utilities, data variables from within
    init() {
        
    }
}
