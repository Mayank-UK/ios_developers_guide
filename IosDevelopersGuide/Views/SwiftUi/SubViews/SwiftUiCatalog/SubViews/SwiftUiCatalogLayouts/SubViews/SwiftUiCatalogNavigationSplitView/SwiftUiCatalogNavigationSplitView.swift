//
//  SwiftUiNavigationSplitView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogNavigationSplitView: View {
    func navigationSplitView() -> some View {
        return CustomSection(
            snippetTitle: "NavigationSplitView",
            snippetDescription: """
            
            """,
            snippetCode: """
            
            """,
            demoView: {
            
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "NavigationSplitView",
            content: {
                navigationSplitView()
            }
        )
    }
}

#Preview {
    SwiftUiCatalogNavigationSplitView()
}
