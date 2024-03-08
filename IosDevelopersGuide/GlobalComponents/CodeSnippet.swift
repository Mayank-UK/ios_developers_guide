//
//  CodeSnippet.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct CodeSnippet: View {
    let snippetTitle: String
    let snippetCode: String
    
    var body: some View {
        VStack {
            Text(snippetTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
                .font(.system(size: 24))
            ScrollView(.horizontal) {
                Text(snippetCode)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .font(.system(size: 14, design: .monospaced))
                    .kerning(0.5)
                    .lineSpacing(8)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(8)
             
            }
        }
            .padding()
    }
}

#Preview {
    CodeSnippet(
        snippetTitle: "Test",
        snippetCode: """
        Text("This is a demo code snippet, it has a title and code snippet")
        """
    )
}
