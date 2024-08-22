//
//  SwiftUiGraphicsAndDrawingsView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiCatalogModalsView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogModalsViewModel
    
    var body: some View {
        PageScaffold(
            pageTitle: "Modals",
            content: {
                Links(links: viewModel.links)
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogModalsView()
//}
