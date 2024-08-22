//
//  SwiftUiContainers.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiCatalogContainersView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogContainersViewModel
    
    var body: some View {
        PageScaffold(
            pageTitle: "Containers",
            content: {
                Links(links: viewModel.links)
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogContainersView()
//}
