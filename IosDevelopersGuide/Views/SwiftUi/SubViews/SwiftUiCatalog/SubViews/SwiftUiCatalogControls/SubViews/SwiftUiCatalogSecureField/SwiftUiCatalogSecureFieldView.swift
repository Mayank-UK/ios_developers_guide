//
//  SwiftUiCatalogSecureFieldView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 14/03/24.
//

import SwiftUI

struct SwiftUiCatalogSecureFieldView: View {
    @State private var password: String = ""
    
    func secureField() -> some View {
        return CustomSection(
            snippetTitle: "SecureField",
            snippetDescription: """
            A control into which the user securely enters the private text.
            """,
            snippetCode: """
            SecureField("Password", text: $password)
            """,
            demoView: {
                SecureField("Password", text: $password)
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "SecureField",
            content: {
                secureField()
            }
        )
    }
}

#Preview {
    SwiftUiCatalogSecureFieldView()
}
