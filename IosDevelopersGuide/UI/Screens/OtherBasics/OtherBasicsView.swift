//
//  OtherBasics.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 21/08/24.
//

import SwiftUI

struct OtherBasicsView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: OtherBasicsViewModel
    
    var body: some View {
        PageScaffold(
            pageTitle: "Other basics",
            content: {
                
            }
        )
    }
}

//#Preview {
//    OtherBasicsView()
//}
