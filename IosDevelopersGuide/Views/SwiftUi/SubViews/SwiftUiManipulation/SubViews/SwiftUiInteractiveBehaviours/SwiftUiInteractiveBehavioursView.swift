//
//  SwiftUiInteractiveBehaviours.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiInteractiveBehavioursView: View {
    @State private var tapCount: Int = 0
    @State private var hoverStatus: Bool = false
    @FocusState private var isInputActive: Bool
    @State private var inputText: String = ""
    
    func tap() -> some View {
        return CustomSection(
            snippetTitle: "Tap gesture",
            snippetDescription: """
            Detect the tap gesture on a UI element and perform some action.
            """,
            snippetCode: """
            Text("Tap me!       \(tapCount)")
                .padding()
                .foregroundColor(.white)
                .background(Color.black.opacity(0.8))
                .cornerRadius(8)
                .onTapGesture {
                    tapCount += 1
                }
            """,
            demoView: {
                Text("Tap me!       \(tapCount)")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(8)
                    .onTapGesture {
                        tapCount += 1
                    }
            }
        )
    }
    
    func hover() -> some View {
        return CustomSection(
            snippetTitle: "Hover gesture",
            snippetDescription: """
            Detect the hover gesture on a UI element and perform some action.
            """,
            snippetCode: """
            Text("Hover over me!       \(hoverStatus)")
                .padding()
                .foregroundColor(.white)
                .background(Color.black.opacity(0.8))
                .cornerRadius(8)
                .onHover { isHovering in
                    hoverStatus = isHovering
                }
            """,
            demoView: {
                Text("Hover over me!       \(hoverStatus)")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(8)
                    .onHover { isHovering in
                        hoverStatus = isHovering
                    }
            }
        )
    }
    
    func focus() -> some View {
        return CustomSection(
            snippetTitle: "On focus",
            snippetDescription: """
            Toggle focus on input fields.
            """,
            snippetCode: """
            @FocusState private var isInputActive: Bool
            @State private var inputText: String = ""
            
            VStack(alignment: .leading) {
                TextField("Enter your name", text: $inputText)
                    .focused($isInputActive)
                    .onSubmit {}
                Spacer().frame(height: 16)
                Text("Tap to toggle focus")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(8)
                    .onTapGesture {
                        isInputActive = !isInputActive
                    }
            }
            """,
            demoView: {
                VStack(alignment: .leading) {
                    TextField("Enter your name", text: $inputText)
                        .focused($isInputActive)
                        .onSubmit {}
                    Spacer().frame(height: 16)
                    Text("Tap to toggle focus")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(8)
                        .onTapGesture {
                            isInputActive = !isInputActive
                        }
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Interactive behaviours",
            content: {
                tap()
                hover()
                focus()
            }
        )
    }
}

#Preview {
    SwiftUiInteractiveBehavioursView()
}
