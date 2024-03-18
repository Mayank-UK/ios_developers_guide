//
//  SwiftUiOutlineGroupView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogOutlineGroupView: View {
    struct FileItem: Hashable, Identifiable, CustomStringConvertible {
        var id: Self { self }
        var name: String
        var children: [FileItem]? = nil
        var description: String {
            switch children {
                case nil: return "📄 \(name)"
                case .some(let children): return children.isEmpty ? "📂 \(name)" : "📁 \(name)"
            }
        }
    }

    let data = FileItem(name: "users", children: [
        FileItem(name: "user1234", children: [
            FileItem(name: "Photos", children: [
                FileItem(name: "photo001.jpg"),
                FileItem(name: "photo002.jpg")
            ]),
            FileItem(name: "Movies", children: [
                FileItem(name: "movie001.mp4")
            ]),
            FileItem(name: "Documents", children: [])
        ]),
        FileItem(name: "newuser", children: [
            FileItem(name: "Documents", children: [])
        ])
    ])

    func outlineView() -> some View {
        return CustomSection(
            snippetTitle: "OutlineView",
            snippetDescription: """
            OutlineGroup is a view type that displays data in a hierarchical fashion, similar to a tree view.
            """,
            snippetCode: """
            struct FileItem: Hashable, Identifiable, CustomStringConvertible {
                var id: Self { self }
                var name: String
                var children: [FileItem]? = nil
                var description: String {
                    switch children {
                        case nil: return "\\(name)"
                        case .some(let children): return children.isEmpty ? "\\(name)" : "\\(name)"
                    }
                }
            }

            let data = FileItem(name: "users", children: [
                FileItem(name: "user1234", children: [
                    FileItem(name: "Photos", children: [
                        FileItem(name: "photo001.jpg"),
                        FileItem(name: "photo002.jpg")
                    ]),
                    FileItem(name: "Movies", children: [
                        FileItem(name: "movie001.mp4")
                    ]),
                    FileItem(name: "Documents", children: [])
                ]),
                FileItem(name: "newuser", children: [
                    FileItem(name: "Documents", children: [])
                ])
            ])
            OutlineGroup(data, children: \\.children) { item in
                Text("\\(item.description)")
            }
            """,
            demoView: {
                OutlineGroup(data, children: \.children) { item in
                    Text("\(item.description)")
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "OutlineGroup",
            content: {
                outlineView()
            }
        )
    }
}

#Preview {
    SwiftUiCatalogOutlineGroupView()
}
