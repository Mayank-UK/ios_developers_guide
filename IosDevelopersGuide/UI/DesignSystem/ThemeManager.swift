//
//  ThemeManager.swift
//  IosDevelopersGuide
//
//  Owns the user's appearance preference (system / light / dark), persists it
//  via @AppStorage, and exposes the SwiftUI override applied at the root. The
//  app-bar toggle flips between light and dark; `system` is the default so
//  the app follows the device until the user makes an explicit choice.
//

import SwiftUI
import UIKit

final class ThemeManager: ObservableObject {

    enum Appearance: String, CaseIterable {
        case system
        case light
        case dark
    }

    /// Persisted selection. Storing the rawValue keeps the enum the single
    /// source of truth for the on-disk format.
    @AppStorage("app.appearance") private(set) var stored: String = Appearance.system.rawValue

    /// Current appearance, derived from the persisted string so callers go
    /// through one typed property.
    var appearance: Appearance {
        get { Appearance(rawValue: stored) ?? .system }
        set { stored = newValue.rawValue }
    }

    /// Value passed to `.preferredColorScheme(_:)`. `nil` means "follow the
    /// system" — SwiftUI then resolves the env colorScheme for us.
    var preferredColorScheme: SwiftUI.ColorScheme? {
        switch appearance {
        case .system: return nil
        case .light: return .light
        case .dark: return .dark
        }
    }

    /// Whether the resolved (effective) scheme is dark, given the system env.
    func isDark(resolvedScheme: SwiftUI.ColorScheme) -> Bool {
        switch appearance {
        case .system: return resolvedScheme == .dark
        case .light: return false
        case .dark: return true
        }
    }

    /// Toggle used by the app-bar button: flip between light and dark. When the
    /// user has not chosen yet (`system`), pick the opposite of whatever the
    /// device is currently rendering so the tap visibly changes something.
    func toggle(resolvedScheme: SwiftUI.ColorScheme) {
        let targetDark: Bool
        switch appearance {
        case .system:
            targetDark = resolvedScheme != .dark
        case .light:
            targetDark = true
        case .dark:
            targetDark = false
        }
        stored = (targetDark ? Appearance.dark : Appearance.light).rawValue
        objectWillChange.send()
    }
}
