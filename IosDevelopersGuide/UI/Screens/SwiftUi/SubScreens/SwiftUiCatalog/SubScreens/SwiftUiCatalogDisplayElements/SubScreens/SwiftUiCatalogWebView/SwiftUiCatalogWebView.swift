//
//  SwiftUiWebView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogWebView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogWebViewModel
    
    func webView() -> some View {
        return CustomSection(
            snippetTitle: "WebView",
            snippetDescription: """
            A view to show web pages inside a frame/container.
            """,
            snippetCode: """
            
            """,
            demoView: {
            
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "WebView",
            content: {
                webView()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogWebView()
//}
