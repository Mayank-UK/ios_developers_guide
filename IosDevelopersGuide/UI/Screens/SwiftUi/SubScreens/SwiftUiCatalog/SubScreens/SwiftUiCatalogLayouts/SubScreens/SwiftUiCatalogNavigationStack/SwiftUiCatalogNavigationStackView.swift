//
//  SwiftUiNavigationStackView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogNavigationStackView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogNavigationStackViewModel
    
    func navigationStack() -> some View {
        return CustomSection(
            snippetTitle: "NavigationStack",
            snippetDescription: """
            A view that allows navigation inside it between multiple screens.
            """,
            snippetCode: """
            NavigationStack {
                NavigationLink {
                    EmptyView()
                } label: {
                    Text("Navigation link")
                }
                    .navigationTitle("Navigation title")
            }
                .frame(height: 256)
            """,
            demoView: {
                NavigationStack {
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Text("Navigation link")
                    }
                        .navigationTitle("Navigation title")
                }
                    .frame(height: 256)
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "NavigationStack",
            content: {
                navigationStack()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogNavigationStackView()
//}
