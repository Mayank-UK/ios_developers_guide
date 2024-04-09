//
//  SwiftUiDebugging.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiDebuggingView: View {
    func previewCanvas() -> some View {
        return CustomSection(
            snippetTitle: "Preview canvas",
            snippetDescription: """
            The preview canvas in Xcode lets you see a live preview of your SwiftUI views as you write code.
            Use the preview canvas to check layout, colors, fonts, and animations.
            Interact with your views and observe their response to user input.
            Access the preview canvas by clicking the Resume button in the top-right corner of the editor or by pressing Option-Command-P.
            """
        )
    }
    
    func hierarchyDebugger() -> some View {
        return CustomSection(
            snippetTitle: "Hierarchy Debugger",
            snippetDescription: """
            The view hierarchy debugger allows you to inspect the structure and properties of your SwiftUI views at runtime.
            Use it to see how views are composed, laid out, and updated.
            Modify view values and observe changes in real time.
            Access the view hierarchy debugger by choosing Debug > View Debugging > Capture View Hierarchy from Xcode’s menu bar or by pressing Command-Shift-C.
            """
        )
    }
    
    func memoryGraphDebugger() -> some View {
        return CustomSection(
            snippetTitle: "Memory Graph Debugger",
            snippetDescription: """
            The memory graph debugger analyzes memory usage and references of your SwiftUI views and other objects.
            Use it to find and fix memory leaks, retain cycles, and other memory issues.
            Access the memory graph debugger by clicking the Debug Memory Graph button in the debug area or by pressing Command-Shift-Y.
            """
        )
    }
    
    func printDebugging() -> some View {
        return CustomSection(
            snippetTitle: "Print Debugging",
            snippetDescription: """
            Use print() statements to log information during app execution.
            Print variable values, function calls, or custom messages.
            Inspect the console output in Xcode.
            """
        )
    }
    
    func breakPoints() -> some View {
        return CustomSection(
            snippetTitle: "Breakpoints",
            snippetDescription: """
            Set breakpoints in your code to pause execution at specific lines.
            Inspect variables, view states, and call stacks.
            Use breakpoints to catch specific issues during debugging.
            """
        )
    }
    
    func loggingAndAssertions() -> some View {
        return CustomSection(
            snippetTitle: "Logging and Assertions",
            snippetDescription: """
            Use assert() statements to validate assumptions in your code.
            Add custom logging using os_log or other logging frameworks.
            Enable logging levels (e.g., debug, info, error) based on your needs.
            """
        )
    }
    
    func deviceTesting() -> some View {
        return CustomSection(
            snippetTitle: "Device Testing",
            snippetDescription: """
            Run your app on a physical device in addition to the simulator.
            Physical devices may reveal issues not seen in the simulator.
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Debugging",
            content: {
                previewCanvas()
                hierarchyDebugger()
                memoryGraphDebugger()
                printDebugging()
                breakPoints()
                loggingAndAssertions()
                deviceTesting()
            }
        )
    }
}

#Preview {
    SwiftUiDebuggingView()
}
