//
//  SwiftUiColorsAndBackground.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiColorsAndBackgroundsView: View {
    
    func textColor() -> some View {
        return CustomSection(
            snippetTitle: "Text color",
            snippetDescription: """
            Color of the text
            """,
            snippetCode: """
            Text("Demo text in green color")
                .foregroundColor(.green)
            """,
            demoView: {
                Text("Demo text in green color")
                    .foregroundColor(.green)
            }
        )
    }
    
    func backgroundColor() -> some View {
        return CustomSection(
            snippetTitle: "Background color",
            snippetDescription: """
            Background color of an element.
            Most of the time background can be applied using modifier .background(), but for few elements different modifiers are used
            """,
            snippetCode: """
            //  background using .background() modifier
            Text("")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
            
            //  background using .fill() modifier
            Rectangle()
                .fill(Color.green)
                .frame(width: 64, height: 64)
            """,
            demoView: {
                Text("")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 64, height: 64)
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Colors and backgrounds",
            content: {
                textColor()
                backgroundColor()
            }
        )
    }
}

#Preview {
    SwiftUiColorsAndBackgroundsView()
}
