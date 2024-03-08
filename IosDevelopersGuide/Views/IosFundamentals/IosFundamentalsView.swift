//
//  IosFundamentals.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct IosFundamentalsView: View {
    let links: [LinkData] = [
        LinkData(title: "Important concepts", routePath: Router.routePaths.iosImportantConcepts),
        LinkData(title: "Installation & setup", routePath: Router.routePaths.iosInstallationAndSetup),
        LinkData(title: "Development", routePath: Router.routePaths.iosDevelopment),
    ]
    
    var body: some View {
        PageScaffold(
            pageTitle: "IOS fundamentals",
            content: {
                Links(links: links)
            }
        )
    }
}

#Preview {
    IosFundamentalsView()
}
