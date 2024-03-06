//
//  IosFundamentals.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct IosFundamentalsView: View {
    let links: [LinkData] = [
        LinkData(title: "Important concepts", routePath: Router.routePaths._temp),
        LinkData(title: "Installation & setup", routePath: Router.routePaths._temp),
        LinkData(title: "Development", routePath: Router.routePaths._temp),
    ]
    
    var body: some View {
        PageScaffold(
            isScrollable: false,
            pageTitle: "IOS fundamentals",
            content: {
                Spacer().frame(height: 32)
                LinksList(links: links)
            }
        )
    }
}
