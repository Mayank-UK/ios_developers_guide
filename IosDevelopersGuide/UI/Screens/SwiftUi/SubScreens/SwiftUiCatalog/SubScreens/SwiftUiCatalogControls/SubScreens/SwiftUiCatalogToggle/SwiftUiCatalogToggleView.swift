//
//  SwiftUiToggles.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogToggleView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogToggleViewModel
    
    @State private var toggleStatus: Bool = true
    
    func toggle() -> some View {
        return CustomSection(
            snippetTitle: "Toggle",
            snippetDescription: """
            A control that toggles between an on and off state.
            """,
            snippetCode: """
            @State private var toggleStatus: Bool = true
            
            Toggle("Switch", isOn: $toggleStatus)
                .toggleStyle(SwitchToggleStyle(tint: .accentColor))
            """,
            demoView: {
                Toggle("Togglable switch", isOn: $toggleStatus)
                    .toggleStyle(SwitchToggleStyle(tint: .accentColor))
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Toggle",
            content: {
                toggle()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogToggleView()
//}
