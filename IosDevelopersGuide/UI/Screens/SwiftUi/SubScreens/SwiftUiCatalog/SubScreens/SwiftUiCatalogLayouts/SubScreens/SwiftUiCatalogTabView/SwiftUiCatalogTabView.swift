//
//  SwiftUiTabView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogTabView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogTabViewModel
    
    func tabView() -> some View {
        return CustomSection(
            snippetTitle: "TabView",
            snippetDescription: """
            A view for dividing UI into different tabs.
            """,
            snippetCode: """
            TabView {
                Text("Tab 1")
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("First Tab")
                    }
                Text("Tab 2")
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("Second Tab")
                    }
            }
                .frame(height: 256)
            """,
            demoView: {
                TabView {
                    Text("Tab 1")
                        .tabItem {
                            Image(systemName: "1.circle")
                            Text("First Tab")
                        }
                    Text("Tab 2")
                        .tabItem {
                            Image(systemName: "2.circle")
                            Text("Second Tab")
                        }
                }
                    .frame(height: 256)
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Tab",
            content: {
                tabView()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogTabView()
//}
