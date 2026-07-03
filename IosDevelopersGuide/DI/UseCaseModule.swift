//
//  UseCaseModule.swift
//  IosDevelopersGuide
//
//  Mirrors the Android use-case `@Provides` entries (unscoped by default):
//  a fresh use-case instance per resolve, each backed by the repository module.
//

import FactoryKit

extension Container {
    /// Unscoped — a new instance per injection, like Hilt's default `@Provides`.
    var fetchPostsUseCase: Factory<FetchPostsUseCase> {
        Factory(self) {
            FetchPostsUseCase(repository: self.postRepository())
        }
    }
}
