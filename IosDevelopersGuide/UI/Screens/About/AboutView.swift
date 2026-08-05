//
//  AboutView.swift
//  IosDevelopersGuide
//
//  What this app is, what it covers, and how it's built. Mirrors the React
//  sibling's about_view.tsx in structure (sections + a stack code block) but
//  the copy is rewritten for iOS + SwiftUI + this app's actual topics and stack.
//

import SwiftUI
import FactoryKit

struct AboutView: View {
    @StateObject var viewModel: AboutViewModel
    @EnvironmentObject private var designSystem: DesignSystem

    var body: some View {
        PageScaffold(pageTitle: "About") {
            VStack(spacing: DesignSystem.Sizes.lg) {
                WhatItIsSection()
                WhatItCoversSection(viewModel: viewModel)
                StackSection(viewModel: viewModel)
                HowItsBuiltSection()
                ConventionsSection()
            }
            .padding(.horizontal, DesignSystem.Sizes.md)
            .padding(.bottom, DesignSystem.Sizes.xl)
        }
    }

    // MARK: - 1. What it is

    private struct WhatItIsSection: View {
        @EnvironmentObject private var designSystem: DesignSystem

        var body: some View {
            VStack(alignment: .leading, spacing: DesignSystem.Sizes.md) {
                SectionTitle("What this app is")
                TextBlock(
                    """
                    This is a reference iOS app built to be read as much as used. Every screen teaches one topic — SwiftUI fundamentals, layouts, native features, networking, storage, architecture, and so on — by implementing it for real in the same codebase you're looking at, then explaining the how and the why. The goal is not to enumerate every API; it is to show the shape a maintainable SwiftUI app takes, so the patterns are concrete rather than abstract.

                    It is the sibling of a React developer's guide. Both cover the same concepts; each reaches for the idiomatic answer in its own ecosystem. Where iOS genuinely differs — DI, navigation, the declarative-imperative split between SwiftUI and UIKit — each screen says so and uses the iOS-standard way.
                    """
                )
            }
        }
    }

    // MARK: - 2. What it covers

    private struct WhatItCoversSection: View {
        @ObservedObject var viewModel: AboutViewModel
        @EnvironmentObject private var designSystem: DesignSystem

        var body: some View {
            VStack(alignment: .leading, spacing: DesignSystem.Sizes.md) {
                SectionTitle("What it covers")
                TextBlock("Six areas, each a working implementation rather than a slide.")
                LazyVGrid(columns: [GridItem(.flexible(), spacing: DesignSystem.Sizes.sm), GridItem(.flexible(), spacing: DesignSystem.Sizes.sm)], spacing: DesignSystem.Sizes.sm) {
                    ForEach(viewModel.coveredAreas) { area in
                        AreaCard(area: area)
                    }
                }
            }
        }
    }

    private struct AreaCard: View {
        let area: AboutViewModel.CoveredArea
        @EnvironmentObject private var designSystem: DesignSystem

        var body: some View {
            VStack(alignment: .leading, spacing: DesignSystem.Sizes.xs) {
                HStack(spacing: DesignSystem.Sizes.xs) {
                    Text(area.title)
                        .font(designSystem.types.titleSmall)
                        .foregroundColor(designSystem.colorScheme.onSurface)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(designSystem.types.labelMedium)
                        .foregroundColor(designSystem.colorScheme.onSurface.opacity(0.6))
                }
                Text(area.note)
                    .font(designSystem.types.bodySmall)
                    .foregroundColor(designSystem.colorScheme.onSurface.opacity(0.7))
            }
            .padding(DesignSystem.Sizes.md)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(designSystem.colorScheme.surface)
            .cornerRadius(DesignSystem.Sizes.radiusSm)
        }
    }

    // MARK: - 3. The stack

    private struct StackSection: View {
        @ObservedObject var viewModel: AboutViewModel
        @EnvironmentObject private var designSystem: DesignSystem

        var body: some View {
            VStack(alignment: .leading, spacing: DesignSystem.Sizes.md) {
                SectionTitle("The stack")
                TextBlock("Deliberately standard, nothing exotic. Every dependency was chosen because it is the current idiomatic answer for its job, not because it is novel.")
                CodeBlock(text: viewModel.stackText)
            }
        }
    }

    // MARK: - 4. How it's built

    private struct HowItsBuiltSection: View {
        @EnvironmentObject private var designSystem: DesignSystem

        var body: some View {
            VStack(alignment: .leading, spacing: DesignSystem.Sizes.md) {
                SectionTitle("How it's built")
                TextBlock(
                    """
                    The code separates concerns into four layers — Domain (enterprise rules, framework-free), Data (the implementations: remote, local, repositories), Core (the shared kernel + the composition root), and UI (presentation). Every dependency points inward toward the domain, so each layer can change, be swapped, or be tested without the others moving. The UI is built from a single design system of color tokens (ColorScheme) and typography tokens (FontScheme), so the whole app reads as one system and themes light/dark by flipping the resolved scheme.

                    Cross-cutting concerns are first-class: a Result<T, Failure> type carries success-or-failure through the data layer; errors are converted to severity-tagged Failures at the boundary; Factory containers wire everything in one debuggable place and swap real implementations for fakes per environment. The deep-dive screens (API handling, Database handling, Architecture, Dependency injection) walk each of these layer by layer.
                    """
                )
            }
        }
    }

    // MARK: - 5. Conventions

    private struct ConventionsSection: View {
        @EnvironmentObject private var designSystem: DesignSystem

        var body: some View {
            VStack(alignment: .leading, spacing: DesignSystem.Sizes.md) {
                SectionTitle("Conventions it follows")
                TextBlock(
                    """
                    • Tokens first — design decisions live in DesignSystem (ColorScheme / FontScheme); hardcoded Color.black/.blue/.white in views is a smell, not a shortcut.

                    • Layered architecture — viewModels go through Factory DI; views stay declarative; use cases and repositories live in Domain/Data. Nothing in UI reaches across to Data directly.

                    • Reuse over rebuild — a piece used once is a local function inside the view; a piece used across files lives in UI/Components. New screens are mostly assembling existing primitives (PageScaffold, CustomSection, Links).

                    • Every concept ships a visible, interactive example — not just a code listing — via CustomSection's demo slot.
                    """
                )
            }
        }
    }

    // MARK: - Shared primitives

    private struct SectionTitle: View {
        @EnvironmentObject private var designSystem: DesignSystem
        let text: String
        init(_ text: String) { self.text = text }
        var body: some View {
            Text(text)
                .font(designSystem.types.titleLarge)
                .foregroundColor(designSystem.colorScheme.onBackground)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private struct CodeBlock: View {
        @EnvironmentObject private var designSystem: DesignSystem
        let text: String
        var body: some View {
            ScrollView(.horizontal) {
                Text(text)
                    .font(.system(size: 14, design: .monospaced))
                    .foregroundColor(designSystem.colorScheme.onSurface)
                    .kerning(0.5)
                    .lineSpacing(8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(DesignSystem.Sizes.md)
            }
            .background(designSystem.colorScheme.surface)
            .cornerRadius(DesignSystem.Sizes.radiusSm)
        }
    }
}

#Preview {
    AboutView(viewModel: Container.shared.aboutViewModel())
        .environmentObject(DesignSystem(colorScheme: ColorScheme(.light)))
        .environmentObject(ThemeManager())
        .environmentObject(DrawerState())
}
