//
//  ContentView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 01/03/24.
//

import SwiftUI

struct HomeView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: HomeViewModel
    
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
    HomeView(viewModel: HomeViewModel())
}
