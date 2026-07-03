//
//  SwiftFundamentals.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct SwiftFundamentalsView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftFundamentalsViewModel
    
    func installation() -> some View {
        return CustomSection(
            snippetTitle: "Installation",
            snippetDescription: """
            Swift is installed automatically with xcode.
            """
        )
    }
    
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
    
    func variablesAndConstants() -> some View {
        return CustomSection(
            snippetTitle: "Variables & constants",
            snippetDescription: """
            A variable is a container that holds data.
            
            A constant is a special type of variable whose value cannot be changed.
            """,
            snippetCode: """
            var s: String = "hello"
            
            // constant
            let s: String = "hello"
            """
        )
    }

    func dataTypes() -> some View {
        return CustomSection(
            snippetTitle: "Data types",
            snippetDescription: """
            Int:
            Represents whole numbers without fractional components.
            
            Int Variants include:
            -Int8: 8-bit signed integer (-128 to 127)
            -Int16: 16-bit signed integer (-32,768 to 32,767)
            -Int32: 32-bit signed integer (-2,147,483,648 to 2,147,483,647)
            -Int64: 64-bit signed integer
            
            Float:
            32-bit floating-point number.
            
            Double:
            64-bit floating-point number (more precise).
            
            Character:
            Represents a single Unicode character.
            
            String:
            Represents textual data (e.g., words, sentences).
            
            Bool:
            Represents logical values: true or false.
            
            Array:
            An array is an ordered, random-access collection of elements of a single type.
            
            Set:
            A set is an unordered collection of unique elements.
            
            Dictionary:
            A dictionary is a collection of key-value pairs.
            """,
            snippetCode: """
            let age: Int = 30
            
            let pi: Float = 3.14159

            let pi: Double = 3.14159

            let initial: Character = "A"

            let greeting: String = "Hello, World!"

            let isSunny: Bool = true

            let fruits = ["apple", "banana", "orange"]

            let ingredients: Set = ["cocoa beans", "sugar", "cocoa butter", "salt"]

            var responseMessages = [200: "OK", 403: "Access forbidden", 404: "File not found", 500: "Internal server error"]
            """
        )
    }
    
    func inputAndOutput() -> some View {
        return CustomSection(
            snippetTitle: "Input & output",
            snippetDescription: """
            Take the input from the user through console and output to console.
            """,
            snippetCode: """
            print("Enter your name:")
            if let name = readLine() {
                print("Hello, \\(name)! Welcome to Swift.")
            } else {
                print("No input provided.")
            }
            """
        )
    }
    
    func expressionsAndStatements() -> some View {
        return CustomSection(
            snippetTitle: "Expressions & statements",
            snippetDescription: """
            Expression:
            An expression in Swift is a combination of variables, operators, literals, and functions.
            
            Staemtents:
            Statements are instructions that perform specific tasks.
            
            Code blocks:
            A code block is a group of statements enclosed in curly braces { }.
            """,
            snippetCode: """
            // expression
            var marks = 80
            
            // statement
            var score = 9 * 5
            
            // code block
            if true {
                let sum = 2 + 3
                print("Result is \\(sum)")
            }
            """
        )
    }
    
    func comments() -> some View {
        return CustomSection(
            snippetTitle: "Comments",
            snippetDescription: """
            A comment is something whose syntax is not taken into consideration.
            """,
            snippetCode: """
            //  This is single line comment.
            
            /*
                This is a
                multi-line comment.
            */
            """
        )
    }
    
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
    
    func operators() -> some View {
        return CustomSection(
            snippetTitle: "Operators",
            snippetDescription: """
            Arithmetic operators:
            
            Swift supports the standard arithmetic operators for all number types:
            -Addition (+): Adds two values.
            -Subtraction (-): Subtracts the second value from the first.
            -Multiplication (*): Multiplies two values.
            -Division (/): Divides the first value by the second.
            -Remainder (%): Calculates the remainder after division.
            
            
            Assignment operators:
            Initializes or updates the value of a variable with the value on the right side.


            Comparison operators (used for compoarison):
            -Equal to (==): Checks if two values are equal.
            -Not equal to (!=): Checks if two values are not equal.
            -Greater than (>), Less than (<), Greater than or equal to (>=), Less than or equal to (<=).


            Logical operators (for logical operations):
            -Logical NOT (!): Inverts a Boolean value.
            -Logical AND (&&): Combines two Boolean values.
            -Logical OR (||): Returns true if either value is true.

            
            Bitwise operators:
            Used for bit-level operations (e.g., working with individual bits in binary representation).
            Includes AND (&), OR (|), XOR (^), and more.

            
            Range operators (for range operations):
            -Closed Range (a...b): Represents a range from a to b (inclusive).
            -Half-Open Range (a..<b): Represents a range from a up to, but not including, b.
            """,
            snippetCode: """
            // arithmetic operators
            let sum = 5 + 3
            let product = 4 * 6
            
            // assignment operators
            var age = 30
            age = 35
            
            // comparison operators
            let x = 10
            let y = 20
            let result = x < y
            
            // logical operators
            let isSunny = true
            let isWarm = false
            let result = isSunny && isWarm
            
            // range operators
            let numbers = 1...10
            """
        )
    }
    
    func conditionalStatements() -> some View {
        return CustomSection(
            snippetTitle: "Conditional statements",
            snippetDescription: """
            If Statement:
            - Executes a block of code if a condition is true.
            
            Guard Statement:
            - Used to exit early from a function or loop if a condition is not met.
            
            Switch Statement:
            - Run code based on switch cases.
            """,
            snippetCode: """
            //  if condition
            let temperature = 25
            if temperature > 20 {
                print("It's a warm day!")
            } else {
                print("It's cool outside.")
            }

            //  guard statement
            func processOrder(order: String?) {
                guard let order = order else {
                    print("Invalid order.")
                    return
                }
                print("Processing order: \\(order)")
            }
            
            // switch statement
            let day = "Monday"
            switch day {
                case "Monday", "Tuesday":
                    print("Start of the workweek")
                case "Saturday", "Sunday":
                    print("Weekend!")
                default:
                    print("Other days")
            }
            """
        )
    }
    
    func loops() -> some View {
        return CustomSection(
            snippetTitle: "Loops",
            snippetDescription: """
            For-In Loop:
            - Used to iterate over a sequence, such as items in an array, ranges of numbers, or characters in a string.
            
            While loop
            - Repeats a block of code while a condition is true.
            """,
            snippetCode: """
            //  for-in loop
            let names = ["Anna", "Alex", "Brian", "Jack"]
            for name in names {
                print("Hello, \\(name)!")
            }

            //  while loop
            var count = 0
            while count < 5 {
                print("Count is \\(count)")
                count += 1
            }
            """
        )
    }
    
    func controlTransferStatements() -> some View {
        return CustomSection(
            snippetTitle: "Control transfer statements",
            snippetDescription: """
            Used to change the flow of execution:
            - Break: Exits a loop or switch statement.
            - Continue: Skips the current iteration and proceeds to the next one.
            - Return: Exits a function.
            - Fallthrough: Transfers control to the next case in a switch statement.
            """,
            snippetCode: """
            func average(_ numbers: Double...) -> Double {
                let total = numbers.reduce(0, +)
                return total / Double(numbers.count)
            }
            """
        )
    }
    
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
    
    func oop() -> some View {
        return CustomSection(
            snippetTitle: "OOP",
            snippetDescription: """
            Classes and objects:
            In Swift, a class serves as a blueprint for creating objects.
            An object is an instance of a class, encapsulating both data (properties) and behavior (methods).
            Think of a class as a template and an object as a specific instance created from that template.
            
            Properties represent the data associated with a class.
            Methods are functions associated with a class.
            
            
            Inheritance:
            Inheritance allows a class to inherit properties and methods from another class (superclass).
            
            Subclasses can override methods from their superclass. Use the override keyword.
            Access Control:
            - Swift provides access control to restrict the visibility of properties and methods.
            - Use public, internal, private, or fileprivate.


            Polymorphism:
            Polymorphism allows objects of different classes to be treated uniformly.
            Achieved through inheritance and method overriding.
            """,
            snippetCode: """
            // classes & objects
            class Person {
                var name: String
                init(name: String) {
                    self.name = name
                }
            }
            
            let person1 = Person(name: "Alice")
            let person2 = Person(name: "Bob")
            
            // inheritance
            class Person {
                var name: String
                init(name: String) {
                    self.name = name
                }
            }
            
            class Student: Person {
                private var studentID: Int
                init(name: String, studentID: Int) {
                    self.studentID = studentID
                    super.init(name: name)
                }
            }
            
            // polymorphism
            let animal: Animal = Dog()
            animal.makeSound() // Calls Dog's overridden method
            """
        )
    }
    
    func enumsAndStructs() -> some View {
        return CustomSection(
            snippetTitle: "Enums & structs",
            snippetDescription: """
            Enums:
            Enums are a powerful way to represent a fixed set of related values. They allow you to define a type that can take on one of several predefined cases.
            
            Enum use cases:
            - State Modeling: Use enums to represent different states or options. For example, days of the week, HTTP status codes, or different modes (e.g., light mode vs. dark mode).
            - Limited Possibilities: When you want to restrict a variable to a specific set of values, enums are ideal.
            - Pattern Matching: Enums work seamlessly with switch statements for pattern matching.
            
            
            Structs:
            Structs allow you to create custom data types with properties and methods. They are value types, meaning they are copied when assigned or passed around.
            
            Struct use cases:
            - Data Modeling: Use structs to model real-world entities or data structures. For instance, representing a point in 2D space, a user profile, or a configuration.
            - Immutable Properties: Struct properties are immutable by default, which can be useful for ensuring data consistency.
            - Performance: Structs are lightweight and efficient, making them suitable for small data structures.
            """,
            snippetCode: """
            enum CompassDirection {
                case north
                case south
                case east
                case west
            }
            let currentDirection = CompassDirection.north
            
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
            pageTitle: "Swift fundamentals",
            content: {
                installation()
                introduction()
                variablesAndConstants()
                dataTypes()
                inputAndOutput()
                expressionsAndStatements()
                comments()
                optional()
                operators()
                conditionalStatements()
                loops()
                controlTransferStatements()
                functions()
                oop()
                enumsAndStructs()
            }
        )
    }
}

//#Preview {
//    SwiftFundamentalsView()
//}
