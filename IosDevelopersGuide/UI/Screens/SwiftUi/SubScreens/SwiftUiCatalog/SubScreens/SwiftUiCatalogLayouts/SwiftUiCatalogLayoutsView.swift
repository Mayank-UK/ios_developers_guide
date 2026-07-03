//
//  SwiftUiElementsView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiCatalogLayoutsView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogLayoutsViewModel
    
    var body: some View {
        PageScaffold(
            pageTitle: "Layout",
            content: {
                Links(links: viewModel.links)
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogLayoutsView()
//}
