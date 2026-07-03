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
    @Published var errorMessage: String?

    private let fetchPostsUseCase: FetchPostsUseCase

    init(fetchPostsUseCase: FetchPostsUseCase) {
        self.fetchPostsUseCase = fetchPostsUseCase
    }

    func fetchPosts() async {
        do {
            posts = try await fetchPostsUseCase.execute()
        } catch let error as ErrorTypes {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = "An unexpected error occurred."
        }
    }
}

