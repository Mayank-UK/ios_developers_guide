//
//  SwiftEnumAndStructs.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftEnumAndStructsView: View {
    func enums() -> some View {
        return CustomSection(
            snippetTitle: "Enums",
            snippetDescription: """
            Enums are a powerful way to represent a fixed set of related values. They allow you to define a type that can take on one of several predefined cases.
            
            Use cases:
            - State Modeling: Use enums to represent different states or options. For example, days of the week, HTTP status codes, or different modes (e.g., light mode vs. dark mode).
            - Limited Possibilities: When you want to restrict a variable to a specific set of values, enums are ideal.
            - Pattern Matching: Enums work seamlessly with switch statements for pattern matching.
            """,
            snippetCode: """
            enum CompassDirection {
                case north
                case south
                case east
                case west
            }
            
            let currentDirection = CompassDirection.north
            """
        )
    }
    
    func structs() -> some View {
        return CustomSection(
            snippetTitle: "Structs",
            snippetDescription: """
            Structs allow you to create custom data types with properties and methods. They are value types, meaning they are copied when assigned or passed around.
            
            Use cases:
            - Data Modeling: Use structs to model real-world entities or data structures. For instance, representing a point in 2D space, a user profile, or a configuration.
            - Immutable Properties: Struct properties are immutable by default, which can be useful for ensuring data consistency.
            - Performance: Structs are lightweight and efficient, making them suitable for small data structures.
            """,
            snippetCode: """
            struct Point {
                var x: Double
                var y: Double
            }
            
            let origin = Point(x: 0.0, y: 0.0)
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Enum and struct",
            content: {
                enums()
                structs()
            }
        )

    }
}

#Preview {
    SwiftEnumAndStructsView()
}
