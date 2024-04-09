//
//  IosInstallationAndSetup.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct IosInstallationAndSetupView: View {
    func installation() -> some View {
        return CustomSection(
            snippetTitle: "Installation",
            snippetDescription: """
            Installation basically requires installation of xcode. Refer to latest online intallation guide.
            """
        )
    }
    
    func setup() -> some View {
        return CustomSection(
            snippetTitle: "Setup",
            snippetDescription: """
            Setup involves setting up xcode for ios development. Refer to latest online resources for setup of ios development.
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Installation and setup",
            content: {
                installation()
                setup()
            }
        )
    }
}

#Preview {
    IosInstallationAndSetupView()
}
