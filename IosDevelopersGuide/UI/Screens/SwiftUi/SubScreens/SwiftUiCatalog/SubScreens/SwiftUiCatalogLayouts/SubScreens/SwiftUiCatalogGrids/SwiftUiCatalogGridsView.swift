//
//  SwiftUiGridView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogGridsView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogGridsViewModel
    
    func grid() -> some View {
        return CustomSection(
            snippetTitle: "Grid",
            snippetDescription: """
            Layout elements in a grid.
            """,
            snippetCode: """
            Grid {
                GridRow {
                    Rectangle()
                        .frame(width: 64, height: 64)
                }
                GridRow {
                    Rectangle()
                        .frame(width: 64, height: 64)
                    Rectangle()
                        .frame(width: 64, height: 64)
                }
                GridRow {
                    Rectangle()
                        .frame(width: 64, height: 64)
                    Rectangle()
                        .frame(width: 64, height: 64)
                    Rectangle()
                        .frame(width: 64, height: 64)
                }
            }
            """,
            demoView: {
                Grid {
                    GridRow {
                        Rectangle()
                            .frame(width: 64, height: 64)
                    }
                    GridRow {
                        Rectangle()
                            .frame(width: 64, height: 64)
                        Rectangle()
                            .frame(width: 64, height: 64)
                    }
                    GridRow {
                        Rectangle()
                            .frame(width: 64, height: 64)
                        Rectangle()
                            .frame(width: 64, height: 64)
                        Rectangle()
                            .frame(width: 64, height: 64)
                    }
                }
            }
        )
    }
            
    func lazyHGrid() -> some View {
        return CustomSection(
            snippetTitle: "LazyHGrid",
            snippetDescription: """
            Layout elements in a grid in horizontal axis in a lazy manner.
            """,
            snippetCode: """
            ScrollView(.horizontal) {
                LazyHGrid(rows: Array(repeating: .init(.fixed(64)), count: 3)) {
                    ForEach(0..<10) { item in
                        Rectangle()
                            .frame(width: 64, height: 64)
                    }
                }
            }
            """,
            demoView: {
                ScrollView(.horizontal) {
                    LazyHGrid(rows: Array(repeating: .init(.fixed(64)), count: 3)) {
                        ForEach(0..<10) { item in
                            Rectangle()
                                .frame(width: 64, height: 64)
                        }
                    }
                }
            }
        )
    }
    
    func lazyVGrid() -> some View {
        return CustomSection(
            snippetTitle: "LazyVGrid",
            snippetDescription: """
            Layout elements in a grid in vertical axis in a lazy manner.
            """,
            snippetCode: """
            ScrollView(.vertical) {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], alignment: .leading) {
                    ForEach(0..<10) { item in
                        Rectangle()
                            .frame(width: 64, height: 64)
                    }
                }
            }
                .frame(height: 256)
            """,
            demoView: {
                ScrollView(.vertical) {
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], alignment: .leading) {
                        ForEach(0..<10) { item in
                            Rectangle()
                                .frame(width: 64, height: 64)
                        }
                    }
                }
                    .frame(height: 256)
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Grids",
            content: {
                grid()
                lazyHGrid()
                lazyVGrid()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogGridsView()
//}
