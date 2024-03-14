//
//  SwiftUiText.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogTextView: View {
    func text() -> some View {
        return CustomSection(
            snippetTitle: "Text",
            snippetDescription: """
            A view that only displays one or more read only lines of text.
            """,
            snippetCode: """
            Text("Sample text")
            """,
            demoView: {
                Text("Sample text")
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Text",
            content: {
                text()
            }
        )
    }
}

#Preview {
    SwiftUiCatalogTextView()
}
