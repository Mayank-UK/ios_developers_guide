//
//  SwiftLifeCycle.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiLifeCycleView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiLifeCycleViewModel
    
    @State private var showingAlert = false
    
    func lifeCycleBasics() -> some View {
        return CustomSection(
            snippetTitle: "Lifecycle basics",
            snippetDescription: """
            -Lifecycle is the series of events that happen from the creation of a SwiftUI view to its destruction.
            -Each view in SwiftUI has a lifecycle that we can observe and manipulate during its three main phases. The three phases are Appearing, Updating, and Disappearing.
            
            -Stages in lifecycle:
            1) When a view is created, SwiftUI initializes its properties and sets up its internal state, the init() method is called during this phase.
            2) Lifecycle events triggered when a view appears on the screen or disappears from view.
            3) SwiftUI calculates the layout of views based on their size, position, and alignment, the body property of a view is evaluated during this phase. Views are rendered and displayed on the screen.
            4) When a view’s state changes (due to user interactions, data updates, etc.), SwiftUI re-evaluates the body property. Views are updated and redrawn as needed.
            5) When a view is removed from the view hierarchy (e.g., due to navigation or dismissal), it goes through the deinitialization phase. The deinit method is called, allowing you to release any resources.
            """
        )
    }
    
    func onAppear() -> some View {
        return CustomSection(
            snippetTitle: "OnAppear",
            snippetDescription: """
            To perform actions when a view becomes visible (e.g., start animations, fetch data).
            """,
            snippetCode: """
            Text("Example of onAppear")
                .onAppear {
                    print("Do something")
                }
            """,
            demoView: {
                Text("Example of onAppear")
                    .onAppear {
                        print("Do something when appear.")
                    }
            }
        )
    }
    
    func onDisappear() -> some View {
        return CustomSection(
            snippetTitle: "OnDisappear",
            snippetDescription: """
            To clean up resources when a view is no longer visible (e.g., stop timers, release memory).
            """,
            snippetCode: """
            Text("Example of onDisappear")
                .onDisappear {
                    print("Do something when disappear.")
                }
            """,
            demoView: {
                Text("Example of onDisappear")
                    .onDisappear {
                        print("Do something when disappear.")
                    }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Lifecycle",
            content: {
                lifeCycleBasics()
                onAppear()
                onDisappear()
            }
        )
    }
}

//#Preview {
//    SwiftUiLifeCycleView()
//}
