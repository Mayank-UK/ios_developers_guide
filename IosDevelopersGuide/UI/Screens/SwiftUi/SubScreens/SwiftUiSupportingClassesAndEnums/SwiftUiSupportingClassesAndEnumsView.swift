//
//  SwiftUiSupportingClassesAndEnums.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiSupportingClassesAndEnumsView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiSupportingClassesAndEnumsViewModel
    
    func color() -> some View {
        return CustomSection(
            snippetTitle: "Color",
            snippetDescription: """
            We can work with colors using the built-in Color struct.
            This struct provides a range of default system colors that match the appearance of native iOS, macOS, watchOS, and tvOS interfaces.
            These colors are automatically adjusted based on the user’s preferred color scheme and accessibility settings
            """,
            snippetCode: """
            Rectangle()
                .fill(Color.red)
                .frame(width: 128, height: 64)
            """
        )
    }
    
    func axis() -> some View {
        return CustomSection(
            snippetTitle: "Axis",
            snippetDescription: """
            This struct defines two static properties horizontal/vertical, it represents an efficient set of axes.
            """,
            snippetCode: """
            ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(0..<10) { index in
                        Text("Item \\(index)")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .frame(width: 200, height: 200)
                            .background(.red)
                    }
                }
            }
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Supporting classes and enums",
            content: {
                color()
                axis()
            }
        )
    }
}

//#Preview {
//    SwiftUiSupportingClassesAndEnumsView()
//}
