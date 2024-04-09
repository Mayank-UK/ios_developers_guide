//
//  SwiftDataTypes.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftDataTypesView: View {
    func int() -> some View {
        return CustomSection(
            snippetTitle: "Int",
            snippetDescription: """
            Represents whole numbers without fractional components.
            
            Variants include:
            -Int8: 8-bit signed integer (-128 to 127)
            -Int16: 16-bit signed integer (-32,768 to 32,767)
            -Int32: 32-bit signed integer (-2,147,483,648 to 2,147,483,647)
            -Int64: 64-bit signed integer
            """,
            snippetCode: """
            let age: Int = 30
            """
        )
    }
    
    func float() -> some View {
        return CustomSection(
            snippetTitle: "Float",
            snippetDescription: """
            32-bit floating-point number.
            """,
            snippetCode: """
            let pi: Float = 3.14159
            """
        )
    }
    
    func double() -> some View {
        return CustomSection(
            snippetTitle: "Double",
            snippetDescription: """
            64-bit floating-point number (more precise).
            """,
            snippetCode: """
            let pi: Double = 3.14159
            """
        )
    }
    
    func character() -> some View {
        return CustomSection(
            snippetTitle: "Character",
            snippetDescription: """
            Represents a single Unicode character.
            """,
            snippetCode: """
            let initial: Character = "A"
            """
        )
    }
    
    func string() -> some View {
        return CustomSection(
            snippetTitle: "String",
            snippetDescription: """
            Represents textual data (e.g., words, sentences).
            """,
            snippetCode: """
            let greeting: String = "Hello, World!"
            """
        )
    }
    
    func bool() -> some View {
        return CustomSection(
            snippetTitle: "Bool",
            snippetDescription: """
            Represents logical values: true or false.
            """,
            snippetCode: """
            let isSunny: Bool = true
            """
        )
    }
    
    func array() -> some View {
        return CustomSection(
            snippetTitle: "Array",
            snippetDescription: """
            An array is an ordered, random-access collection of elements of a single type.
            """,
            snippetCode: """
            let fruits = ["apple", "banana", "orange"]
            """
        )
    }
    
    func set() -> some View {
        return CustomSection(
            snippetTitle: "Set",
            snippetDescription: """
            A set is an unordered collection of unique elements.
            """,
            snippetCode: """
            let ingredients: Set = ["cocoa beans", "sugar", "cocoa butter", "salt"]
            """
        )
    }
    
    func dictionary() -> some View {
        return CustomSection(
            snippetTitle: "Dictionary",
            snippetDescription: """
            A dictionary is a collection of key-value pairs.
            """,
            snippetCode: """
            var responseMessages = [200: "OK", 403: "Access forbidden", 404: "File not found", 500: "Internal server error"]
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Data types",
            content: {
                int()
                float()
                double()
                character()
                string()
                bool()
                array()
                set()
                dictionary()
            }
        )
    }
}

#Preview {
    SwiftDataTypesView()
}
