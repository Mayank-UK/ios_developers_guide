//
//  DrawerState.swift
//  IosDevelopersGuide
//
//  Shared open/close state for the right-side app drawer. Held once at the
//  RootView level and injected via .environmentObject so the app-bar trigger
//  (in PageScaffold) and the drawer itself (rendered in RootView) share one
//  source of truth.
//

import SwiftUI

final class DrawerState: ObservableObject {
    @Published var isOpen: Bool = false

    func open() { isOpen = true }
    func close() { isOpen = false }
    func toggle() { isOpen.toggle() }
}
