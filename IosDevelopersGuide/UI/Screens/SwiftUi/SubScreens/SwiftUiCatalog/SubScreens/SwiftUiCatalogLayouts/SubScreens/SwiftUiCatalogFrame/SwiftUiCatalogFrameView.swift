//
//  SwiftUiFrameView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogFrameView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogFrameViewModel
    
    func frame() -> some View {
        return CustomSection(
            snippetTitle: "Frame",
            snippetDescription: """
            Frame modifier allows you to specify a fixed size for a view.
            """,
            snippetCode: """
            Rectangle()
                .frame(width: 128, height: 64)
            """,
            demoView: {
                Rectangle()
                    .frame(width: 128, height: 64)
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Frame",
            content: {
                frame()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogFrameView()
//}
