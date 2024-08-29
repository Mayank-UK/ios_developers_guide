//
//  File.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import Foundation

@MainActor
class SwiftUiOtherBasicsViewModel: ObservableObject {
    
    let links: [LinkData] = [
        LinkData(title: "Background tasks", routePath: Router.routePaths.swiftUiBackgroundTask),
        LinkData(title: "Notification center", routePath: Router.routePaths.swiftUiNotificationCenter),
        LinkData(title: "Notifications", routePath: Router.routePaths.swiftUiNotification),
    ]
    
    // inject the usecases, repositories, services through constructor pattern but use simple utilities, data variables from within
    init() {
        
    }
}
