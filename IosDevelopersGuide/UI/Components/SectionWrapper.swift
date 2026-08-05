//
//  SectionWrapper.swift
//  IosDevelopersGuide
//
//  A titled, bordered, surface-tinted container — the top of the iOS
//  section→group→text/code/example hierarchy that mirrors the React sibling
//  guide. Reads all colors, fonts, and corner radii from `DesignSystem` so it
//  re-themes with the app and never hardcodes palette values.
//

import SwiftUI

/// A titled section block: a short primary-coloured accent bar beside the
/// title, the title in `titleLarge`/`onSurface`, then arbitrary content below,
/// all on a `surfaceTint` background framed by an `outline` hairline border.
///
/// Use this as the outermost container for a topic; nest `ContentGroup`,
/// `TextBlock`, and `CodeBlock` inside it.
struct SectionWrapper<Content: View>: View {
    @EnvironmentObject private var designSystem: DesignSystem

    private let title: String
    private let content: Content

    init(_ title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Sizes.md) {
            HStack(spacing: DesignSystem.Sizes.sm) {
                // Primary-coloured accent bar — tall enough to read as a title
                // rule rather than a bullet.
                RoundedRectangle(cornerRadius: DesignSystem.Sizes.radiusSm)
                    .fill(designSystem.colorScheme.primary)
                    .frame(width: 4, height: DesignSystem.Sizes.lg)
                Text(title)
                    .font(designSystem.types.titleLarge)
                    .foregroundColor(designSystem.colorScheme.onSurface)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            content
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(DesignSystem.Sizes.md)
        .background(designSystem.colorScheme.surfaceTint)
        .overlay(
            RoundedRectangle(cornerRadius: DesignSystem.Sizes.radiusLg)
                .stroke(designSystem.colorScheme.outline, lineWidth: 1)
        )
        .cornerRadius(DesignSystem.Sizes.radiusLg)
    }
}

#Preview {
    SectionWrapper("What this app is") {
        Text("Body content goes here.")
    }
    .environmentObject(DesignSystem(colorScheme: ColorScheme(.light)))
    .padding()
}
