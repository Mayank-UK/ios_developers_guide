//
//  SwiftUiAmbientLightSensorView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 10/04/24.
//

import SwiftUI

struct SwiftUiAmbientLightSensorView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiAmbientLightSensorViewModel
    
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
            pageTitle: "Ambient light sensor",
            content: {
            }
        )
    }
}

//#Preview {
//    SwiftUiAmbientLightSensorView()
//}
