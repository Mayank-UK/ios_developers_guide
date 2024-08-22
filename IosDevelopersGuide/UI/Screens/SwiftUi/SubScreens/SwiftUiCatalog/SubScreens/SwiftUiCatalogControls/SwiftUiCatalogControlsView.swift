//
//  SwiftUiControls.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiCatalogControlsView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogControlsViewModel
    
    var body: some View {
        PageScaffold(
            pageTitle: "Controls",
            content: {
                Links(links: viewModel.links)
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogControlsView()
//}
