//
//  SwiftOptionals.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftOptionalsView: View {
    func optional() -> some View {
        return CustomSection(
            snippetTitle: "Optional",
            snippetDescription: """
            An optional in Swift is essentially a constant or variable that can hold either a value or no value (i.e., nil).
            Swift automatically initializes optionals to nil.
            
            To use the value stored in an optional, you need to unwrap it.
            
            Common ways to unwrap optionals:
            -Optional Binding (if let):
            -Forced Unwrapping (using !):
            -Nil-Coalescing Operator (??):
            """,
            snippetCode: """
            var username: String?
            
            //  optional binding (if let)
            if let unwrappedAge = age {
                print("Your age is \\(unwrappedAge)")
            } else {
                print("Age is unknown")
            }
            
            //  forced Unwrapping (using !)
            let unwrappedUsername = username!
            
            //  nil-Coalescing Operator (??):
            let favoriteColor = userFavoriteColor ?? "Blue"
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Optionals",
            content: {
                optional()
            }
        )

    }
}

#Preview {
    SwiftOptionalsView()
}
