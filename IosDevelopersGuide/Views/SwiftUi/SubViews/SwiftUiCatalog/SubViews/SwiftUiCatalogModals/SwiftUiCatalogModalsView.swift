//
//  SwiftUiGraphicsAndDrawingsView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiCatalogModalsView: View {
    let links: [LinkData] = [
        LinkData(title: "Alert", routePath: Router.routePaths.swiftUiCatalogAlert),
        LinkData(title: "Confirmation dialog", routePath: Router.routePaths.swiftUiCatalogConfirmationDialog),
        LinkData(title: "Notification", routePath: Router.routePaths.swiftUiCatalogNotification),
        LinkData(title: "Sheet", routePath: Router.routePaths.swiftUiCatalogSheet),
        LinkData(title: "Inspector", routePath: Router.routePaths.swiftUiCatalogInspector),
        LinkData(title: "Popover", routePath: Router.routePaths.swiftUiCatalogPopover),
    ]
    
    var body: some View {
        PageScaffold(
            pageTitle: "Modals",
            content: {
                Links(links: links)
            }
        )
    }
}

#Preview {
    SwiftUiCatalogModalsView()
}
