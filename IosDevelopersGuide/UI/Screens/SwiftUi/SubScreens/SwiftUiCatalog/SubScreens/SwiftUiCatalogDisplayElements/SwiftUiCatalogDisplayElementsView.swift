//
//  SwiftUiTextAndDisplayView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiCatalogDisplayElementsView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogDisplayElementsViewModel
    

    
    var body: some View {
        PageScaffold(
            pageTitle: "Display elements",
            content: {
                Links(links: viewModel.links)
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogDisplayElementsView()
//}
