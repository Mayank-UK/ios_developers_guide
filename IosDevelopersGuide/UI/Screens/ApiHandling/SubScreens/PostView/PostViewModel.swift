//
//  PostViewModel.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import Foundation
import FactoryKit

@MainActor
final class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var currentFailure: Failure?
    @Published var isLoading: Bool = false
    @Published var networkWarning: Failure? // For non-blocking warnings

    private let fetchPostsUseCase: FetchPostsUseCase

    init(fetchPostsUseCase: FetchPostsUseCase) {
        self.fetchPostsUseCase = fetchPostsUseCase
    }

    func fetchPosts() async {
        // Prevent concurrent requests
        guard !isLoading else {
            return
        }

        // Clear previous error state
        currentFailure = nil
        posts = [] // Clear posts to show we're fetching
        isLoading = true // Set loading state

        // Execute use case and handle Result
        let result = await fetchPostsUseCase.execute()

        isLoading = false // Clear loading state

        switch result {
        case .success(let posts):
            // Success: Update posts with the fetched data
            self.posts = posts

        case .failure(let failure):
            // Failure: Display user-friendly error message
            currentFailure = failure
        }
    }
}

