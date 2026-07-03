//
//  SwiftUiEmptyView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogEmptyView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogEmptyViewModel
    
    func emptyView() -> some View {
        return CustomSection(
            snippetTitle: "EmptyView",
            snippetDescription: """
            EmptyView is a view that doesn’t contain any content.
            Use EmptyView to handle empty states in your app.
            """,
            snippetCode: """
            EmptyView()
            """,
            demoView: {
                EmptyView()
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "EmptyView",
            content: {
                emptyView()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogEmptyView()
//}
