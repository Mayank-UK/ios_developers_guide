//
//  SwiftUiSpacing.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiSpacingView: View {
    
    func paddingSpacing() -> some View {
        return CustomSection(
            snippetTitle: "Padding",
            snippetDescription: """
            Space between the walls of the container and it's children
            """,
            snippetCode: """
            Group {
                Rectangle()
                    .frame(width: 64, height: 64)
            }
                .padding(8)
                .background(.red)
            """,
            demoView: {
                Group {
                    Rectangle()
                        .frame(width: 64, height: 64)
                }
                    .padding(8)
                    .background(.red)
            }
        )
    }
    
    func marginSpacing() -> some View {
        return CustomSection(
            snippetTitle: "Margin",
            snippetDescription: """
            Space between the walls of the elements.
            There is no margin system in SwiftUI.
            Use normal spacing for margins.
            """,
            snippetCode: """
            //  no code
            """,
            demoView: {
            
            }
        )
    }
    
    func normalSpacing() -> some View {
        return CustomSection(
            snippetTitle: "Normal spacing",
            snippetDescription: """
            Space between two elements
            """,
            snippetCode: """
            HStack {
                Rectangle()
                    .frame(width: 64, height: 64)
                Spacer().frame(width: 16)
                Rectangle()
                    .frame(width: 64, height: 64)
            }
            """,
            demoView: {
                HStack {
                    Rectangle()
                        .frame(width: 64, height: 64)
                    Spacer().frame(width: 16)
                    Rectangle()
                        .frame(width: 64, height: 64)
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Spacing",
            content: {
                paddingSpacing()
                marginSpacing()
                normalSpacing()
            }
        )
    }
}

#Preview {
    SwiftUiSpacingView()
}
