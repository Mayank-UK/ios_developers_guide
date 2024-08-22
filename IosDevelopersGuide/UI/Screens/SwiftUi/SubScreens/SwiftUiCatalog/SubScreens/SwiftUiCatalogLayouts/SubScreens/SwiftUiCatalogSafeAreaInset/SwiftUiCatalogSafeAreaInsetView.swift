//
//  SwiftUiSafeAreaInsetView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogSafeAreaInsetView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogSafeAreaInsetViewModel
    
    func safeAreaInset() -> some View {
        return CustomSection(
            snippetTitle: "SafeAreaInset",
            snippetDescription: """
            SafeAreaInset modifier allows you to place content outside the device’s safe area while ensuring that other views adjust their layout to keep their content visible.
            """,
            snippetCode: """
            NavigationView {
                List(0..<100) { i in
                    Text("Row \\(i)")
                }
                .navigationTitle("Select a row")
                .safeAreaInset(edge: .bottom) {
                    Text("Outside Safe Area")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.indigo)
                }
            }
            """,
            demoView: {
                NavigationView {
                    List(0..<100) { i in
                        Text("Row \(i)")
                    }
                    .navigationTitle("Select a row")
                    .safeAreaInset(edge: .bottom) {
                        Text("Outside Safe Area")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.indigo)
                    }
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "SafeAreaInset",
            content: {
                safeAreaInset()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogSafeAreaInsetView()
//}
