//
//  TempView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import SwiftUI

struct TempView: View {
    // inject the viewModel from route
    @StateObject var viewModel: TempViewModel
    
    func basics() -> some View {
        Text("Hello world!")
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "TestView",
            content: {
                basics()
            }
        )
    }
}

//#Preview {
//    TempView()
//}
