//
//  Deployment.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct DeploymentView: View {
    let links: [LinkData] = [
        LinkData(title: "Test build deployment", routePath: Router.routePaths.deploymentTestBuild),
        LinkData(title: "Prod build deployment", routePath: Router.routePaths.deploymentProdBuild),
    ]
    
    var body: some View {
        PageScaffold(
            pageTitle: "Deployment",
            content: {
                Links(links: links)
            }
        )
    }
}


#Preview {
    DeploymentView()
}
