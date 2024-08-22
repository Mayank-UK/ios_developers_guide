//
//  SwiftUiMedia.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiMediaView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiMediaViewModel
    
    func audio() -> some View {
        return CustomSection(
            snippetTitle: "Audio",
            snippetDescription: """
            Audio playback.
            """,
            snippetCode: """
            
            """,
            demoView: {
            
            }
        )
    }
    
    func video() -> some View {
        return CustomSection(
            snippetTitle: "Video",
            snippetDescription: """
            Video playback
            """,
            snippetCode: """
            
            """,
            demoView: {
            
            }
        )
    }

    var body: some View {
        PageScaffold(
            pageTitle: "Media",
            content: {
                audio()
                video()
            }
        )
    }
}

//#Preview {
//    SwiftUiMediaView()
//}
