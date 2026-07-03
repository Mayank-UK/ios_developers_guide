//
//  SwiftUiViewCatalog.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiCatalogView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogViewModel
    
    var body: some View {
        PageScaffold(
            pageTitle: "SwiftUI views and modifiers catalog",
            content: {
                Links(links: viewModel.links)
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogView()
//}
