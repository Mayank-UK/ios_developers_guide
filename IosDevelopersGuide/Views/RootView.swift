//
//  RouterView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 01/03/24.
//

import SwiftUI

struct RootView<InitialView: View>: View {
    //  stateObject is a property wrapper that allows you to create and store an ObservableObject in a view
    @StateObject var router: Router = Router()
        
    // our root view content
    private let initialView: InitialView
    
    //  this code snippet is a custom initializer for a SwiftUI view that takes a closure as a parameter and assigns it to a property called initialView. The closure is marked with the @ViewBuilder attribute, which means that it can return multiple child views that will be combined into a single view. The closure is also marked with the @escaping attribute, which means that it can be stored and executed later, rather than immediately
    init(@ViewBuilder content: @escaping () -> InitialView) {
        self.initialView = content()
    }
    
    var body: some View {
        NavigationStack(path: $router.navigationStack) {
            initialView
                .navigationDestination(for: Router.routePaths.self) { route in
                router.view(for: route)
            }
        }
        //  putting router instance in environment so it can be accessed by sub views, this is how singletons are created in swiftUI
        .environmentObject(router)
    }
}


#Preview {
    RootView {
        HomeView()
    }
}
