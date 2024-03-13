//
//  SwiftUiBorders.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiBordersView: View {
    func simpleBorders() -> some View {
        return CustomSection(
            snippetTitle: "Simple borders",
            snippetDescription: """
            Add basic border to an element.
            """,
            snippetCode: """
            Text("Hello, SwiftUI!")
                .padding()
                .border(Color.green, width: 2)
            """,
            demoView: {
                Text("Hello, SwiftUI!")
                    .padding()
                    .border(Color.green, width: 2)
            }
            
        )
    }
    
    func advancedBorders() -> some View {
        return CustomSection(
            snippetTitle: "Advanced borders",
            snippetDescription: """
            Adding different shape, radius, styles to an element's border.
            """,
            snippetCode: """
            Text("Hello, SwiftUI!")
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.green, lineWidth: 2)
                )
            """,
            demoView: {
                Text("Hello, SwiftUI!")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.green, lineWidth: 2)
                    )
            }
            
        )
    }

    
    var body: some View {
        PageScaffold(
            pageTitle: "Borders",
            content: {
                simpleBorders()
                advancedBorders()
            }
        )
    }
}

#Preview {
    SwiftUiBordersView()
}
