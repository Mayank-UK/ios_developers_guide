//
//  SwiftUiProgressView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogProgressView: View {
    func progressView() -> some View {
        return CustomSection(
            snippetTitle: "ProgressView",
            snippetDescription: """
            A view that shows progress towards a task.
            """,
            snippetCode: """
            VStack(alignment: .leading) {
                ProgressView(label: {
                    Text("Loading")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    }
                ).progressViewStyle(.circular)
                Spacer().frame(height: 32)
                ProgressView(label: {
                    Text("Loading")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    }
                ).progressViewStyle(.linear)
            }
            """,
            demoView: {
                VStack(alignment: .leading) {
                    ProgressView(label: {
                        Text("Loading")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        }
                    ).progressViewStyle(.circular)
                    Spacer().frame(height: 32)
                    ProgressView(label: {
                        Text("Loading")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        }
                    ).progressViewStyle(.linear)
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "ProgressView",
            content: {
                progressView()
            }
        )
    }
}

#Preview {
    SwiftUiCatalogProgressView()
}
