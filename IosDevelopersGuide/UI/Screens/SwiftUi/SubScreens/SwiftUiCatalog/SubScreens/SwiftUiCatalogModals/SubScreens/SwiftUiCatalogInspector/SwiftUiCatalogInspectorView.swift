//
//  SwiftUiInspectorView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogInspectorView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogInspectorViewModel
    
    @State private var isShowingInspector = false
    
    func inspector() -> some View {
        return CustomSection(
            snippetTitle: "Inspector",
            snippetDescription: """
            Modifier to allow to add an inspector view anywhere.
            """,
            snippetCode: """
            Button("Show inspector") {
                isShowingInspector.toggle()
            }
                .inspector(isPresented: $isShowingInspector) {
                    Text("Inspector View")
                        .inspectorColumnWidth(min: 64, ideal: 128, max: 256)
                }
            """,
            demoView: {
                Button("Show inspector") {
                    isShowingInspector.toggle()
                }
                    .inspector(isPresented: $isShowingInspector) {
                        Text("Inspector View")
                            .inspectorColumnWidth(min: 64, ideal: 128, max: 256)
                    }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Inspector",
            content: {
                inspector()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogInspectorView()
//}
