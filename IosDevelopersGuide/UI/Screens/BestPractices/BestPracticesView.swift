//
//  SwiftUiBestPractices.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct BestPracticesView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: BestPracticesViewModel
    
    func generalBestPractices() -> some View {
        return CustomSection(
            snippetTitle: "General best practices",
            snippetDescription: """
            1) Clear the fundamentals
            2) Follow the apple human interface guidelines at https://developer.apple.com/design/human-interface-guidelines
            3) Follow consistent coding style throughout the app, refer to IosDevelopersGuide
            """
        )
    }
    
    func swiftUiBestPractices() -> some View {
        return CustomSection(
            snippetTitle: "SwiftUi best practices",
            snippetDescription: """
            
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Best practices",
            content: {
                generalBestPractices()
                swiftUiBestPractices()
            }
        )
    }
}

//#Preview {
//    BestPracticesView()
//}
