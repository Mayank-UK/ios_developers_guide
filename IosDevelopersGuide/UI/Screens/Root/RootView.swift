//
//  RouterView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 01/03/24.
//

import SwiftUI
import Combine

struct RootView<InitialView: View>: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    @StateObject private var themeManager = ThemeManager()
    @StateObject private var drawerState = DrawerState()
    @StateObject private var designSystem = DesignSystem(
        colorScheme: ColorScheme(.light)
    )
    @StateObject var screenData: ScreenData = ScreenData()
    @StateObject var router: Router = Router()

    private let initialView: InitialView

    init(@ViewBuilder content: @escaping () -> InitialView) {
        self.initialView = content()
    }

    /// What we pass to `.preferredColorScheme` — drives the effective scheme
    /// for everything under the NavigationStack.
    private var preferredScheme: SwiftUI.ColorScheme? {
        themeManager.preferredColorScheme
    }

    /// The scheme the DesignSystem should build colors from. When the user has
    /// chosen an explicit appearance we use that; otherwise we fall back to the
    /// environment value reported by SwiftUI.
    private var resolvedScheme: SwiftUI.ColorScheme {
        themeManager.preferredColorScheme ?? colorScheme
    }

    var body: some View {
        GeometryReader { geometry in
            NavigationStack(path: $router.navigationStack) {
                initialView
                    .navigationDestination(for: Router.routePaths.self) { route in
                        router.view(for: route)
                    }
            }
            .preferredColorScheme(preferredScheme)
            .preference(key: SizePreferenceKey.self, value: geometry.size)
            .onPreferenceChange(SizePreferenceKey.self) { newSize in
                screenData.height = newSize.height
                screenData.width = newSize.width

                screenData.isCompactHeight = verticalSizeClass == .compact
                screenData.isCompactWidth = horizontalSizeClass == .compact
            }
            .overlay {
                AppDrawer()
            }
        }
        .onAppear { applyResolvedScheme() }
        .onChange(of: colorScheme) { applyResolvedScheme() }
        .onChange(of: themeManager.preferredColorScheme) { applyResolvedScheme() }
        .environmentObject(designSystem)
        .environmentObject(screenData)
        .environmentObject(router)
        .environmentObject(themeManager)
        .environmentObject(drawerState)
    }

    private func applyResolvedScheme() {
        designSystem.updateColorScheme(ColorScheme(resolvedScheme))
    }
}

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = CGSize.init(width: 1, height: 1)

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

//#Preview {
//    RootView {
//        HomeView()
//    }
//}
