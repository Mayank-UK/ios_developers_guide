//
//  SwiftUi.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct SwiftUiView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiViewModel
    
    var body: some View {
        PageScaffold(
            pageTitle: "SwiftUI",
            content: {
                Links(links: viewModel.links)
            }
        )
    }
}

//#Preview {
//    SwiftUiView()
//}
