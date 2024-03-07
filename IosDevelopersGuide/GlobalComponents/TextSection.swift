//
//  Section.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct TextSection: View {
    let title: String
    let description: String
    
    var body: some View {
        Group {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(description)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .kerning(0.5)
                .lineSpacing(8)
                .foregroundColor(.black)
                .background(Color.black.opacity(0.1))
                .cornerRadius(8)
        }
            .padding()
    }
}

#Preview {
    TextSection(
        title: "Title",
        description: "This is demo section"
    )
}
