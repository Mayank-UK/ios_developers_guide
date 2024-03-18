//
//  SwiftUiGroupView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogGroupView: View {
    func group() -> some View {
        return CustomSection(
            snippetTitle: "Group",
            snippetDescription: """
            Group view is a versatile container that allows you to collect multiple instances of a content type (such as views, scenes, or commands) into a single unit.
            Group doesn’t affect the layout of its child views like an HStack, VStack, or Section would.
            """,
            snippetCode: """
            Group {
                Text("Text 1")
                Text("Text 2")
                Text("Text 3")
            }
                .font(.headline)
            """,
            demoView: {
                Group {
                    Text("Text 1")
                    Text("Text 2")
                    Text("Text 3")
                }
                    .font(.headline)
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Group",
            content: {
                group()
            }
        )
    }
}

#Preview {
    SwiftUiCatalogGroupView()
}
