//
//  SwiftVariablesAndConstants.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftVariablesAndConstantsView: View {
    func variables() -> some View {
        return CustomSection(
            snippetTitle: "Variables",
            snippetDescription: """
            A variable is a container that holds data.
            """,
            snippetCode: """
            var s: String = "hello"
            """
        )
    }

    func constants() -> some View {
        return CustomSection(
            snippetTitle: "Constants",
            snippetDescription: """
            A constant is a special type of variable whose value cannot be changed.
            """,
            snippetCode: """
            let s: String = "hello"
            """
        )
    }

    var body: some View {
        PageScaffold(
            pageTitle: "Variables and constants",
            content: {
                variables()
                constants()
            }
        )

    }
}

#Preview {
    SwiftVariablesAndConstantsView()
}
