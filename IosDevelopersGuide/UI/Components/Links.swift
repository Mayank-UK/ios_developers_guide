//
//  LinksList.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

/// Renders the home navigation entries as surface cards (title + one-line
/// description + trailing chevron) inside a responsive 1/2/3-column grid.
/// All colours, fonts, radii, and shadows come from `DesignSystem` so the
/// cards re-theme with the app and never hardcode palette values.
struct Links: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var designSystem: DesignSystem
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    let links: [LinkData]

    private func onTapLink(routePath: Router.routePaths) {
        router.navigateTo(routePath: routePath)
    }

    /// 1 column on compact width, 2 on regular, 3 on expanded regular (iPad
    /// landscape / large iPad split). The compact/regular split comes from the
    /// horizontal size class; the regular→expanded split uses the available
    /// width so an iPad in a narrow split view falls back to 2 columns.
    private func columns(forAvailableWidth width: CGFloat) -> [GridItem] {
        let columnCount: Int
        switch horizontalSizeClass {
        case .regular:
            columnCount = width >= 1024 ? 3 : 2
        default: // .compact or nil
            columnCount = 1
        }
        return Array(
            repeating: GridItem(.flexible(), spacing: DesignSystem.Sizes.md),
            count: columnCount
        )
    }

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(
                    columns: columns(forAvailableWidth: geometry.size.width),
                    spacing: DesignSystem.Sizes.md
                ) {
                    ForEach(links, id: \.self) { link in
                        Button {
                            onTapLink(routePath: link.routePath)
                        } label: {
                            LinkCard(link: link)
                        }
                        .buttonStyle(LinkCardStyle())
                    }
                }
                .padding(.vertical, DesignSystem.Sizes.md)
            }
        }
    }
}

// MARK: - Card

private struct LinkCard: View {
    @EnvironmentObject private var designSystem: DesignSystem

    let link: LinkData

    var body: some View {
        HStack(alignment: .center, spacing: DesignSystem.Sizes.sm) {
            VStack(alignment: .leading, spacing: DesignSystem.Sizes.xxs) {
                Text(link.title)
                    .font(designSystem.types.titleMedium)
                    .foregroundColor(designSystem.colorScheme.onSurface)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)

                if !link.description.isEmpty {
                    Text(link.description)
                        .font(designSystem.types.bodyMedium)
                        .foregroundColor(designSystem.colorScheme.onSurface.opacity(0.7))
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }

            Image(systemName: "chevron.right")
                .font(designSystem.types.titleSmall)
                .foregroundColor(designSystem.colorScheme.primary.opacity(0.8))
        }
        .padding(DesignSystem.Sizes.md)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(designSystem.colorScheme.surface)
        .overlay(
            RoundedRectangle(cornerRadius: DesignSystem.Sizes.radiusLg)
                .stroke(designSystem.colorScheme.outline, lineWidth: 1)
        )
        .cornerRadius(DesignSystem.Sizes.radiusLg)
        .designSystemShadow(for: .buttonCard)
        .contentShape(RoundedRectangle(cornerRadius: DesignSystem.Sizes.radiusLg))
    }
}

// MARK: - Press state

/// Subtle press feedback: a primary-coloured border tint. Kept as a
/// `ButtonStyle` so the card chrome animates cleanly between states.
private struct LinkCardStyle: ButtonStyle {
    @EnvironmentObject private var designSystem: DesignSystem

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .overlay(
                RoundedRectangle(cornerRadius: DesignSystem.Sizes.radiusLg)
                    .stroke(
                        designSystem.colorScheme.primary,
                        lineWidth: configuration.isPressed ? 2 : 0
                    )
                    .opacity(configuration.isPressed ? 0.6 : 0)
            )
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }
}

#Preview {
    Links(
        links: [
            LinkData(
                title: "SwiftUI",
                routePath: Router.routePaths._temp,
                description: "Declarative views, modifiers, layouts, and the state-driven UI model."
            ),
            LinkData(
                title: "Architecture",
                routePath: Router.routePaths._temp,
                description: "Clean layering, the dependency rule, and a request traced end to end."
            ),
            LinkData(title: "Link 3", routePath: Router.routePaths._temp),
        ]
    )
    .environmentObject(DesignSystem(colorScheme: ColorScheme(.light)))
}
