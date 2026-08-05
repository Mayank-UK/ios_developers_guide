//
//  DesignSystem2.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 21/08/24.
//

import SwiftUI

// Dark scheme colors
struct DarkColors {
    static let primary = Color(red: 0.0, green: 0.478, blue: 1.0)
    static let primaryVariant = Color(red: 0.0, green: 0.373, blue: 0.698)
    static let secondary = Color(red: 0.4, green: 0.733, blue: 0.416)
    static let background = Color(red: 0.129, green: 0.129, blue: 0.129)
    static let surface = Color(red: 0.2, green: 0.2, blue: 0.2)
    static let error = Color(red: 0.69, green: 0.0, blue: 0.125)
    static let onPrimary = Color.black
    static let onSecondary = Color.white
    static let onBackground = Color.white
    static let onSurface = Color.white
    static let onError = Color.white

    // Hairline borders. Lighter than surface text so it reads as a thin line
    // rather than a solid block on the dark background.
    static let outline = Color(red: 0.3, green: 0.3, blue: 0.336)
    // Recessed areas (code blocks). Lifted just above `surface` (0.2) so the
    // well is visible without breaking the dark chrome.
    static let surfaceVariant = Color(red: 0.242, green: 0.242, blue: 0.242)
    // Section tint. Between `surface` and `surfaceVariant` so a tinted section
    // sits subtly above the page background.
    static let surfaceTint = Color(red: 0.169, green: 0.169, blue: 0.169)
    // Severity colors — slightly brighter/more saturated than their light
    // counterparts so they stay legible against the dark chrome. onSeverity
    // stays white for all three (these tones are saturated enough for contrast).
    static let info = Color(red: 0.188, green: 0.518, blue: 1.0)
    static let warning = Color(red: 0.949, green: 0.722, blue: 0.0)
    static let critical = error
    static let onInfo = Color.white
    static let onWarning = Color.black
    static let onCritical = Color.white
}

// Light scheme colors
struct LightColors {
    static let primary = Color(red: 0.0, green: 0.478, blue: 1.0)
    static let primaryVariant = Color(red: 0.0, green: 0.373, blue: 0.698)
    static let secondary = Color(red: 0.611, green: 0.8, blue: 0.396)
    static let background = Color.white
    static let surface = Color(red: 0.969, green: 0.969, blue: 0.969)
    static let error = Color(red: 0.835, green: 0.0, blue: 0.0)
    static let onPrimary = Color.white
    static let onSecondary = Color.black
    static let onBackground = Color.black
    static let onSurface = Color.black
    static let onError = Color.black

    // Mirrors the React sibling guide values.
    static let outline = Color(red: 0.886, green: 0.910, blue: 0.941)        // #e2e8f0
    static let surfaceVariant = Color(red: 0.945, green: 0.961, blue: 0.976)  // #f1f5f9
    static let surfaceTint = Color(red: 0.973, green: 0.980, blue: 0.988)     // #f8fafc
    static let info = Color(red: 0.0, green: 0.478, blue: 1.0)
    static let warning = Color(red: 0.851, green: 0.6, blue: 0.0)
    static let critical = error
    static let onInfo = Color.white
    // Amber is light enough that white text fails WCAG AA; black on amber is ~9:1.
    static let onWarning = Color.black
    static let onCritical = Color.white
}

//
// Define custom fonts
extension Font {
    static let displayLarge = Font.custom("Montserrat-Regular", size: 57)
    static let displayMedium = Font.custom("Montserrat-Regular", size: 45)
    static let displaySmall = Font.custom("Montserrat-Regular", size: 36)

    static let headlineLarge = Font.custom("Montserrat-Regular", size: 32)
    static let headlineMedium = Font.custom("Montserrat-Regular", size: 28)
    static let headlineSmall = Font.custom("Montserrat-Regular", size: 24)

    static let titleLarge = Font.custom("Montserrat-Bold", size: 22)
    static let titleMedium = Font.custom("Montserrat-Bold", size: 16)
    static let titleSmall = Font.custom("Montserrat-Medium", size: 14)

    static let bodyLarge = Font.custom("Montserrat-Regular", size: 16)
    static let bodyMedium = Font.custom("Montserrat-Regular", size: 14)
    static let bodySmall = Font.custom("System-Regular", size: 12)

    static let labelLarge = Font.custom("Montserrat-Medium", size: 14)
    static let labelMedium = Font.custom("Montserrat-Medium", size: 12)
    static let labelSmall = Font.custom("Montserrat-Medium", size: 11)
}

// Group all typography styles into a single object
struct FontScheme {
    let displayLarge = Font.displayLarge
    let displayMedium = Font.displayMedium
    let displaySmall = Font.displaySmall
    let headlineLarge = Font.headlineLarge
    let headlineMedium = Font.headlineMedium
    let headlineSmall = Font.headlineSmall
    let titleLarge = Font.titleLarge
    let titleMedium = Font.titleMedium
    let titleSmall = Font.titleSmall
    let bodyLarge = Font.bodyLarge
    let bodyMedium = Font.bodyMedium
    let bodySmall = Font.bodySmall
    let labelLarge = Font.labelLarge
    let labelMedium = Font.labelMedium
    let labelSmall = Font.labelSmall
}

class DesignSystem: ObservableObject {
    @Published var colorScheme: ColorScheme
    
    init(colorScheme: ColorScheme) {
        self.colorScheme = colorScheme
    }
    
    func updateColorScheme(_ colorScheme: ColorScheme) {
        self.colorScheme = colorScheme
    }
    
    var types: FontScheme {
        return FontScheme()
    }
    
    struct Sizes {
        static let xxs: CGFloat = 2
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 16
        static let lg: CGFloat = 32
        static let xl: CGFloat = 64
        static let xxl: CGFloat = 128

        // Corner-radius scale, mirroring the React sibling guide.
        static let radiusSm: CGFloat = 8
        static let radiusMd: CGFloat = 12
        static let radiusLg: CGFloat = 16
        static let radiusPill: CGFloat = 999
    }
    
    enum shadows {
        case buttonCard
        case buttonCardHover
        case navigationMenu
        case modal
        case bottomSheet
    }
    
    func shadow(for type: shadows) -> DSShadowComponent {
        switch type {
        case .buttonCard:
            return DSShadowComponent(color: .gray, radius: 2, x: 0, y: 1)
        case .buttonCardHover:
            return DSShadowComponent(color: .gray, radius: 4, x: 0, y: 4)
        case .navigationMenu:
            return DSShadowComponent(color: .gray, radius: 19, x: 0, y: 19)
        case .modal:
            return DSShadowComponent(color: .gray, radius: 8, x: 7, y: 14)
        case .bottomSheet:
            return DSShadowComponent(color: .gray, radius: 8, x: -2, y: 4)
        }
    }
}

struct ColorScheme {
    let primary: Color
    let primaryVariant: Color
    let secondary: Color
    let background: Color
    let surface: Color
    let error: Color
    let onPrimary: Color
    let onSecondary: Color
    let onBackground: Color
    let onSurface: Color
    let onError: Color

    // Extended tokens — borders, recessed surfaces, and severity colors. See
    // `DarkColors` / `LightColors` for the per-mode rationale.
    let outline: Color
    let surfaceVariant: Color
    let surfaceTint: Color
    let info: Color
    let warning: Color
    let critical: Color
    let onInfo: Color
    let onWarning: Color
    let onCritical: Color

    /// Build a `ColorScheme` from an explicit dark/light choice. The previous
    /// init read `UITraitCollection.current.userInterfaceStyle` at construction
    /// time, which captured the system style once and ignored the SwiftUI
    /// environment (and any `.preferredColorScheme` override). Callers should
    /// now pass the resolved effective scheme.
    init(isDark: Bool) {
        if isDark {
            self.primary = DarkColors.primary
            self.primaryVariant = DarkColors.primaryVariant
            self.secondary = DarkColors.secondary
            self.background = DarkColors.background
            self.surface = DarkColors.surface
            self.error = DarkColors.error
            self.onPrimary = DarkColors.onPrimary
            self.onSecondary = DarkColors.onSecondary
            self.onBackground = DarkColors.onBackground
            self.onSurface = DarkColors.onSurface
            self.onError = DarkColors.onError
            self.outline = DarkColors.outline
            self.surfaceVariant = DarkColors.surfaceVariant
            self.surfaceTint = DarkColors.surfaceTint
            self.info = DarkColors.info
            self.warning = DarkColors.warning
            self.critical = DarkColors.critical
            self.onInfo = DarkColors.onInfo
            self.onWarning = DarkColors.onWarning
            self.onCritical = DarkColors.onCritical
        } else {
            self.primary = LightColors.primary
            self.primaryVariant = LightColors.primaryVariant
            self.secondary = LightColors.secondary
            self.background = LightColors.background
            self.surface = LightColors.surface
            self.error = LightColors.error
            self.onPrimary = LightColors.onPrimary
            self.onSecondary = LightColors.onSecondary
            self.onBackground = LightColors.onBackground
            self.onSurface = LightColors.onSurface
            self.onError = LightColors.onError
            self.outline = LightColors.outline
            self.surfaceVariant = LightColors.surfaceVariant
            self.surfaceTint = LightColors.surfaceTint
            self.info = LightColors.info
            self.warning = LightColors.warning
            self.critical = LightColors.critical
            self.onInfo = LightColors.onInfo
            self.onWarning = LightColors.onWarning
            self.onCritical = LightColors.onCritical
        }
    }

    /// Convenience factory for callers that have a SwiftUI `ColorScheme`.
    init(_ scheme: SwiftUI.ColorScheme) {
        self.init(isDark: scheme == .dark)
    }

    static let dark = ColorScheme(isDark: true)
    static let light = ColorScheme(isDark: false)

    /// Severity fill color for a given `FailureSeverity`, so banners/snackbars
    /// can theme via the design system instead of hardcoded `.blue/.orange/.red`.
    func severity(_ severity: FailureSeverity) -> Color {
        switch severity {
        case .info: return info
        case .warning: return warning
        case .critical: return critical
        }
    }

    /// Contrast text color to sit on top of `severity(_:)`.
    func onSeverity(_ severity: FailureSeverity) -> Color {
        switch severity {
        case .info: return onInfo
        case .warning: return onWarning
        case .critical: return onCritical
        }
    }
}

struct DSShadowComponent: ViewModifier {
    var color: Color
    var radius: CGFloat
    var x: CGFloat
    var y: CGFloat

    func body(content: Content) -> some View {
        content
            .shadow(color: color, radius: radius, x: x, y: y)
    }
}


extension View {
    /// Applies the design-system shadow for `type`. The previous implementation
    /// ignored `type` and always applied `radius: 4, y: 4`. Because this View
    /// extension has no `DesignSystem` instance in scope, the per-type switch is
    /// inlined here — the values are static and identical to
    /// `DesignSystem.shadow(for:)`, so the two must be kept in lockstep.
    @ViewBuilder
    func designSystemShadow(for type: DesignSystem.shadows) -> some View {
        switch type {
        case .buttonCard:
            self.modifier(DSShadowComponent(color: .gray, radius: 2, x: 0, y: 1))
        case .buttonCardHover:
            self.modifier(DSShadowComponent(color: .gray, radius: 4, x: 0, y: 4))
        case .navigationMenu:
            self.modifier(DSShadowComponent(color: .gray, radius: 19, x: 0, y: 19))
        case .modal:
            self.modifier(DSShadowComponent(color: .gray, radius: 8, x: 7, y: 14))
        case .bottomSheet:
            self.modifier(DSShadowComponent(color: .gray, radius: 8, x: -2, y: 4))
        }
    }
}
