//
//  SwiftUiPositioning.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiPositioningView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: SwiftUiPositioningViewModel
    
    func positioning() -> some View {
        return CustomSection(
            snippetTitle: "Positioning",
            snippetDescription: """
            Layout items anywhere on the screen by taking them out of normal layout flow.
            This is done using ZStack() and offset modifier on child elements.
            The offset modifier will also work even if elements are not placed directly inside the ZStack
            """,
            snippetCode: """
            ZStack {
                Rectangle()
                    .strokeBorder(Color.white, lineWidth: 0.1)
                    .frame(width: 64, height: 64)
                    .background(Color.red)
                Rectangle()
                    .strokeBorder(Color.white, lineWidth: 0.1)
                    .frame(width: 64, height: 64)
                    .background(Color.black)
                    .opacity(0.4)
                    .offset(x: 16, y: 16)
            }
            """,
            demoView: {
                ZStack {
                    Rectangle()
                        .strokeBorder(Color.white, lineWidth: 0.1)
                        .frame(width: 64, height: 64)
                        .background(Color.red)
                    Rectangle()
                        .strokeBorder(Color.white, lineWidth: 0.1)
                        .frame(width: 64, height: 64)
                        .background(Color.black)
                        .opacity(0.4)
                        .offset(x: 16, y: 16)
                }
            }
        )
    }
        
    var body: some View {
        PageScaffold(
            pageTitle: "Positioning",
            content: {
                positioning()
            }
        )
    }
}

//#Preview {
//    SwiftUiPositioningView()
//}
