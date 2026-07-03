//
//  SwiftUiStateManagement.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

class ObservableExample: ObservableObject {
    @Published var count: Int = 0
}

struct SwiftUiStateManagementView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiStateManagementViewModel
    
    @State private var tapCount: Int = 0
    @State private var showingAddUser = false
    
    struct AddView: View {
        @Binding var isPresented: Bool

        var body: some View {
            VStack(alignment: .leading) {
                if(isPresented) {
                    Text("Add User View")
                    Button("Dismiss") {
                        isPresented = false
                    }
                }
            }
            .padding()
        }
    }
    
    @StateObject var observableExample = ObservableExample()
    
    struct View1: View {
        @EnvironmentObject var observableExample: ObservableExample

        var body: some View {
            Text("Count in environment object:       \(observableExample.count)")
                .padding()
                .foregroundColor(.white)
                .background(Color.black.opacity(0.8))
                .cornerRadius(8)
        }
    }
    
    func basics() -> some View {
        return CustomSection(
            snippetTitle: "State management basics",
            snippetDescription: """
            SwiftUI provides several property wrappers for state management:
            - @State: For view-level state.
            - @Binding: For two-way communication between parent and child views.
            - @StateObject: For observing changes in external objects (e.g., ObservableObject).
            - @EnvironmentObject: For sharing data across views using the environment.
            """
        )
    }
    
    func state() -> some View {
        return CustomSection(
            snippetTitle: "@State",
            snippetDescription: """
            Property wrapper for view-level state.
            """,
            snippetCode: """
            @State private var tapCount: Int = 0
            
            Text("Tap me!       \(tapCount)")
                .padding()
                .foregroundColor(.white)
                .background(Color.black.opacity(0.8))
                .cornerRadius(8)
                .onTapGesture {
                    tapCount += 1
                }
            """,
            demoView: {
                Text("Tap me!       \(tapCount)")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(8)
                    .onTapGesture {
                        tapCount += 1
                    }
            }
        )
    }

    func binding() -> some View {
        return CustomSection(
            snippetTitle: "@Binding",
            snippetDescription: """
            Property wrapper for two-way communication between parent and child views.
            """,
            snippetCode: """
            struct AddView: View {
                @Binding var isPresented: Bool

                var body: some View {
                    VStack(alignment: .leading) {
                        if(isPresented) {
                            Text("Add User View")
                            Button("Dismiss") {
                                isPresented = false
                            }
                        }
                    }
                    .padding()
                }
            }
            
            struct ContentView: View {
                @State private var showingAddUser = false

                var body: some View {
                    VStack {
                        Button("Show Add User View") {
                            showingAddUser.toggle()
                        }
                        .padding()

                        // Pass the binding to the AddView
                        AddView(isPresented: $showingAddUser)
                    }
                }
            }
            """,
            demoView: {
                VStack {
                    Button("Show view") {
                        showingAddUser = true
                    }
                    .padding()

                    AddView(isPresented: $showingAddUser)
                }
            }
        )
    }

    func observedObject() -> some View {
        return CustomSection(
            snippetTitle: "@StateObject",
            snippetDescription: """
            Property wrapper for observing changes in external objects (e.g., ObservableObject).
            """,
            snippetCode: """
            class ObservableExample: ObservableObject {
                @Published var count: Int = 0
            }
            
            @StateObject var observableExample = ObservableExample()
            
            Text("Tap me!       \\(observableExample.count)")
                .padding()
                .foregroundColor(.white)
                .background(Color.black.opacity(0.8))
                .cornerRadius(8)
                .onTapGesture {
                    observableExample.count += 1
                 }
            """,
            demoView: {
                Text("Tap me!       \(observableExample.count)")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(8)
                    .onTapGesture {
                        observableExample.count += 1
                    }
            }
        )
    }

    func environmentObject() -> some View {
        return CustomSection(
            snippetTitle: "@EnvironmentObject",
            snippetDescription: """
            Property wrapper for sharing data across views using the environment.
            """,
            snippetCode: """
            class ObservableExample: ObservableObject {
                @Published var count: Int = 0
            }
            
            struct View1: View {
                @EnvironmentObject var observableExample: ObservableExample

                var body: some View {
                    Text("Count in environment object:       \\(observableExample.count)")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(8)
                }
            }
            
            @StateObject var observableExample = ObservableExample()
            
            VStack {
                View1()
            }
                .environmentObject(observableExample)
            """,
            demoView: {
                VStack {
                    View1()
                }
                    .environmentObject(observableExample)
            }
        )
    }

    
    var body: some View {
        PageScaffold(
            pageTitle: "State management",
            content: {
                basics()
                state()
                binding()
                observedObject()
                environmentObject()
            }
        )
    }
}


//#Preview {
//    SwiftUiStateManagementView()
//}
