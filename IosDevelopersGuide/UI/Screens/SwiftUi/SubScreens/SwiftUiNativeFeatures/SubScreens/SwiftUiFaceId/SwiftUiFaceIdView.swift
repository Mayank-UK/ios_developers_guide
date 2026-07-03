//
//  SwiftUIFaceIdView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 10/04/24.
//

import SwiftUI

struct SwiftUIFaceIdView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUIFaceIdViewModel
    
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
            pageTitle: "Face ID",
            content: {
            }
        )
    }
}

//#Preview {
//    SwiftUIFaceIdView()
//}
