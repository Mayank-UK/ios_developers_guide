//
//  Installation.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct SwiftInstallationView: View {
    func installation() -> some View {
        return CustomSection(
            snippetTitle: "Installation",
            snippetDescription: """
            Swift is installed automatically with xcode.
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Installation",
            content: {
                installation()
            }
        )

    }
}

#Preview {
    SwiftInstallationView()
}
