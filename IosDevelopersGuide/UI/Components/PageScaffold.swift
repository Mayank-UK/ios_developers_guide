//
//  PageScaffold.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 05/03/24.
//

import SwiftUI

/// Shared page chrome. Every screen uses `PageScaffold` for its title, so the
/// right-side app-bar controls (theme toggle + drawer button) are baked in here
/// as a single source of truth rather than duplicated per screen.
struct PageScaffold<Content: View>: View {
    @EnvironmentObject private var designSystem: DesignSystem
    @EnvironmentObject private var themeManager: ThemeManager
    @EnvironmentObject private var drawerState: DrawerState
    @Environment(\.colorScheme) private var envColorScheme

    let pageTitle: String
    private let children: Content

    init(pageTitle: String, @ViewBuilder content: @escaping () -> Content) {
        self.children = content()
        self.pageTitle = pageTitle
    }

    var body: some View {
        ScrollView(.vertical) {
            Spacer().frame(height: 32)
            children
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Text(pageTitle)
                    .font(designSystem.types.headlineSmall)
                    .foregroundColor(designSystem.colorScheme.onBackground)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            ToolbarItemGroup(placement: .topBarTrailing) {
                ThemeToggleButton()
                drawerButton
            }
        }
    }

    private var drawerButton: some View {
        Button {
            drawerState.open()
        } label: {
            Image(systemName: "line.3.horizontal")
                .foregroundColor(designSystem.colorScheme.onBackground)
        }
        .accessibilityLabel("Open menu")
    }
}

/// Sun/moon flip between light and dark appearance. Reads the resolved env
/// scheme so the icon always reflects the page the user is looking at.
private struct ThemeToggleButton: View {
    @EnvironmentObject private var themeManager: ThemeManager
    @EnvironmentObject private var designSystem: DesignSystem
    @Environment(\.colorScheme) private var envColorScheme

    private var isDark: Bool {
        themeManager.isDark(resolvedScheme: envColorScheme)
    }

    var body: some View {
        Button {
            themeManager.toggle(resolvedScheme: envColorScheme)
        } label: {
            Image(systemName: isDark ? "sun.max" : "moon")
                .foregroundColor(designSystem.colorScheme.onBackground)
        }
        .accessibilityLabel(isDark ? "Switch to light theme" : "Switch to dark theme")
    }
}

#Preview {
    PageScaffold(
        pageTitle: "Test",
        content: {
            Text("Hello world!")
        }
    )
    .environmentObject(DesignSystem(colorScheme: ColorScheme(.light)))
    .environmentObject(ThemeManager())
    .environmentObject(DrawerState())
}
