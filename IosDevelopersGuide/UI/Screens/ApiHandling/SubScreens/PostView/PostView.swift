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

#Preview {
    PostView(
        viewModel: Container.shared.postViewModel()
    )
    .environmentObject(ScreenData())
}
