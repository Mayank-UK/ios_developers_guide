//
//  SwiftUiOverlayView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogOverlayView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogOverlayViewModel
    
    func overlay() -> some View {
        return CustomSection(
            snippetTitle: "Overlay",
            snippetDescription: """
            Overlay modifier allows you to layer views on top of each other.
            In the below example a circle is overlayed on a rectangle.
            """,
            snippetCode: """
            Rectangle()
                .frame(width: 128, height: 64)
                .overlay(
                    Circle()
                        .stroke(.red)
                )
            """,
            demoView: {
                Rectangle()
                    .frame(width: 128, height: 64)
                    .overlay(
                        Circle()
                            .stroke(.red)
                    )
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Overlay",
            content: {
                overlay()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogOverlayView()
//}
