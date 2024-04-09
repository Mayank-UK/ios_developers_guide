//
//  SwiftIntroduction.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftIntroductionView: View {
    func introduction() -> some View {
        return CustomSection(
            snippetTitle: "Introduction",
            snippetDescription: """
            Swift is a general-purpose, open-source programming language developed by Apple.
            It’s designed to create applications for platforms like iOS, macOS, watchOS, and more.
            Swift code is readable, expressive, and easy to write.
            It offers interoperability with existing Objective-C projects.
            Swift is also used in server applications, providing security and high performance.
            It is fast, safe and easy to write with modern syntax.
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Introduction",
            content: {
                introduction()
            }
        )

    }
}

#Preview {
    SwiftIntroductionView()
}
