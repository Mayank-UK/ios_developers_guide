//
//  SwiftUiStepper.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogStepperView: View {
    @State private var count: Int = 0
    
    func stepper() -> some View {
        return CustomSection(
            snippetTitle: "Stepper",
            snippetDescription: """
            A control used to perform semantic increment and decrement actions.
            """,
            snippetCode: """
            @State private var count: Int = 0
            
            Stepper("\\(count)",
                value: $count,
                in: 0...100
            )
            """,
            demoView: {
                Stepper("\(count)",
                    value: $count,
                    in: 0...100
                )
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Stepper",
            content: {
                stepper()
            }
        )
    }
}

#Preview {
    SwiftUiCatalogStepperView()
}
