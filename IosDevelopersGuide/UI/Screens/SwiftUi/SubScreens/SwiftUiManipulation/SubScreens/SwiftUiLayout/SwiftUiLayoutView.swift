//
//  UiManipulationLayout.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiLayoutView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiLayoutViewModel
    
    var body: some View {
        PageScaffold(
            pageTitle: "Layouts",
            content: {
                Links(links: viewModel.links)
            }
        )
    }

}

//#Preview {
//    SwiftUiLayoutView()
//}
