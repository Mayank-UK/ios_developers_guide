//
//  IosDevelopment.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct IosDevelopmentView: View {
    func developmentLanguages() -> some View {
        return CustomSection(
            snippetTitle: "Languages",
            snippetDescription: """
            IOS development can be done in 2 languages:
            1) C# (old way)
            2) Swift (new way, recommended way)
            """
        )
    }
    
    func developmentTools() -> some View {
        return CustomSection(
            snippetTitle: "Tools",
            snippetDescription: """
            All software development done for apple devices is done using xcode which includes iPhone, macbook, iWatch, apple vision, etc.
            
            Xcode is an IDE developed by apple specially for apple ecosystem.
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Development",
            content: {
                developmentLanguages()
                developmentTools()
            }
        )
    }
}

#Preview {
    IosDevelopmentView()
}
