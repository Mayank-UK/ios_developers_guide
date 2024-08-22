//
//  SwiftUiPopoverView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogPopoverView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogPopoverViewModel
    
    @State private var showingPopover = false
    
    func popover() -> some View {
        return CustomSection(
            snippetTitle: "Popover",
            snippetDescription: """
            Modifier to show popover.
            A popover is a floating view that overlays content, while a sheet covers a large part of the screen.
            """,
            snippetCode: """
            Button("Show popover") {
                showingPopover = true
            }
                .popover(isPresented: $showingPopover) {
                    Text("Your content here")
                        .font(.headline)
                        .padding()
                }
            """,
            demoView: {
                Button("Show popover") {
                    showingPopover = true
                }
                    .popover(isPresented: $showingPopover) {
                        Text("Your content here")
                            .font(.headline)
                            .padding()
                    }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Popover",
            content: {
                popover()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogPopoverView()
//}
