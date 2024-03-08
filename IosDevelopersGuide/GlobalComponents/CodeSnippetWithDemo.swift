//
//  CodeSnippetWithDemo.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct CodeSnippetWithDemo<DemoView: View>: View {
    @State private var isExpanded: Bool = false
    
    let snippetTitle: String
    let snippetCode: String
    private let demoView: DemoView
    
    init(snippetTitle: String, snippetCode: String, @ViewBuilder demoView: @escaping () -> DemoView) {
        self.snippetTitle = snippetTitle
        self.snippetCode = snippetCode
        self.demoView = demoView()
    }
    
    
    //  create it such that demo is always shown while code snippet can be toggled on/off to show
    var body: some View {
        VStack {
            Text(snippetTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
                .font(.system(size: 20))
            demoView
                .frame(maxWidth: .infinity, alignment: .leading)
            DisclosureGroup("\(isExpanded ? "Hide Code" : "Show Code")", isExpanded: $isExpanded) {
                ScrollView(.horizontal) {
                    Text(snippetCode)
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
            .padding()
    }
}

#Preview {
    CodeSnippetWithDemo(
        snippetTitle: "Demo",
        snippetCode: """
        Text("This is a demo code snippet, it has a title and code snippet")
        """,
        demoView: {
            Text("This is a demo view passed to this snippet")
                .background(.yellow)
        }
    )
}
