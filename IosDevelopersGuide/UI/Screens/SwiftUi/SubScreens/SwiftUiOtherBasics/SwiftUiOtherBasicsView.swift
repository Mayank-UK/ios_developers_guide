//
//  OtherBasics.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 21/08/24.
//

import SwiftUI

struct SwiftUiOtherBasicsView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiOtherBasicsViewModel
    
    var body: some View {
        PageScaffold(
            pageTitle: "Other basics",
            content: {
                Links(links: viewModel.links)
            }
        )
    }
}

//#Preview {
//    OtherBasicsView()
//}
