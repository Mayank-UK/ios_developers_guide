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
    
    var body: some View {
        PageScaffold(
            pageTitle: "TextField",
            content: {
                textField()
            }
        )
    }
}

#Preview {
    SwiftUiCatalogTextFieldView()
}
