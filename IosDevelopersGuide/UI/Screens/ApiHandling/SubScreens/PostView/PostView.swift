//
//  PostView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import SwiftUI
import FactoryKit

struct PostView: View {
    /*
        @StateObject (The Creator / Owner)
            Ownership: 
                The view creates and owns the object.
            Lifecycle: 
                SwiftUI guarantees that the object will only be created once. Even if the parent view re-renders or refreshes, your object survives and retains its data.
            Rule of Thumb: 
                Use this when you are instantiating the class using = ViewModel().

        @ObservedObject (The Visitor / Passer-by)
            Ownership: 
                The view does not own the object. It is passed into this view from somewhere else (like a parent view).
            Lifecycle: 
                If the view re-renders, the object can be destroyed and re-created, resetting all its data back to default values.
            Rule of Thumb: 
                Use this when the object is passed into the view's initializer (e.g., var viewModel: ViewModel).

    */
    
    @StateObject private var viewModel: PostViewModel
    @EnvironmentObject var screenData: ScreenData
    
    init(viewModel: PostViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
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
        ZStack {
            // Main content
            if viewModel.isLoading {
                // Show loading indicator
                ProgressView("Loading posts...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let failure = viewModel.currentFailure {
                // Show error based on severity
                if failure.severity == .critical {
                    // Critical errors: Full error screen
                    ErrorView(
                        failure: failure,
                        onRetry: {
                            viewModel.currentFailure = nil
                            Task {
                                await viewModel.fetchPosts()
                            }
                        }
                    )
                } else {
                    // Warnings/Info: Show content with overlay error component
                    List(viewModel.posts) { post in
                        PostRow(post: post)
                    }
                    // Non-blocking error overlay
                    VStack {
                        Spacer()
                        ErrorSnackbar(
                            failure: failure,
                            onDismiss: {
                                viewModel.currentFailure = nil
                            }
                        )
                    }
                }
            } else {
                // Show posts when there's no error
                List(viewModel.posts) { post in
                    PostRow(post: post)
                }
            }
        }
        .frame(height: screenData.height)
        .task {
            // Only fetch once when view appears
            if viewModel.posts.isEmpty && viewModel.currentFailure == nil {
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

#Preview {
    PostView(
        viewModel: Container.shared.postViewModel()
    )
    .environmentObject(ScreenData())
}
