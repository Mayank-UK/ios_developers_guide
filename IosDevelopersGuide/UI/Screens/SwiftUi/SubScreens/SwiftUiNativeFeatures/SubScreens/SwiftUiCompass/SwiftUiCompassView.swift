//
//  SwiftUiCompassView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 10/04/24.
//

import SwiftUI

struct SwiftUiCompassView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCompassViewModel
    
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
            pageTitle: "Compass",
            content: {
            }
        )
    }
}

//#Preview {
//    SwiftUiCompassView()
//}
