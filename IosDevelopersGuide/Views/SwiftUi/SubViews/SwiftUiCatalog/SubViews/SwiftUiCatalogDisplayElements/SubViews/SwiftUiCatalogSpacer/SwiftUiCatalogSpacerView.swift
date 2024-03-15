//
//  SwiftUiSpacerView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogSpacerView: View {
    func spacer() -> some View {
        return CustomSection(
            snippetTitle: "Spacer",
            snippetDescription: """
            Add space between UI elements.
            """,
            snippetCode: """
            HStack{
                Rectangle()
                    .frame(width: 64, height: 64)
                Spacer().frame(width: 32)
                Rectangle()
                    .frame(width: 64, height: 64)
            }
            """,
            demoView: {
                HStack{
                    Rectangle()
                        .frame(width: 64, height: 64)
                    Spacer().frame(width: 32)
                    Rectangle()
                        .frame(width: 64, height: 64)
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Spacer",
            content: {
                spacer()
            }
        )
    }
}

#Preview {
    SwiftUiCatalogSpacerView()
}
