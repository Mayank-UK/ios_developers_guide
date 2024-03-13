//
//  SwiftUiHyperlinks.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI
import WebKit

struct SwiftUiWebView: View {
    func link() -> some View {
        return CustomSection(
            snippetTitle: "Web link",
            snippetDescription: """
            Take to a resource hosted on web using it's link.
            """,
            snippetCode: """
            Link("Google", destination: URL(string: "https://www.google.com")!)
            """,
            demoView: {
                Link("Google", destination: URL(string: "https://www.google.com")!)
            }
        )
    }
    
    func webView() -> some View {
        return CustomSection(
            snippetTitle: "Web view",
            snippetDescription: """
            Show a web view to surf web.
            """,
            snippetCode: """
            
            """,
            demoView: {
            
            }
        )
    }


    var body: some View {
        PageScaffold(
            pageTitle: "Web",
            content: {
                link()
                webView()
            }
        )
    }
}

#Preview {
    SwiftUiWebView()
}
