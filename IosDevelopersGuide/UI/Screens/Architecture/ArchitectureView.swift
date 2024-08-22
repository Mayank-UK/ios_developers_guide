//
//  SwiftUiCodeArchitecture.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct ArchitectureView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: ArchitectureViewModel
    
    func basics() -> some View {
        return CustomSection(
            snippetTitle: "Architecture",
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
            pageTitle: "Architecture",
            content: {
                basics()
            }
        )
    }
}

//#Preview {
//    ArchitectureView()
//}
