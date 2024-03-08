//
//  UiManipulationLayout.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiLayoutView: View {
    let links: [LinkData] = [
        LinkData(title: "Page layout", routePath: Router.routePaths.swiftUiPageLayout),
        LinkData(title: "Basic layout", routePath: Router.routePaths.swiftUiBasicLayout),
    ]
    
    var body: some View {
        PageScaffold(
            pageTitle: "Layouts",
            content: {
                Links(links: links)
            }
        )
    }

}

#Preview {
    SwiftUiLayoutView()
}
