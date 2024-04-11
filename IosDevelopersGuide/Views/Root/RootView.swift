//
//  RouterView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 01/03/24.
//

import SwiftUI
import Combine

struct RootView<InitialView: View>: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
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
                .preference(key: SizePreferenceKey.self, value: geometry.size)
                .onPreferenceChange(SizePreferenceKey.self) { newSize in
                    screenData.height = newSize.height
                    screenData.width = newSize.width
                    
                    screenData.isCompactHeight = verticalSizeClass == .compact
                    screenData.isCompactWidth = horizontalSizeClass == .compact
                }
        }
            
            .environmentObject(screenData)
            .environmentObject(router)
            .environmentObject(apiService)
    }
}

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = CGSize.init(width: 1, height: 1)

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

#Preview {
    RootView {
        HomeView()
    }
}
