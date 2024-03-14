//
//  SwiftUiLink.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogLinkView: View {
    func link() -> some View {
        return CustomSection(
            snippetTitle: "Link",
            snippetDescription: """
            A control for navigating to a url.
            """,
            snippetCode: """
            Link("Google", destination: URL(string: "https://www.google.com")!)
            """,
            demoView: {
                Link("Google", destination: URL(string: "https://www.google.com")!)
            }
        )
    }
    
    func shareLink() -> some View {
        return CustomSection(
            snippetTitle: "ShareLink",
            snippetDescription: """
            A view that controls a sharing presentation.
            """,
            snippetCode: """
            ShareLink(item: URL(string: "https://apps.apple.com/app/id1528095640")!)
            """,
            demoView: {
                ShareLink(item: URL(string: "https://apps.apple.com/app/id1528095640")!)
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Link",
            content: {
                link()
                shareLink()
            }
        )
    }
}

#Preview {
    SwiftUiCatalogLinkView()
}
