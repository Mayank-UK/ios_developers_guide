//
//  SwiftUiDisclosureGroupView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogDisclosureGroupView: View {
    func disclosureView() -> some View {
        return CustomSection(
            snippetTitle: "DisclosureView",
            snippetDescription: """
            DisclosureGroup is a view that shows or hides another content view based on the state of a disclosure control.
            """,
            snippetCode: """
            DisclosureGroup(content: {
                Text("More details here.")
            }, label: {
                Image(systemName: "info.circle")
                Text("Show Details")
            })
            """,
            demoView: {
                DisclosureGroup(content: {
                    Text("More details here.")
                }, label: {
                    Image(systemName: "info.circle")
                    Text("Show Details")
                })
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "DisclosureGroup",
            content: {
                disclosureView()
            }
        )
    }
}

#Preview {
    SwiftUiCatalogDisclosureGroupView()
}
