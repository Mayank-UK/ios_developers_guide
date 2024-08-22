//
//  SwiftUiProximitySensorView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 10/04/24.
//

import SwiftUI

struct SwiftUiProximitySensorView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiProximitySensorViewModel
    
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
            pageTitle: "Proximity sensor",
            content: {
            }
        )
    }
}

//#Preview {
//    SwiftUiProximitySensorView()
//}
