//
//  AppDrawer.swift
//  IosDevelopersGuide
//
//  Right-side slide-in panel rendered as an overlay at the RootView level.
//  Mirrors the React guide's mobile drawer: a dimmed backdrop that dismisses
//  on tap, and a panel that slides in from the trailing edge. Currently holds a
//  single chrome-level entry (About); new chrome-level links would live here.
//

import SwiftUI

struct AppDrawer: View {
    @EnvironmentObject private var drawerState: DrawerState
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var designSystem: DesignSystem

    private let panelWidth: CGFloat = 280

    var body: some View {
        ZStack(alignment: .trailing) {
            if drawerState.isOpen {
                backdrop
                panel
            }
        }
        .animation(.easeInOut(duration: 0.22), value: drawerState.isOpen)
    }

    private var backdrop: some View {
        // intentional: scrims are conventionally plain black so the dim reads
        // as a pure overlay regardless of the resolved color scheme.
        Color.black.opacity(0.4)
            .ignoresSafeArea()
            .onTapGesture { drawerState.close() }
            .transition(.opacity)
    }

    private var panel: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Sizes.sm) {
            header
            Divider()
            aboutEntry
            Spacer()
        }
        .padding(.vertical, DesignSystem.Sizes.md)
        .frame(width: panelWidth, alignment: .leading)
        .background(designSystem.colorScheme.surface)
        .transition(.move(edge: .trailing))
    }

    private var header: some View {
        HStack {
            Text("Menu")
                .font(designSystem.types.labelMedium)
                .tracking(0.8)
                .textCase(.uppercase)
                .foregroundColor(designSystem.colorScheme.onSurface.opacity(0.7))
            Spacer()
            Button {
                drawerState.close()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(designSystem.colorScheme.onSurface)
                    .padding(DesignSystem.Sizes.xs)
            }
        }
        .padding(.horizontal, DesignSystem.Sizes.md)
    }

    private var aboutEntry: some View {
        Button {
            drawerState.close()
            router.navigateTo(routePath: .about)
        } label: {
            HStack {
                Text("About")
                    .font(designSystem.types.titleMedium)
                    .foregroundColor(designSystem.colorScheme.onSurface)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(designSystem.types.titleSmall)
                    .foregroundColor(designSystem.colorScheme.onSurface.opacity(0.6))
            }
            .padding(.horizontal, DesignSystem.Sizes.md)
            .padding(.vertical, DesignSystem.Sizes.sm)
        }
    }
}
