//
//  TextBlock.swift
//  IosDevelopersGuide
//
//  A narrative paragraph primitive — promoted out of `AboutView`'s private
//  `Paragraph` so any screen can drop in body copy that reads as one system.
//  Tokens come from `DesignSystem` (never hardcoded fonts/colors).
//

import SwiftUI

/// Full-width narrative body text. Uses `bodyLarge` at slightly reduced opacity
/// (~0.85) with generous line spacing (~1.5x the body line height) so long-form
/// copy stays readable in both light and dark themes.
struct TextBlock: View {
    @EnvironmentObject private var designSystem: DesignSystem

    private let text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .font(designSystem.types.bodyLarge)
            .foregroundColor(designSystem.colorScheme.onSurface.opacity(0.85))
            .lineSpacing(8)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    TextBlock("This is a paragraph of narrative body copy rendered through the shared design system.")
        .environmentObject(DesignSystem(colorScheme: ColorScheme(.light)))
        .padding()
}
