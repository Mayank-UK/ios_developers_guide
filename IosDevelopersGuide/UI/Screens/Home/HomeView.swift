//
//  ContentView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 01/03/24.
//

import SwiftUI
import FactoryKit

struct HomeView: View {
    // inject the viewModel from route
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        PageScaffold(
            pageTitle: "IOS developer's guide",
            content: {
                Links(links: viewModel.links)
            }
        )
    }
}

#Preview {
    HomeView(viewModel: Container.shared.homeViewModel())
}
