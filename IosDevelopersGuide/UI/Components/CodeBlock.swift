//
//  CodeBlock.swift
//  IosDevelopersGuide
//
//  A standalone monospased code block with an optional language label. Extracts
//  the code-display pattern the React sibling guide shares, paralleling the
//  code listing currently embedded inside `CustomSection` (which is kept
//  intact because it's coupled to its `DisclosureGroup`). Use this for any
//  free-standing code listing outside CustomSection's demo+snippet framing.
//

import SwiftUI

/// A monospaced code listing on a recessed (`surfaceVariant`) background with
/// an `outline` hairline border and an optional overline language label.
struct CodeBlock: View {
    @EnvironmentObject private var designSystem: DesignSystem

    private let code: String
    private let language: String?

    /// - Parameters:
    ///   - code: The source text to render verbatim.
    ///   - language: Optional short language label (e.g. `"swift"`) shown as an
    ///     overline in the top-right corner.
    init(code: String, language: String? = nil) {
        self.code = code
        self.language = language
    }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView(.horizontal) {
                Text(code)
                    .font(.system(size: 13, design: .monospaced))
                    .foregroundColor(designSystem.colorScheme.onSurface)
                    .lineSpacing(DesignSystem.Sizes.sm)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, DesignSystem.Sizes.sm)
                    .padding(.leading, DesignSystem.Sizes.md)
                    .padding(.trailing, DesignSystem.Sizes.xl)
            }
            if let language = language {
                Text(language)
                    .font(designSystem.types.labelSmall)
                    .foregroundColor(designSystem.colorScheme.onSurface.opacity(0.6))
                    .textCase(.uppercase)
                    .padding(.top, DesignSystem.Sizes.sm)
                    .padding(.trailing, DesignSystem.Sizes.sm)
            }
        }
        .background(designSystem.colorScheme.surfaceVariant)
        .overlay(
            RoundedRectangle(cornerRadius: DesignSystem.Sizes.radiusMd)
                .stroke(designSystem.colorScheme.outline, lineWidth: 1)
        )
        .cornerRadius(DesignSystem.Sizes.radiusMd)
    }
}

#Preview {
    CodeBlock(
        code: "let answer = 42",
        language: "swift"
    )
    .environmentObject(DesignSystem(colorScheme: ColorScheme(.light)))
    .padding()
}
