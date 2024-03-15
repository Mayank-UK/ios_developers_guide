//
//  SwiftUiStacksView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogStacksView: View {
    func hStack() -> some View {
        return CustomSection(
            snippetTitle: "HStack",
            snippetDescription: """
            Layout elements in a horizontal axis.
            """,
            snippetCode: """
            HStack(alignment: .center, spacing: 16) {
                Rectangle()
                    .frame(width: 64, height: 64)
                Rectangle()
                    .frame(width: 64, height: 64)
                Rectangle()
                    .frame(width: 64, height: 64)
            }
            """,
            demoView: {
                HStack(alignment: .center, spacing: 16) {
                    Rectangle()
                        .frame(width: 64, height: 64)
                    Rectangle()
                        .frame(width: 64, height: 64)
                    Rectangle()
                        .frame(width: 64, height: 64)
                }
            }
        )
    }
    
    func lazyHStack() -> some View {
        return CustomSection(
            snippetTitle: "LazyHStack",
            snippetDescription: """
            Layout elements in a horizontal axis in a lazy manner, the views are only created when they need to be displayed on screen, which is particularly useful when dealing with a large number of views that might not all fit on the screen at once.
            """,
            snippetCode: """
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(1...10, id: \\.self) { item in
                        Rectangle()
                            .frame(width: 64, height: 64)
                    }
                }
            }
            """,
            demoView: {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(1...10, id: \.self) { item in
                            Rectangle()
                                .frame(width: 64, height: 64)
                        }
                    }
                }
            }
        )
    }
    
    func vStack() -> some View {
        return CustomSection(
            snippetTitle: "VStack",
            snippetDescription: """
            Layout elements in a vertical axis.
            """,
            snippetCode: """
            VStack(alignment: .center, spacing: 16) {
                Rectangle()
                    .frame(width: 64, height: 64)
                Rectangle()
                    .frame(width: 64, height: 64)
                Rectangle()
                    .frame(width: 64, height: 64)
            }
            """,
            demoView: {
                VStack(alignment: .center, spacing: 16) {
                    Rectangle()
                        .frame(width: 64, height: 64)
                    Rectangle()
                        .frame(width: 64, height: 64)
                    Rectangle()
                        .frame(width: 64, height: 64)
                }
            }
        )
    }
    
    func lazyVStack() -> some View {
        return CustomSection(
            snippetTitle: "LazyVStack",
            snippetDescription: """
            Layout elements in a vertical axis in a lazy manner.
            """,
            snippetCode: """
            ScrollView(.vertical) {
                LazyVStack(alignment: .leading) {
                    ForEach(1...10, id: \\.self) { item in
                        Rectangle()
                            .frame(width: 64, height: 64)
                    }
                }
            }
                .frame(height: 256)
            """,
            demoView: {
                ScrollView(.vertical) {
                    LazyVStack(alignment: .leading) {
                        ForEach(1...10, id: \.self) { item in
                            Rectangle()
                                .frame(width: 64, height: 64)
                        }
                    }
                }
                    .frame(height: 256)
            }
        )
    }

    func zStack() -> some View {
        return CustomSection(
            snippetTitle: "ZStack",
            snippetDescription: """
            Layout elements in a z axis.
            Elements inside z stack by default take full width and height of ZStack.
            """,
            snippetCode: """
            ZStack(alignment: .center) {
                Rectangle()
                    .strokeBorder(Color.black, lineWidth: 0.1)
                    .frame(width: 256, height: 256)
                    .background(Color.yellow)
                Rectangle()
                    .strokeBorder(Color.black, lineWidth: 0.1)
                    .frame(width: 128, height: 128)
                    .background(Color.orange)
                Rectangle()
                    .strokeBorder(Color.black, lineWidth: 0.1)
                    .frame(width: 64, height: 64)
                    .background(Color.green)
            }
            """,
            demoView: {
                ZStack(alignment: .center) {
                    Rectangle()
                        .strokeBorder(Color.white, lineWidth: 1)
                        .frame(width: 256, height: 256)
                        .background(Color.black)
                    Rectangle()
                        .strokeBorder(Color.white, lineWidth: 1)
                        .frame(width: 128, height: 128)
                        .background(Color.black)
                    Rectangle()
                        .strokeBorder(Color.white, lineWidth: 1)
                        .frame(width: 64, height: 64)
                        .background(Color.black)
                }
            }
        )
    }

    var body: some View {
        PageScaffold(
            pageTitle: "Stacks",
            content: {
                hStack()
                lazyHStack()
                vStack()
                lazyVStack()
                zStack()
            }
        )
    }
}

#Preview {
    SwiftUiCatalogStacksView()
}
