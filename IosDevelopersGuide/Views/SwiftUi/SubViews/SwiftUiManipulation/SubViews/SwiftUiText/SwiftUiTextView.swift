//
//  SwiftUiText.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiTextView: View {
    func textElement() -> some View {
        return CustomSection(
            snippetTitle: "Text element",
            snippetDescription: """
            Text() element is used to add text in SwiftUI
            """,
            snippetCode: """
            Text("Sample text")
            """,
            demoView: {
                Text("Sample text")
            }
        )
    }
    
    func basicTextStyling() -> some View {
        return CustomSection(
            snippetTitle: "Basic text styling",
            snippetDescription: """
            There are lot of modifiers for applying styling to the text, these modifiers can be applied to containers also, and need not to be applied directly to Text() element
            """,
            snippetCode: """
            Group {
                Text("This is sample text, it has many modifiers applied to change font size, font weight, font color, font style, line height, letter spacing etc")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .fontWeight(.semibold)
                    .kerning(0.5)
                    .lineSpacing(8)
                    .foregroundColor(.black)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(8)
            }
                .font(.system(size: 14, design: .monospaced))
            """,
            demoView: {
                Group {
                    Text("This is sample text, it has many modifiers applied to change font size, font weight, font color, font style, line height, letter spacing etc")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.semibold)
                        .kerning(0.5)
                        .lineSpacing(8)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
                    .font(.system(size: 14, design: .monospaced))
            }
        )
    }
    
    func fontFamily() -> some View {
        return CustomSection(
            snippetTitle: "Font family",
            snippetDescription: """
            Default font family for ios is San Fransico.
            To add font family in SwiftUI app:
                -Drag the font files (typically .ttf or .otf) into your Xcode project.
                -Ensure that the font files are included in the “Copy Bundle Resources” section of your app’s target.
                -Open the Info.plist file for your app.
                -Add a new key called UIAppFonts if your app is for iOS, watchOS, tvOS, or Mac Catalyst. For macOS apps, use ATSApplicationFontsPath.
                -Set the value of the key to an array of strings containing the file names of your fonts.
            """,
            snippetCode: """
            Text("Sample text")
                .font(Font.custom("Montserrat", size: 16))
            """,
            demoView: {
                Text("Sample text")
                    .font(Font.custom("Montserrat-Medium", size: 16))
            }
        )
    }

    var body: some View {
        PageScaffold(
            pageTitle: "Text",
            content: {
                textElement()
                basicTextStyling()
                fontFamily()
            }
        )
    }
}

#Preview {
    SwiftUiTextView()
}
