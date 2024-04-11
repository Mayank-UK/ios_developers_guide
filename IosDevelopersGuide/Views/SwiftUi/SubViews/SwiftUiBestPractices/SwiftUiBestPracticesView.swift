//
//  SwiftUiBestPractices.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiBestPracticesView: View {
    func bestPractices() -> some View {
        return CustomSection(
            snippetTitle: "Best practices",
            snippetDescription: """
            1) Clear the fundamentals
            2) Follow the apple human interface guidelines at https://developer.apple.com/design/human-interface-guidelines
            3) Follow consistent coding style throughout the app, refer to IosDevelopersGuide
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Best practices",
            content: {
                bestPractices()
            }
        )
    }
}

#Preview {
    SwiftUiBestPracticesView()
}
