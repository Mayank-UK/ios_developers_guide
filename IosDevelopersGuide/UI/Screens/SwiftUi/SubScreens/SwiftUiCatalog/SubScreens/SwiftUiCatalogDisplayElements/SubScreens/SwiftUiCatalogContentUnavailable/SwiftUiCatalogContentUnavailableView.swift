//
//  SwiftUiContentUnavailableView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogContentUnavailableView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogContentUnavailableViewModel
    
    func contentUnavailable() -> some View {
        return CustomSection(
            snippetTitle: "ContentUnavailable",
            snippetDescription: """
            A view to display when the content is unavailable.
            """,
            snippetCode: """
            ContentUnavailableView {
                Label("No Mail", systemImage: "tray.fill")
            } description: {
                Text("New mails you receive will appear here.")
            }
            """,
            demoView: {
                ContentUnavailableView {
                    Label("No Mail", systemImage: "tray.fill")
                } description: {
                    Text("New mails you receive will appear here.")
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "ContentUnavailable",
            content: {
                contentUnavailable()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogContentUnavailableView()
//}
