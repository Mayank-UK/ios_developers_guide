//
//  SwiftUiNavigationAndRouting.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiNavigationAndRoutingView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiNavigationAndRoutingViewModel
    
    func basics() -> some View {
        return CustomSection(
            snippetTitle: "Navigation basics",
            snippetDescription: """
            There are multiple ways to implement navigation in SwiftUI:
            1) NavigationStack : for stack based navigation.
            2) NavigationSplitView : for column based navigation.
            3) TabView : for tab based navigation.
            """
        )
    }
    
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
            """
        )
    }
    
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
            pageTitle: "Navigation and routing",
            content: {
                basics()
                navigationStack()
                navigationSplitView()
                tabView()
            }
        )
    }
}

//#Preview {
//    SwiftUiNavigationAndRoutingView()
//}
