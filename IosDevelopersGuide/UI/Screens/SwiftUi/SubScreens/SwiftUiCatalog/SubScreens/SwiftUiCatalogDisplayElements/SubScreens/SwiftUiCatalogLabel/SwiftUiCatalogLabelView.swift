//
//  SwiftUiLabelView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogLabelView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogLabelViewModel
    
    func label() -> some View {
        return CustomSection(
            snippetTitle: "Label",
            snippetDescription: """
            A view to show label with an icon and a title.
            """,
            snippetCode: """
            Label("Rain", systemImage: "cloud.rain")
                .labelStyle(.automatic)
            """,
            demoView: {
                Label("Rain", systemImage: "cloud.rain")
                    .labelStyle(.automatic)
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Label",
            content: {
                label()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogLabelView()
//}
