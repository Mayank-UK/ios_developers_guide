//
//  SwiftUiCodeArchitecture.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiCodeArchitectureView: View {
    func screenCodeArchitecture() -> some View {
        return CustomSection(
            snippetTitle: "Screen code architecture",
            snippetDescription: """
            There are many ways to organise code for a screen, but 2 are very common:
            
            1) Separate struct: Use when you want something, custom and reusable.
            
            2) Separate function: Use when you want something private and internal.
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Code architecture",
            content: {
                screenCodeArchitecture()
            }
        )
    }
}

#Preview {
    SwiftUiCodeArchitectureView()
}
