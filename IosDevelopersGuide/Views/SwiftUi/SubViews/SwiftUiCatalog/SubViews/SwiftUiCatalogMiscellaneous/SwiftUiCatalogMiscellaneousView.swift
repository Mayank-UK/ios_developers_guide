//
//  SwiftUiMiscellaneousView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiCatalogMiscellaneousView: View {
    let links: [LinkData] = [
//        LinkData(title: "_", routePath: Router.routePaths._),
    ]
    
    var body: some View {
        PageScaffold(
            pageTitle: "Miscellaneous",
            content: {
                Links(links: links)
            }
        )
    }
}

#Preview {
    SwiftUiCatalogMiscellaneousView()
}
