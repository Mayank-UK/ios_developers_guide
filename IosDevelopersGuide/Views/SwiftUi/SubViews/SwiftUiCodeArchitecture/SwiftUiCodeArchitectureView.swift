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
            
            1) Separate struct: Use when you want something, custom and reusable like buttons, etc
            
            2) Separate function: Use when you want something private and internal for that screen, like header of that screen, etc
            """
        )
    }
    
    func codeArchitecture() -> some View {
        return CustomSection(
            snippetTitle: "Code architecture",
            snippetDescription: """
            The code can be structured in a way to make it simple to read, write and maintain:
            
            /Core
                Contants
                DesignSystem
                Helpers
                Router
                SharedDataLayer
                Validators
            
            /GlobalComponents
                Button
                InputField
            
            /GlobalModals
                Base
            
            /Services
                ApiService
                LocalStorageService
            
            /Views
                /Home
                    HomeView
                    HomeData
                /AnotherScreen
            
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Code architecture",
            content: {
                screenCodeArchitecture()
                codeArchitecture()
            }
        )
    }
}

#Preview {
    SwiftUiCodeArchitectureView()
}
