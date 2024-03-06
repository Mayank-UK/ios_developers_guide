//
//  Deployment.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct DeploymentView: View {
    let links: [LinkData] = [
        LinkData(title: "Test build deployment", routePath: Router.routePaths._temp),
        LinkData(title: "Prod build deployment", routePath: Router.routePaths._temp),
    ]
    
    var body: some View {
        PageScaffold(
            isScrollable: false,
            pageTitle: "Deployment",
            content: {
                Spacer().frame(height: 32)
                LinksList(links: links)
            }
        )
    }
}
