//

// intentional: raw Color.* literals in this file are demo content that teaches
// SwiftUI concepts (e.g. what Color.green looks like) and must read literally.
//  SwiftUiVisibility.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiVisibilityView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiVisibilityViewModel
    
    @State var isVisible: Bool = false
    
    func opacity() -> some View {
        return CustomSection(
            snippetTitle: "Using opacity modifier",
            snippetDescription: """
            The element below is just given enough opacity to be barely visible.
            """,
            snippetCode: """
            Rectangle()
                .strokeBorder(Color.white, lineWidth: 0.1)
                .frame(width: 64, height: 64)
                .background(Color.black)
                .opacity(0.05)
            """,
            demoView: {
                Rectangle()
                    .frame(width: 64, height: 64)
                    .background(Color.black)
                    .opacity(0.05)
            }
        )
    }
    
    func hidden() -> some View {
        return CustomSection(
            snippetTitle: "Using hidden modifier",
            snippetDescription: """
            The UI element below is hidden using .hidden() modifier.
            The element will still take the space in layout.
            """,
            snippetCode: """
            Rectangle()
                .frame(width: 64, height: 64)
                .hidden()
            """,
            demoView: {
                Rectangle()
                    .frame(width: 64, height: 64)
                    .hidden()
            }
        )
    }
    
    func conditionalRendering() -> some View {
        return CustomSection(
            snippetTitle: "Conditional rendering",
            snippetDescription: """
            The element below can be made visible using conditional rendering.
            This is the best approach to show/hide an element as it won't take the space in the layout until it's visible.
            """,
            snippetCode: """
            @State var isVisible: Bool = false
            
            HStack{
                if(isVisible) {
                    Rectangle()
                        .frame(width: 64, height: 64)
                }
                Button(action: {
                    isVisible = !isVisible
                }) {
                    
                    Text("Toggle visiblity")
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(DesignSystem.Sizes.radiusSm)
                }

            }
            """,
            demoView: {
                HStack{
                    if(isVisible) {
                        Rectangle()
                            .frame(width: 64, height: 64)
                    }
                    Button(action: {
                        isVisible = !isVisible
                    }) {
                        
                        Text("Toggle visiblity")
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(DesignSystem.Sizes.radiusSm)
                    }

                }
            }
        )
    }

    var body: some View {
        PageScaffold(
            pageTitle: "Visibility",
            content: {
                opacity()
                hidden()
                conditionalRendering()
            }
        )
    }
}

//#Preview {
//    SwiftUiVisibilityView()
//}
