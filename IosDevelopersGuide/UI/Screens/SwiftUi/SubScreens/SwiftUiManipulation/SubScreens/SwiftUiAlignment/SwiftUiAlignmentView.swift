//
//  SwiftUiAlignment.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiAlignmentView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiAlignmentViewModel
    
    func alignmentProperty() -> some View {
        return CustomSection(
            snippetTitle: "Alignment property",
            snippetDescription: """
            Some views have alignment property that can be assigned for alignment.
            By default, alignment property of frame modifier will take precedence if frame modifier is used on an element, even if the property is not specified in frame, because by default frame has center alignment
            """,
            snippetCode: """
            VStack(alignment: .center) {
                Rectangle()
                    .frame(width: 64, height: 64)
            }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(.yellow)
            """,
            demoView: {
                VStack(alignment: .center) {
                    Rectangle()
                        .frame(width: 64, height: 64)
                }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.yellow)
            }
        )
    }
    
    func frameModifier() -> some View {
        return CustomSection(
            snippetTitle: "Frame modifier",
            snippetDescription: """
            Alignment using .frame() modifier by using it's alignment property
            """,
            snippetCode: """
            VStack(alignment: .trailing) {
                Rectangle()
                    .frame(width: 64, height: 64)
                Rectangle()
                    .frame(width: 64, height: 64)
                Rectangle()
                    .frame(width: 64, height: 64)
            }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(.yellow)
            """,
            demoView: {
                VStack {
                    Rectangle()
                        .frame(width: 64, height: 64)
                }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .background(.yellow)
            }
        )
    }


    var body: some View {
        PageScaffold(
            pageTitle: "Alignment",
            content: {
                alignmentProperty()
                frameModifier()
            }
        )
    }
}

//#Preview {
//    SwiftUiAlignmentView()
//}
