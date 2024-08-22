//
//  SwiftUiBackgroundView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogBackgroundView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogBackgroundViewModel
    
    func background() -> some View {
        return CustomSection(
            snippetTitle: "Background color",
            snippetDescription: """
            Modifier to add background color.
            """,
            snippetCode: """
            Text("")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
            """,
            demoView: {
                Text("")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Background",
            content: {
                background()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogBackgroundView()
//}
