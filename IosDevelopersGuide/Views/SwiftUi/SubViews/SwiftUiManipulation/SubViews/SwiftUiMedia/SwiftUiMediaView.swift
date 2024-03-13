//
//  SwiftUiMedia.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiMediaView: View {
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

#Preview {
    SwiftUiMediaView()
}
