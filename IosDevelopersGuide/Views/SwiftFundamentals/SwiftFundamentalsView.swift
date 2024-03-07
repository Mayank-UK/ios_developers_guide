//
//  SwiftFundamentals.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct SwiftFundamentalsView: View {
    let links: [LinkData] = [
        LinkData(title: "Installation", routePath: Router.routePaths.swiftInstallation),
        LinkData(title: "Introduction", routePath: Router.routePaths.swiftIntroduction),
        LinkData(title: "Variables & constants", routePath: Router.routePaths.swiftVariablesAndConstants),
        LinkData(title: "Data types", routePath: Router.routePaths.swiftDataTypes),
        LinkData(title: "Input and output", routePath: Router.routePaths.swiftInputAndOutput),
        LinkData(title: "Expressions & statements", routePath: Router.routePaths.swiftExpressionsAndStatements),
        LinkData(title: "Comments", routePath: Router.routePaths.swiftComments),
        LinkData(title: "Optionals", routePath: Router.routePaths.swiftOptionals),
        LinkData(title: "Operators", routePath: Router.routePaths.swiftOperators),
        LinkData(title: "Control flow", routePath: Router.routePaths.swiftControlFlow),
        LinkData(title: "Collections", routePath: Router.routePaths.swiftCollections),
        LinkData(title: "Functions", routePath: Router.routePaths.swiftFunctions),
        LinkData(title: "OOP", routePath: Router.routePaths.swiftOop),
        LinkData(title: "Enum & structs", routePath: Router.routePaths.swiftEnumAndStructs),
        LinkData(title: "Advanced", routePath: Router.routePaths.swiftAdvanced),
    ]
    
    var body: some View {
        PageScaffold(
            pageTitle: "Swift fundamentals",
            content: {
                Spacer().frame(height: 32)
                Links(links: links)
            }
        )
    }
}

#Preview {
    SwiftFundamentalsView()
}
