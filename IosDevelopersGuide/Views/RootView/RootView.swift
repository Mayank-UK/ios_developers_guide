//
//  RouterView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 01/03/24.
//

import SwiftUI

struct RootView<InitialView: View>: View {
    @StateObject var router: Router = Router()
        
    private let initialView: InitialView
    
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
        .environmentObject(router)
    }
}


#Preview {
    RootView {
        HomeView()
    }
}
