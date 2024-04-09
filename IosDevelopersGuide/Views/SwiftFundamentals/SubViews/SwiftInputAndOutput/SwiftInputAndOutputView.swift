//
//  SwiftInputAndOutput.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftInputAndOutputView: View {
    func input() -> some View {
        return CustomSection(
            snippetTitle: "Input",
            snippetDescription: """
            Take the input from the user through console.
            """,
            snippetCode: """
            print("Enter your name:")
            if let name = readLine() {
                print("Hello, \\(name)! Welcome to Swift.")
            } else {
                print("No input provided.")
            }
            """
        )
    }
    
    func output() -> some View {
        return CustomSection(
            snippetTitle: "Output",
            snippetDescription: """
            Output to console.
            """,
            snippetCode: """
            print("Hello world!")
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Input and output",
            content: {
                input()
                output()
            }
        )

    }
}

#Preview {
    SwiftInputAndOutputView()
}
