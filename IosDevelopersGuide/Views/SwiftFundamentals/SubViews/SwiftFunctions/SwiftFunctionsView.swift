//
//  SwiftFunctions.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftFunctionsView: View {
    func functions() -> some View {
        return CustomSection(
            snippetTitle: "Functions",
            snippetDescription: """
            A function in Swift is a self-contained unit of code that performs a specific task.
            """,
            snippetCode: """
            func average(_ numbers: Double...) -> Double {
                let total = numbers.reduce(0, +)
                return total / Double(numbers.count)
            }
            
            let avg = average(10, 20, 30)
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Functions",
            content: {
                functions()
            }
        )

    }
}

#Preview {
    SwiftFunctionsView()
}
