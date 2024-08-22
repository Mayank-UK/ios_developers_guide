//
//  PostView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import SwiftUI

struct PostView: View {
    @ObservedObject var viewModel: PostViewModel
    @EnvironmentObject var screenData: ScreenData
    
    struct PostRow: View {
        let post: Post

        var body: some View {
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.headline)
                Text(post.body)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    func basics() -> some View {
        VStack {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            List(viewModel.posts) { post in
                PostRow(post: post)
            }
        }
        .frame(height: screenData.height)
        .onAppear {
            Task {
                await viewModel.fetchPosts()
            }
        }
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Posts example",
            content: {
                basics()
            }
        )
    }
}
