//
//  SwiftUiViewThatFitsView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogViewThatFitsView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogViewThatFitsViewModel
    
    func viewThatFits() -> some View {
        return CustomSection(
            snippetTitle: "ViewThatFits",
            snippetDescription: """
            ViewThatFits adapts to the available space by providing the first child view that fits within the constrained size.
            ViewThatFits is fantastic for creating adaptive layouts that adjust based on available screen space.
            """,
            snippetCode: """
            ViewThatFits(in: .horizontal) {
                HStack {
                    Text("50")
                    ProgressView(value: 50)
                        .frame(width: 128)
                }
                ProgressView(value: 50)
                    .frame(width: 128)
                Text("50")
            }
            """,
            demoView: {
                ViewThatFits(in: .horizontal) {
                    HStack {
                        Text("50")
                        ProgressView(value: 50)
                            .frame(width: 128)
                    }
                    ProgressView(value: 50)
                        .frame(width: 128)
                    Text("50")
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "ViewThatFits",
            content: {
                viewThatFits()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogViewThatFitsView()
//}
