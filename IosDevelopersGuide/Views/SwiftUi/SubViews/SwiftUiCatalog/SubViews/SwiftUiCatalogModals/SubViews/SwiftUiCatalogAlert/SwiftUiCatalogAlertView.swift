//
//  SwiftUiAlertView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogAlertView: View {
    @State private var showingAlert = false
    
    func alert() -> some View {
        return CustomSection(
            snippetTitle: "Alert",
            snippetDescription: """
            Modifier to display alerts to the user.
            """,
            snippetCode: """
            Button("Show Alert") {
                showingAlert = true
            }
                .alert("Important message", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
            """,
            demoView: {
                Button("Show Alert") {
                    showingAlert = true
                }
                    .alert("Important message", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Alert",
            content: {
                alert()
            }
        )
    }
}

#Preview {
    SwiftUiCatalogAlertView()
}
