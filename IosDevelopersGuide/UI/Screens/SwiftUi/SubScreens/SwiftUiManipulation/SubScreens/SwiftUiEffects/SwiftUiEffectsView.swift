//

// intentional: raw Color.* literals in this file are demo content that teaches
// SwiftUI concepts (e.g. what Color.green looks like) and must read literally.
//  SwiftUiEffects.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiEffectsView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiEffectsViewModel
    
    func shadows() -> some View {
        return CustomSection(
            snippetTitle: "Shadows",
            snippetDescription: """
            Adding depth to an element by using shadows.
            """,
            snippetCode: """
            Rectangle()
                .frame(width: 64, height: 64)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                .shadow(color: .black.opacity(0.2), radius: 20, x: 10, y: 10)
            """,
            demoView: {
                Rectangle()
                    .frame(width: 64, height: 64)
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                    .shadow(color: .black.opacity(0.2), radius: 20, x: 10, y: 10)
            }
        )
    }
    
    func opacity() -> some View {
        return CustomSection(
            snippetTitle: "Opacity",
            snippetDescription: """
            Adding transparency to an element.
            """,
            snippetCode: """
            ZStack {
                Rectangle()
                    .strokeBorder(Color.white, lineWidth: 0.1)
                    .frame(width: 64, height: 64)
                    .background(Color.red)
                Rectangle()
                    .strokeBorder(Color.white, lineWidth: 0.1)
                    .frame(width: 64, height: 64)
                    .background(Color.black)
                    .opacity(0.4)
                    .offset(x: 16, y: 16)
            }
            """,
            demoView: {
                ZStack {
                    Rectangle()
                        .strokeBorder(Color.white, lineWidth: 0.1)
                        .frame(width: 64, height: 64)
                        .background(Color.red)
                    Rectangle()
                        .strokeBorder(Color.white, lineWidth: 0.1)
                        .frame(width: 64, height: 64)
                        .background(Color.black)
                        .opacity(0.4)
                        .offset(x: 16, y: 16)
                }
            }
        )
    }


    var body: some View {
        PageScaffold(
            pageTitle: "Effects",
            content: {
                shadows()
                opacity()
            }
        )
    }
}

//#Preview {
//    SwiftUiEffectsView()
//}
