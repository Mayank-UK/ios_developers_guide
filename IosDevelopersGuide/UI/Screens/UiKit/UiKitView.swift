//
//  UiKit.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct UiKitView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: UiKitViewModel
    
    var body: some View {
        PageScaffold(
            pageTitle: "UIKit",
            content: {
                Links(links: viewModel.links)
            }
        )
    }
}

//#Preview {
//    UiKitView()
//}
