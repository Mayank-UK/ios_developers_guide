//
//  DatabaseHandlingView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 21/08/24.
//

import SwiftUI

struct DatabaseHandlingView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: DatabaseHandlingViewModel
    
    var body: some View {
        PageScaffold(
            pageTitle: "Database handling",
            content: {
                
            }
        )
    }
}

//#Preview {
//    DatabaseHandlingView()
//}
