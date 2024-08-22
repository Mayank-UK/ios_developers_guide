//
//  CodeSnippetWithDemo.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct CustomSection<DemoView: View>: View {
    @State private var isExpanded: Bool = false
    
    let snippetTitle: String
    let snippetDescription: String?
    let snippetCode: String?
    let demoView: DemoView
    
    init(snippetTitle: String, snippetDescription: String? = nil, snippetCode: String? = nil, @ViewBuilder demoView: @escaping () -> DemoView = { EmptyView() }) {
        self.snippetTitle = snippetTitle
        self.snippetDescription = snippetDescription ?? nil
        self.snippetCode = snippetCode ?? nil
        self.demoView = demoView()
    }
    
    var body: some View {
        VStack {
            Text(snippetTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
                .font(.system(size: 20))
            Spacer().frame(height: 8)
            if(snippetDescription != nil) {
                Text(snippetDescription!)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 16))
                    .kerning(0.5)
                    .lineSpacing(4)
                    .foregroundColor(Color.black.opacity(0.9))
            }
            Spacer().frame(height: 8)
            demoView
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.black.opacity(0.1))
            Spacer().frame(height: 8)
            if (snippetCode != nil) {
                DisclosureGroup("\(isExpanded ? "Hide Code" : "Show Code")", isExpanded: $isExpanded) {
                    ScrollView(.horizontal) {
                        Text(snippetCode!)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .font(.system(size: 14, design: .monospaced))
                            .kerning(0.5)
                            .lineSpacing(8)
                            .foregroundColor(.white)
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(8)
                    }
                }
            }
        }
            .padding()
            .background(Color.black.opacity(0.05))
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
}
