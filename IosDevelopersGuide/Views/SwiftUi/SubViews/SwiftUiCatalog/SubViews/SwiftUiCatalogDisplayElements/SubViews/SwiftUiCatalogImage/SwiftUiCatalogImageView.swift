//
//  SwiftUIImage.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 08/03/24.
//

import SwiftUI

struct SwiftUiCatalogImageView: View {
    func image() -> some View {
        return CustomSection(
            snippetTitle: "Image",
            snippetDescription: """
            A view that displays image
            """,
            snippetCode: """
            Image("family")
                .resizable()
                .scaledToFit()
                .frame(width: 128)
            """,
            demoView: {
                Image("family")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 128)
            }
        )
    }
    
    func sfSymbols() -> some View {
        return CustomSection(
            snippetTitle: "SF Symbols",
            snippetDescription: """
            SF symbols provides a set of 3,000 sonsistent, highly configurable symbols you can use in your app.
            """,
            snippetCode: """
            Image(systemName: "person.circle")
                .imageScale(.medium)
                .foregroundStyle(.tint)
            """,
            demoView: {
                Image(systemName: "person.circle")
                    .imageScale(.medium)
            }
        )
    }
    
    func asyncImage() -> some View {
        return CustomSection(
            snippetTitle: "AsyncImage",
            snippetDescription: """
            A view that displays an image asynchronously.
            """,
            snippetCode: """
            AsyncImage(url: URL(string: "https://hdthomas.com/images/dog@2x.webp")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .scaledToFill()
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
            """,
            demoView: {
                AsyncImage(url: URL(string: "https://hdthomas.com/images/dog@2x.webp")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }
            }
        )
    }

    var body: some View {
        PageScaffold(
            pageTitle: "Image",
            content: {
                image()
                sfSymbols()
                asyncImage()
            }
        )
    }
}

#Preview {
    SwiftUiCatalogImageView()
}
