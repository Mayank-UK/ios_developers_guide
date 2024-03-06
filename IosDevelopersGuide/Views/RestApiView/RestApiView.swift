//
//  RestAPI.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct RestApiView: View {
    let links: [LinkData] = [
        LinkData(title: "_", routePath: Router.routePaths._temp),
    ]
    
    var body: some View {
        PageScaffold(
            isScrollable: false,
            pageTitle: "Rest API",
            content: {
                Spacer().frame(height: 32)
                LinksList(links: links)
            }
        )
    }
}
