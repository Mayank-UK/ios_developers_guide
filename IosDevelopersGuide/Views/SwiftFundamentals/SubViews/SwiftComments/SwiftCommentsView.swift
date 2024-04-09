//
//  SwiftComments.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftCommentsView: View {
    func singleLineComments() -> some View {
        return CustomSection(
            snippetTitle: "Single line comments",
            snippetDescription: """
            A comment is something whose syntax is not taken into consideration.
            Comment a single line.
            """,
            snippetCode: """
            //  This is single line comment.
            """
        )
    }
    
    func multiLineComments() -> some View {
        return CustomSection(
            snippetTitle: "Multi line comments",
            snippetDescription: """
            Comment multiple lines.
            """,
            snippetCode: """
            /*
                This is a
                multi-line comment.
            */
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Comments",
            content: {
                singleLineComments()
                multiLineComments()
            }
        )

    }
}

#Preview {
    SwiftCommentsView()
}
