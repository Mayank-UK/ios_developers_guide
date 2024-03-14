//
//  SwiftUiButtons.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogButtonsView: View {
    @State private var clipboardText: String = ""
    @FocusState private var isFocused: Bool
    @State private var renameText = "Rename this text"

    
    func simpleButton() -> some View {
        return CustomSection(
            snippetTitle: "Button",
            snippetDescription: """
            A control that performs an action when triggered.
            """,
            snippetCode: """
            Button(action: {
                print("Do something")
            }) {
                Text("Button")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.black)
            }
            """,
            demoView: {
                Button(action: {
                    print("Do something")
                }) {
                    Text("Button")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.black)
                }
            }
        )
    }
    
    func pasteButton() -> some View {
        return CustomSection(
            snippetTitle: "Paste button",
            snippetDescription: """
            A system button that reads items from the pasteboard and delivers it to a closure.
            """,
            snippetCode: """
            @State private var clipboardText: String = ""
            
            HStack {
                PasteButton(payloadType: String.self) { strings in
                    clipboardText = strings[0]
                }
                    .labelStyle(.titleOnly)
                Text("\(clipboardText)")
            }
            """,
            demoView: {
                HStack {
                    PasteButton(payloadType: String.self) { strings in
                        clipboardText = strings[0]
                    }
                        .labelStyle(.titleOnly)
                    Text("\(clipboardText)")
                }
            }
        )
    }

    func renameButton() -> some View {
        return CustomSection(
            snippetTitle: "Rename button",
            snippetDescription: """
            A button that triggeres a standard rename action.
            """,
            snippetCode: """
            @FocusState private var isFocused: Bool
            @State private var renameText = "Rename this text"
            
            VStack(alignment: .leading) {
                TextField(text: $renameText) {
                    Text("Tap, touch and hold, or swipe left to rename")
                }
                    .focused($isFocused)
                RenameButton()
                    .swipeActions(edge: .trailing) {
                        RenameButton()
                    }.contextMenu {
                        RenameButton()
                    }.renameAction {
                        isFocused = true
                    }
            }
            """,
            demoView: {
                VStack(alignment: .leading) {
                    TextField(text: $renameText) {
                        Text("Tap, touch and hold, or swipe left to rename")
                    }
                        .focused($isFocused)
                    RenameButton()
                        .swipeActions(edge: .trailing) {
                            RenameButton()
                        }.contextMenu {
                            RenameButton()
                        }.renameAction {
                            isFocused = true
                        }
                }
            }
        )
    }

    var body: some View {
        PageScaffold(
            pageTitle: "Buttons",
            content: {
                simpleButton()
                pasteButton()
                renameButton()
            }
        )
    }
}

#Preview {
    SwiftUiCatalogButtonsView()
}
