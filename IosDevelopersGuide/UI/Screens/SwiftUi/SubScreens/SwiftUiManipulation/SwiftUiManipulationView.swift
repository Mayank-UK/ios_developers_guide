//
//  SwiftUiManipulation.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiManipulationView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiManipulationViewModel
    
    var body: some View {
        PageScaffold(
            pageTitle: "UI manipulation",
            content: {
                Links(links: viewModel.links)
            }
        )
    }
}

//#Preview {
//    SwiftUiManipulationView()
//}
