//
//  SwiftUiGeometryReaderView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogGeometryReaderView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogGeometryReaderViewModel
    
    func geometryReader() -> some View {
        return CustomSection(
            snippetTitle: "GeometryReader",
            snippetDescription: """
            GeometryReader is a container view that defines its content as a function of its own size and coordinate space.
            """,
            snippetCode: """
            GeometryReader { geometry in
                Rectangle()
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 5)
            }
            """,
            demoView: {
                GeometryReader { geometry in
                    Rectangle()
                        .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 5)
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "GeometryReader",
            content: {
                geometryReader()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogGeometryReaderView()
//}
