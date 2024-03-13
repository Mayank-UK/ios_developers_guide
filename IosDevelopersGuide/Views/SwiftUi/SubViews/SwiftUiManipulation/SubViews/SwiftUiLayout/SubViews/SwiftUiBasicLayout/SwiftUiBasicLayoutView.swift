//
//  SwiftUiBasicLayoutView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiBasicLayoutView: View {
    func frameContainer() -> some View {
        return CustomSection(
            snippetTitle: "Frame/Container",
            snippetDescription: """
            In SwiftUI most of the elements acts as frame/container for themselved and don't need a separate wrapping container element.
            Height, width, color, background, etc can be directly applied to these elements.
            """,
            snippetCode: """
            Text("Demo text")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .foregroundColor(.white)
                .background(Color.black.opacity(0.8))
                .cornerRadius(8)
            """,
            demoView: {
                Text("Demo text")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(8)
            }
        )
    }
    
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
    
    func list() -> some View {
        return CustomSection(
            snippetTitle: "List",
            snippetDescription: """
            Layout elements in a list.
            If List is put inside a ScrollView, then it needs to be given fixed height to be visible.
            """,
            snippetCode: """
            List{
                Rectangle()
                    .frame(width: 64, height: 64)
                Rectangle()
                    .frame(width: 64, height: 64)
                Rectangle()
                    .frame(width: 64, height: 64)
            }.frame(height: 256)
            """,
            demoView: {
                List{
                    Rectangle()
                        .frame(width: 64, height: 64)
                    Rectangle()
                        .frame(width: 64, height: 64)
                    Rectangle()
                        .frame(width: 64, height: 64)
                }.frame(height: 256)
            }
        )
    }
    
    func forEach() -> some View {
        return CustomSection(
            snippetTitle: "ForEach",
            snippetDescription: """
            Layout elements on demand by iterating over a list of data.
            """, 
            snippetCode: """
            Group {
                ForEach(["Apple", "Banana", "Cherry"], id: \\.self) { fruit in
                    Rectangle()
                        .frame(width: 64, height: 64)
                }
            }
            """,
            demoView: {
                Group {
                    ForEach(["Apple", "Banana", "Cherry"], id: \.self) { fruit in
                        Rectangle()
                            .frame(width: 64, height: 64)
                    }
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Basic layout",
            content: {
                frameContainer()
                hStack()
                lazyHStack()
                vStack()
                lazyVStack()
                zStack()
                grid()
                lazyHGrid()
                lazyVGrid()
                list()
                forEach()
            }
        )
    }
}

#Preview {
    SwiftUiBasicLayoutView()
}
