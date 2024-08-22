//
//  SwiftUiSpeakersView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 10/04/24.
//

import SwiftUI

struct SwiftUiSpeakersView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiSpeakersViewModel
    
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
            pageTitle: "Speakers",
            content: {
            }
        )
    }
}

//#Preview {
//    SwiftUiSpeakersView()
//}
