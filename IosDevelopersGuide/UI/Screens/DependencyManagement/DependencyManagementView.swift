//
//  PackageManager.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct DependencyManagementView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: DependencyManagementViewModel
    
    func _temp() -> some View {
        return CustomSection(
            snippetTitle: "",
            snippetDescription: """
            
            """,
            snippetCode: """
            
            """,
            demoView: {
            
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Package manager",
            content: {
            }
        )
    }
}

//#Preview {
//    DependencyManagementView()
//}
