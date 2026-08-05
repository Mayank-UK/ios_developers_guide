//
//  CodeSnippetWithDemo.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct CustomSection<DemoView: View>: View {
    @EnvironmentObject var designSystem: DesignSystem
    @State private var isExpanded: Bool = false

    let snippetTitle: String
    let snippetDescription: String?
    let snippetCode: String?
    let demoView: DemoView

    init(snippetTitle: String, snippetDescription: String? = nil, snippetCode: String? = nil, @ViewBuilder demoView: @escaping () -> DemoView = { EmptyView() }) {
        self.snippetTitle = snippetTitle
        self.snippetDescription = snippetDescription
        self.snippetCode = snippetCode
        self.demoView = demoView()
    }

    var body: some View {
        VStack {
            Text(snippetTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(designSystem.types.titleLarge)
                .foregroundColor(designSystem.colorScheme.onSurface)
            Spacer().frame(height: 8)
            if let snippetDescription {
                Text(snippetDescription)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(designSystem.types.bodyLarge)
                    .kerning(0.5)
                    .lineSpacing(4)
                    .foregroundColor(designSystem.colorScheme.onSurface.opacity(0.9))
            }
            Spacer().frame(height: 8)
            demoView
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(designSystem.colorScheme.surface)
            Spacer().frame(height: 8)
            if let snippetCode {
                DisclosureGroup("\(isExpanded ? "Hide Code" : "Show Code")", isExpanded: $isExpanded) {
                    ScrollView(.horizontal) {
                        Text(snippetCode)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .font(.system(size: 14, design: .monospaced))
                            .kerning(0.5)
                            .lineSpacing(8)
                            .foregroundColor(designSystem.colorScheme.onSurface)
                            .background(designSystem.colorScheme.surface)
                            .cornerRadius(DesignSystem.Sizes.radiusSm)
                    }
                }
                .tint(designSystem.colorScheme.onSurface)
            }
        }
            .padding()
            .background(designSystem.colorScheme.surface.opacity(0.5))
            .cornerRadius(DesignSystem.Sizes.radiusSm)
    }
}

#Preview {
    CustomSection(
        snippetTitle: "Demo",
        snippetDescription: "Demo description",
        snippetCode: """
        Text("This is a demo code snippet, it has a title and code snippet")
        """,
        demoView: {
            Text("This is a demo view passed to this snippet")
        }
    )
    .environmentObject(DesignSystem(colorScheme: ColorScheme(.light)))
}
