//
//  SwiftUiApiHandling.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI
import Combine

struct ApiHandlingView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: ApiHandlingViewModel
    @EnvironmentObject var router: Router
    
    func basics() -> some View {
        return CustomSection(
            snippetTitle: "Fetch posts",
            snippetDescription: """
            Posts example
            """,
            snippetCode: """
            
            """,
            demoView: {
                Button {
                    router.navigateTo(routePath: Router.routePaths.posts)
                } label: {
                    Text("Fetch posts")
                }

            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "API handling",
            content: {
                basics()
            }
        )
    }
}

//#Preview {
//    ApiHandlingView()
//}
