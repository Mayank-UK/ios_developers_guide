//

// intentional: raw Color.* literals in this file are demo content that teaches
// SwiftUI concepts (e.g. what Color.green looks like) and must read literally.
//  SwiftUiDividerView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogDividerView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogDividerViewModel
    
    func divider() -> some View {
        return CustomSection(
            snippetTitle: "Divider",
            snippetDescription: """
            Add a divider between UI elements.
            """,
            snippetCode: """
            HStack{
                Rectangle()
                    .frame(width: 64, height: 64)
                Spacer().frame(width: 32)
                Rectangle()
                    .frame(width: 64, height: 64)
            }
            """,
            demoView: {
                HStack{
                    Rectangle()
                        .frame(width: 64, height: 64)
                    Divider()
                        .frame(width: 2)
                        .background(Color.black)
                    Rectangle()
                        .frame(width: 64, height: 64)
                }
            }
        )
    }

    var body: some View {
        PageScaffold(
            pageTitle: "Divider",
            content: {
                divider()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogDividerView()
//}
