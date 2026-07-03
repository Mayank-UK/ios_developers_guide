//
//  SwiftUiTextFields.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogTextEditorView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogTextEditorViewModel
    
    @State private var textEditor: String = """
    This is placeholder text
    inside TextEditor
    """
    
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
    
    var body: some View {
        PageScaffold(
            pageTitle: "TextEditor",
            content: {
                textEditorInput()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogTextFieldView()
//}
