//
//  SwiftUiConfirmationDialogView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogConfirmationDialogView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiCatalogConfirmationDialogViewModel
    
    @State private var confirmationShown = false
    
    func confirmationDialog() -> some View {
        return CustomSection(
            snippetTitle: "ConfirmationDialog",
            snippetDescription: """
            Modifier to display confirmation dialogs to the user.
            """,
            snippetCode: """
            Button("Delete Item") {
                    confirmationShown = true
            }
                .confirmationDialog("Are you sure?", isPresented: $confirmationShown) {
                    Button("Yes") {
                        
                    }
                    Button("No", role: .cancel) {
                        
                    }
                }
            """,
            demoView: {
                Button("Delete Item") {
                        confirmationShown = true
                }
                    .confirmationDialog("Are you sure?", isPresented: $confirmationShown) {
                        Button("Yes") {
                            
                        }
                        Button("No", role: .cancel) {
                            
                        }
                    }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Confirmation dialog",
            content: {
                confirmationDialog()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogConfirmationDialogView()
//}
