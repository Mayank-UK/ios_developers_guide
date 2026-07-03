//
//  SwiftUiSheetView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogSheetView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogSheetViewModel
    
    @State private var shouldPresentSheet = false

    func sheet() -> some View {
        return CustomSection(
            snippetTitle: "Sheet",
            snippetDescription: """
            Modifier to show a sheet to a user.
            """,
            snippetCode: """
            @State private var shouldPresentSheet = false
            
            Button("Show sheet") {
                shouldPresentSheet.toggle()
            }
            .sheet(isPresented: $shouldPresentSheet) {
                Button("Dismiss") {
                    shouldPresentSheet = false
                }
            }
            """,
            demoView: {
                Button("Show sheet") {
                    shouldPresentSheet.toggle()
                }
                .sheet(isPresented: $shouldPresentSheet) {
                    Button("Dismiss") {
                        shouldPresentSheet = false
                    }
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Sheet",
            content: {
                sheet()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogSheetView()
//}
