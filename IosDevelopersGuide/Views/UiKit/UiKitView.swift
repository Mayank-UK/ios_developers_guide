//
//  UiKit.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct UiKitView: View {
    let links: [LinkData] = [
        LinkData(title: "_", routePath: Router.routePaths._temp),
    ]
    
    var body: some View {
        PageScaffold(
            pageTitle: "UIKit",
            content: {
                Spacer().frame(height: 32)
                Links(links: links)
            }
        )
    }
}

#Preview {
    UiKitView()
}
