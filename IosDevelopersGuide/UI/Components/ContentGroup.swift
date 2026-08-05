//
//  ContentGroup.swift
//  IosDevelopersGuide
//
//  An overline sub-label grouping primitive for use INSIDE a `SectionWrapper`.
//  Mirrors the React sibling guide's "group" element: a small uppercase label
//  that breaks a section into named clusters of content.
//

import SwiftUI

/// A sub-group with an overline label. Renders the label uppercased in
/// `labelMedium` at reduced opacity, then the content below it. Intended for
/// use inside `SectionWrapper` to name clusters within a section.
struct ContentGroup<Content: View>: View {
    @EnvironmentObject private var designSystem: DesignSystem

    private let label: String
    private let content: Content

    init(_ label: String, @ViewBuilder content: () -> Content) {
        self.label = label
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Sizes.sm) {
            Text(label)
                .font(designSystem.types.labelMedium)
                .foregroundColor(designSystem.colorScheme.primary.opacity(0.8))
                .textCase(.uppercase)
                .tracking(0.8)
            content
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ContentGroup("Examples") {
        Text("Grouped content.")
    }
    .environmentObject(DesignSystem(colorScheme: ColorScheme(.light)))
    .padding()
}
