//
//  RouterView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 01/03/24.
//

import SwiftUI

struct RootView<InitialView: View>: View {
    @StateObject var screenData: ScreenData = ScreenData()
    @StateObject var router: Router = Router()
    @StateObject var apiService: ApiService = ApiService()
        
    private let initialView: InitialView
    
    init(@ViewBuilder content: @escaping () -> InitialView) {
        self.initialView = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack(path: $router.navigationStack) {
                initialView
                    .navigationDestination(for: Router.routePaths.self) { route in
                    router.view(for: route)
                }
            }
                .onAppear{
                    screenData.height = geometry.size.height
                    screenData.width = geometry.size.width
                }
        }
            .environmentObject(screenData)
            .environmentObject(router)
            .environmentObject(apiService)
    }
}

#Preview {
    RootView {
        HomeView()
    }
}
