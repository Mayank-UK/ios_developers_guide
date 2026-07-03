//
//  SwiftUiGradientView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogGradientView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogGradientViewModel
    
    func linear() -> some View {
        return CustomSection(
            snippetTitle: "LinearGradient",
            snippetDescription: """
            Add linear gradient to a UI element.
            """,
            snippetCode: """
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 64, height: 64)
            """,
            demoView: {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing))
                    .frame(width: 64, height: 64)
            }
        )
    }
    
    func radial() -> some View {
        return CustomSection(
            snippetTitle: "RadialGradient",
            snippetDescription: """
            Add radial gradient to a UI element.
            """,
            snippetCode: """
            Rectangle()
                .fill(RadialGradient(gradient: Gradient(colors: [.purple, .pink]), center: .center, startRadius: 50, endRadius: 100))
                .frame(width: 64, height: 64)
            """,
            demoView: {
                Rectangle()
                    .fill(RadialGradient(gradient: Gradient(colors: [.purple, .pink]), center: .center, startRadius: 50, endRadius: 100))
                    .frame(width: 64, height: 64)
            }
        )
    }

    func angular() -> some View {
        return CustomSection(
            snippetTitle: "AngularGradient",
            snippetDescription: """
            Add angular gradient to a UI element.
            """,
            snippetCode: """
            Rectangle()
                .fill(AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .center))
                .frame(width: 64, height: 64)
            """,
            demoView: {
                Rectangle()
                    .fill(AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .center))
                    .frame(width: 64, height: 64)
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Gradient",
            content: {
                linear()
                radial()
                angular()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogGradientView()
//}
