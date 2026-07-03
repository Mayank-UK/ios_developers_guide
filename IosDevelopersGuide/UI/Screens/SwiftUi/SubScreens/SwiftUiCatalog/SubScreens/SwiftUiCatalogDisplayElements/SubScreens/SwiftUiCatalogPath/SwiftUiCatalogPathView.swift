//
//  SwiftUiPathView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogPathView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogPathViewModel
    
    func path() -> some View {
        return CustomSection(
            snippetTitle: "Path",
            snippetDescription: """
            Draw a line with different styles.
            """,
            snippetCode: """
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addCurve(to: CGPoint(x: 200, y: 10),
                              control1: CGPoint(x: 50, y: 0),
                              control2: CGPoint(x: 100, y: 20)
                )
            }
                .stroke(Color.green, lineWidth: 4)
            """,
            demoView: {
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addCurve(to: CGPoint(x: 200, y: 10),
                                  control1: CGPoint(x: 50, y: 0),
                                  control2: CGPoint(x: 100, y: 20)
                    )
                }
                    .stroke(Color.green, lineWidth: 4)
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Path",
            content: {
                path()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogPathView()
//}
