//
//  SwiftOperators.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftOperatorsView: View {
    func arithmetic() -> some View {
        return CustomSection(
            snippetTitle: "Arithmetic operators",
            snippetDescription: """
            Swift supports the standard arithmetic operators for all number types:
            -Addition (+): Adds two values.
            -Subtraction (-): Subtracts the second value from the first.
            -Multiplication (*): Multiplies two values.
            -Division (/): Divides the first value by the second.
            -Remainder (%): Calculates the remainder after division.
            """,
            snippetCode: """
            let sum = 5 + 3
            let product = 4 * 6
            """
        )
    }
    
    func assignment() -> some View {
        return CustomSection(
            snippetTitle: "Assignment operators",
            snippetDescription: """
            Initializes or updates the value of a variable with the value on the right side.
            """,
            snippetCode: """
            var age = 30
            age = 35
            """
        )
    }
    
    func comparison() -> some View {
        return CustomSection(
            snippetTitle: "Comparison operators",
            snippetDescription: """
            Used to compare values:
            -Equal to (==): Checks if two values are equal.
            -Not equal to (!=): Checks if two values are not equal.
            -Greater than (>), Less than (<), Greater than or equal to (>=), Less than or equal to (<=).
            """,
            snippetCode: """
            let x = 10
            let y = 20
            let isEqual = x == y
            """
        )
    }
    
    func logical() -> some View {
        return CustomSection(
            snippetTitle: "Logical operators",
            snippetDescription: """
            Used for logical operations:
            -Logical NOT (!): Inverts a Boolean value.
            -Logical AND (&&): Combines two Boolean values.
            -Logical OR (||): Returns true if either value is true.
            """,
            snippetCode: """
            let isSunny = true
            let isWarm = false
            let isNiceDay = isSunny && isWarm
            """
        )
    }
    
    func bitwise() -> some View {
        return CustomSection(
            snippetTitle: "Bitwise operators",
            snippetDescription: """
            Used for bit-level operations (e.g., working with individual bits in binary representation).
            Includes AND (&), OR (|), XOR (^), and more.
            """,
            snippetCode: """
            
            """
        )
    }
    
    func range() -> some View {
        return CustomSection(
            snippetTitle: "Range operators",
            snippetDescription: """
            Swift provides range operators:
            -Closed Range (a...b): Represents a range from a to b (inclusive).
            -Half-Open Range (a..<b): Represents a range from a up to, but not including, b.
            """,
            snippetCode: """
            let numbers = 1...10
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Operators",
            content: {
                arithmetic()
                assignment()
                comparison()
                logical()
                bitwise()
                range()
            }
        )

    }
}

#Preview {
    SwiftOperatorsView()
}
