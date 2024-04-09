//
//  SwiftControlFlow.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftControlFlowView: View {
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
    
    func conditionalStatements() -> some View {
        return CustomSection(
            snippetTitle: "Conditional statements",
            snippetDescription: """
            If Statement:
            - Executes a block of code if a condition is true.
            
            Guard Statement:
            - Used to exit early from a function or loop if a condition is not met.

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
            """
        )
    }
    
    func switchStatements() -> some View {
        return CustomSection(
            snippetTitle: "Switch statements",
            snippetDescription: """
            Run code based on switch cases.
            """,
            snippetCode: """
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
            
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Control flow",
            content: {
                loops()
                conditionalStatements()
                switchStatements()
                controlTransferStatements()
            }
        )

    }
}

#Preview {
    SwiftControlFlowView()
}
