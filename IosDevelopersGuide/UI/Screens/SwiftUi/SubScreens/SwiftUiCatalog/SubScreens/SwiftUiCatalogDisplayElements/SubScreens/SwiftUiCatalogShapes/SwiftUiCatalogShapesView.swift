//
//  SwiftUiShapesView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogShapesView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogShapesViewModel
    
    func rectangle() -> some View {
        return CustomSection(
            snippetTitle: "Rectangle",
            snippetDescription: """
            Draw a rectangle.
            """,
            snippetCode: """
            Rectangle()
                .frame(width: 128, height: 64)
                .rotationEffect(.degrees(7), anchor: .center)
            """,
            demoView: {
                Rectangle()
                    .frame(width: 128, height: 64)
                    .rotationEffect(.degrees(7), anchor: .center)
            }
        )
    }
    
    func roundedRectangle() -> some View {
        return CustomSection(
            snippetTitle: "RoundedRectangle",
            snippetDescription: """
            Draw a rounded rectangle.
            """,
            snippetCode: """
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .frame(width: 128, height: 64)
            """,
            demoView: {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .frame(width: 128, height: 64)
            }
        )
    }

    func circle() -> some View {
        return CustomSection(
            snippetTitle: "Circle",
            snippetDescription: """
            Draw a circle.
            """,
            snippetCode: """
            Circle()
                .frame(width: 64, height: 64)
            """,
            demoView: {
                Circle()
                    .frame(width: 64, height: 64)
            }
        )
    }

    func ellipse() -> some View {
        return CustomSection(
            snippetTitle: "Ellipse",
            snippetDescription: """
            Draw an ellipse.
            """,
            snippetCode: """
            Ellipse()
                .frame(width: 128, height: 64)
            """,
            demoView: {
                Ellipse()
                    .frame(width: 128, height: 64)
            }
        )
    }

    func capsule() -> some View {
        return CustomSection(
            snippetTitle: "Capsule",
            snippetDescription: """
            Draw a capsule.
            """,
            snippetCode: """
            Capsule()
                .frame(width: 128, height: 64)
            """,
            demoView: {
                Capsule()
                    .frame(width: 128, height: 64)
            }
        )
    }

    func shapeOperations() -> some View {
        return CustomSection(
            snippetTitle: "Shape operations",
            snippetDescription: """
            Perform different things using shapes like intersection, combination, etc
            """,
            snippetCode: """
            GeometryReader { geometry in
                let height: CGFloat = geometry.size.height
                let width: CGFloat = geometry.size.width
                
                Rectangle()
                    .size(width: width * 2 / 3, height: height)
                    .intersection(
                        Circle()
                            .size(width: width * 2 / 3, height: height)
                            .offset(x: width / 3, y: 0)
                    )
                        .fill(Color.black)
            }
                .frame(width: .infinity, height: 128)
            """,
            demoView: {
                GeometryReader { geometry in
                    let height: CGFloat = geometry.size.height
                    let width: CGFloat = geometry.size.width
                    
                    Rectangle()
                        .size(width: width * 2 / 3, height: height)
                        .intersection(
                            Circle()
                                .size(width: width * 2 / 3, height: height)
                                .offset(x: width / 3, y: 0)
                        )
                            .fill(Color.black)
                }
                    .frame(width: .infinity, height: 128)
            }
        )
    }

    var body: some View {
        PageScaffold(
            pageTitle: "Shapes",
            content: {
                rectangle()
                roundedRectangle()
                circle()
                ellipse()
                capsule()
                shapeOperations()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogShapesView()
//}
