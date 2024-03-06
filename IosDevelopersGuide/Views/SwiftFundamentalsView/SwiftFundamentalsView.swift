//
//  SwiftFundamentals.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct SwiftFundamentalsView: View {
    let links: [LinkData] = [
        LinkData(title: "Installation", routePath: Router.routePaths._temp),
        LinkData(title: "Introduction", routePath: Router.routePaths._temp),
        LinkData(title: "Variables & constants", routePath: Router.routePaths._temp),
        LinkData(title: "Data types", routePath: Router.routePaths._temp),
        LinkData(title: "Input and output", routePath: Router.routePaths._temp),
        LinkData(title: "Expressions & statements", routePath: Router.routePaths._temp),
        LinkData(title: "Comments", routePath: Router.routePaths._temp),
        LinkData(title: "Optionals", routePath: Router.routePaths._temp),
        LinkData(title: "Operators", routePath: Router.routePaths._temp),
        LinkData(title: "Control flow", routePath: Router.routePaths._temp),
        LinkData(title: "Collections", routePath: Router.routePaths._temp),
        LinkData(title: "Functions", routePath: Router.routePaths._temp),
        LinkData(title: "OOP", routePath: Router.routePaths._temp),
        LinkData(title: "Enum & structs", routePath: Router.routePaths._temp),
        LinkData(title: "Advanced", routePath: Router.routePaths._temp),
    ]
    
    var body: some View {
        PageScaffold(
            isScrollable: false,
            pageTitle: "Swift fundamentals",
            content: {
                Spacer().frame(height: 32)
                LinksList(links: links)
            }
        )
    }
}
