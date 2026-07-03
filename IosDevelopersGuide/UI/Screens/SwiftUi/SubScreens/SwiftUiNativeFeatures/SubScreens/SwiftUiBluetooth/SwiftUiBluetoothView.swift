//
//  SwiftUiBluetoothView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 10/04/24.
//

import SwiftUI

struct SwiftUiBluetoothView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiBluetoothViewModel
    
    func _temp() -> some View {
        return CustomSection(
            snippetTitle: "",
            snippetDescription: """
            
            """,
            snippetCode: """
            
            """,
            demoView: {
            
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Bluetooth",
            content: {
            }
        )
    }
}

//#Preview {
//    SwiftUiBluetoothView()
//}
