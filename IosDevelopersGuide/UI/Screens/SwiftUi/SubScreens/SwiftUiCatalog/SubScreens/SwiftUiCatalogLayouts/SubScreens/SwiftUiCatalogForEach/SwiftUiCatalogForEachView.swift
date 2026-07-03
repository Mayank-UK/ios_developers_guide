//
//  SwiftUiForEachView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogForEachView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogForEachViewModel
    
    func forEach() -> some View {
        return CustomSection(
            snippetTitle: "ForEach",
            snippetDescription: """
            Layout elements on demand by iterating over a list of data.
            """,
            snippetCode: """
            Group {
                ForEach(["Apple", "Banana", "Cherry"], id: \\.self) { fruit in
                    Rectangle()
                        .frame(width: 64, height: 64)
                }
            }
            """,
            demoView: {
                Group {
                    ForEach(["Apple", "Banana", "Cherry"], id: \.self) { fruit in
                        Rectangle()
                            .frame(width: 64, height: 64)
                    }
                }
            }
        )
    }

    var body: some View {
        PageScaffold(
            pageTitle: "ForEach",
            content: {
                forEach()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogForEachView()
//}
