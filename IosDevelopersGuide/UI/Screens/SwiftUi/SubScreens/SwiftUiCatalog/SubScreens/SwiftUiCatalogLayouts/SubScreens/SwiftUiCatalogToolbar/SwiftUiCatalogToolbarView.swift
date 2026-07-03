//
//  SwiftUiToolbarView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogToolbarView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogToolbarViewModel
    
    let placement: ToolbarItemPlacement = .automatic
    
    func toolbar() -> some View {
        return CustomSection(
            snippetTitle: "Toolbar",
            snippetDescription: """
            Toolbar modifier allows you to create and customize toolbars within your views.
            """,
            snippetCode: """
            Text("Hello, World!")
                .padding()
                .navigationTitle("SwiftUI")
                .toolbar {
                    ToolbarItem {
                        Button("Press Me") {
                            print("Pressed")
                        }
                    }
                }
            """,
            demoView: {
                Text("Hello, World!")
                    .padding()
                    .navigationTitle("SwiftUI")
                    .toolbar {
                        ToolbarItem {
                            Button("Press Me") {
                                print("Pressed")
                            }
                        }
                    }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Toolbar",
            content: {
                toolbar()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogToolbarView()
//}
