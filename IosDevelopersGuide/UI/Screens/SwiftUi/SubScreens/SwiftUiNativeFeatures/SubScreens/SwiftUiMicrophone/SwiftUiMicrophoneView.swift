//
//  SwiftUiMicrophoneView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 10/04/24.
//

import SwiftUI

struct SwiftUiMicrophoneView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiMicrophoneViewModel
    
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
            pageTitle: "Microphone",
            content: {
            }
        )
    }
}

//#Preview {
//    SwiftUiMicrophoneView()
//}
