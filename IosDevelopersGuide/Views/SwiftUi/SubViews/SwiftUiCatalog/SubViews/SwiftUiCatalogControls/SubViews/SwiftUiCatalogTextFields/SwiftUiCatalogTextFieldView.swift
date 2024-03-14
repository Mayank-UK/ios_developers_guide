//
//  SwiftUiTextFields.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogTextFieldView: View {
    @FocusState private var isFocused: Bool
    @State private var text: String = ""
    @State private var textEditor: String = """
    This is placeholder text
    inside TextEditor
    """
    @State private var password: String = ""
    
    func textField() -> some View {
        return CustomSection(
            snippetTitle: "TextField",
            snippetDescription: """
            An view that takes user input from keyboard.
            """,
            snippetCode: """
            @FocusState private var isFocused: Bool
            @State private var text: String = ""
            
            TextField("Placeholder", text: $text)
                .focused($isFocused)
            """,
            demoView: {
                TextField("Placeholder", text: $text)
                    .focused($isFocused)
            }
        )
    }
    
    func textEditorInput() -> some View {
        return CustomSection(
            snippetTitle: "TextEditor",
            snippetDescription: """
            An view that takes user input from keyboard.
            """,
            snippetCode: """
            @State private var textEditor: String = ""
            
            TextEditor(text: $textEditor)
                .frame(height: 128)
            """,
            demoView: {
                TextEditor(text: $textEditor)
                    .frame(height: 128)
            }
        )
    }
    
    func secureField() -> some View {
        return CustomSection(
            snippetTitle: "SecureField",
            snippetDescription: """
            A control into which the user securely enters the private text.
            """,
            snippetCode: """
            
            """,
            demoView: {
                SecureField("Password", text: $password)
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "TextField",
            content: {
                textField()
                textEditorInput()
                secureField()
            }
        )
    }
}

#Preview {
    SwiftUiCatalogTextFieldView()
}
