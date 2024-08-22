//
//  SwiftUiScrollView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogScrollView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogScrollViewModel
    
    func scrollView() -> some View {
        return CustomSection(
            snippetTitle: "ScrollView",
            snippetDescription: """
            A view for adding scrollability to the view.
            """,
            snippetCode: """
            ScrollView {
                ForEach(1...7, id: \\.self) { item in
                    Rectangle()
                        .frame(width: .infinity, height: 64)
                }
            }
                .frame(height: 256)
            """,
            demoView: {
                VStack {
                    ScrollView {
                        ForEach(1...7, id: \.self) { item in
                            Rectangle()
                                .frame(width: .infinity, height: 64)
                        }
                    }
                        .frame(height: 256)
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "ScrollView",
            content: {
                scrollView()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogScrollView()
//}
