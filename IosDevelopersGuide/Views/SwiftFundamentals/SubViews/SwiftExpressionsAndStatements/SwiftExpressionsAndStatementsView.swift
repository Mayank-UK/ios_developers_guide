//
//  SwiftExpressionsAndStatements.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftExpressionsAndStatementsView: View {
    func expressions() -> some View {
        return CustomSection(
            snippetTitle: "Expressions",
            snippetDescription: """
            An expression in Swift is a combination of variables, operators, literals, and functions.
            """,
            snippetCode: """
            var marks = 80
            """
        )
    }

    func statements() -> some View {
        return CustomSection(
            snippetTitle: "Statements",
            snippetDescription: """
            Statements are instructions that perform specific tasks.
            """,
            snippetCode: """
            var score = 9 * 5
            """
        )
    }
    
    func codeBlocks() -> some View {
        return CustomSection(
            snippetTitle: "Code blocks",
            snippetDescription: """
            A code block is a group of statements enclosed in curly braces { }.
            """,
            snippetCode: """
            if true {
                let sum = 2 + 3
                print("Result is \\(sum)")
            }
            """
        )
    }


    
    var body: some View {
        PageScaffold(
            pageTitle: "Expressions and statements",
            content: {
                expressions()
                statements()
                codeBlocks()
            }
        )

    }
}

#Preview {
    SwiftExpressionsAndStatementsView()
}
