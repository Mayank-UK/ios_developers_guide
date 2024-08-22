//
//  SwiftUiNavigationSplitView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogNavigationSplitView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogNavigationSplitViewModel
    
    func navigationSplitView() -> some View {
        return CustomSection(
            snippetTitle: "NavigationSplitView",
            snippetDescription: """
            NavigationSplitView show links on iphone, but will show links along with content on wide screens like iPads.
            """,
            snippetCode: """
            NavigationSplitView {
                Text("Column 1")
            } content: {
                Text("Column 2")
            } detail: {
                Text("Column 3")
            }
            """,
            demoView: {
                NavigationSplitView {
                    Text("Column 1")
                } content: {
                    Text("Column 2")
                } detail: {
                    Text("Column 3")
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "NavigationSplitView",
            content: {
                navigationSplitView()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogNavigationSplitView()
//}
