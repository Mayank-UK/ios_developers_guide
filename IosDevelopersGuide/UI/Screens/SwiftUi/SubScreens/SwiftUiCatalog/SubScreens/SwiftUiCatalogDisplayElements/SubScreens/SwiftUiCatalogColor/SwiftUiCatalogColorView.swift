//
//  SwiftUiColorView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogColorView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogColorViewModel
    
    func foregroundColor() -> some View {
        return CustomSection(
            snippetTitle: "Color",
            snippetDescription: """
            Modifier to add colors to foreground like text.
            """,
            snippetCode: """
            Text("Sample text")
                .foregroundColor(.green)
            """,
            demoView: {
                Text("Sample text")
                    .foregroundColor(.green)
            }
        )
    }
    
    func fill() -> some View {
        return CustomSection(
            snippetTitle: "Fill",
            snippetDescription: """
            Modifier to add background colors to elements like shapes.
            """,
            snippetCode: """
            Rectangle()
                .fill(Color.green)
                .frame(width: 64, height: 64)
            """,
            demoView: {
                
            }
        )
    }
    
    func background() -> some View {
        return CustomSection(
            snippetTitle: "Background",
            snippetDescription: """
            Modifier to add background colors to general elements.
            """,
            snippetCode: """
            
            """,
            demoView: {
                Text("Sample text")
                    .padding()
                    .frame(width: .infinity)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.8))
            }
        )
    }
    
    func overlay() -> some View {
        return CustomSection(
            snippetTitle: "Overlay",
            snippetDescription: """
            Modifier to add color to an element, but it will not be applied in the background instead it will cover the underlying UI.
            """,
            snippetCode: """
            
            """,
            demoView: {
                Text("Sample text")
                    .padding()
                    .frame(width: .infinity)
                    .foregroundColor(.white)
                    .overlay(Color.black.opacity(0.8))
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Color",
            content: {
                foregroundColor()
                fill()
                background()
                overlay()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogColorView()
//}
