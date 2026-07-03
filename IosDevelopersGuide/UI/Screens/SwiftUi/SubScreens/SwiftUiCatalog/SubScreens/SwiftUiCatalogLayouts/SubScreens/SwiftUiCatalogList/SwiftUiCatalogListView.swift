//
//  SwiftUiListView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogListView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiCatalogListViewModel
    
    func list() -> some View {
        return CustomSection(
            snippetTitle: "List",
            snippetDescription: """
            Layout elements in a list.
            If List is put inside a ScrollView, then it needs to be given fixed height to be visible.
            """,
            snippetCode: """
            List{
                Rectangle()
                    .frame(width: 64, height: 64)
                Rectangle()
                    .frame(width: 64, height: 64)
                Rectangle()
                    .frame(width: 64, height: 64)
            }.frame(height: 256)
            """,
            demoView: {
                List{
                    Rectangle()
                        .frame(width: 64, height: 64)
                    Rectangle()
                        .frame(width: 64, height: 64)
                    Rectangle()
                        .frame(width: 64, height: 64)
                }.frame(height: 256)
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "List",
            content: {
                list()
            }
        )
    }
}

//#Preview {
//    SwiftUiCatalogListView()
//}
