//
//  RepositoryModule.swift
//  IosDevelopersGuide
//
//  Mirrors the Android `RepositoryModule` Hilt module: binds repository
//  implementations to their domain protocols. Resolves its own dependencies
//  from the other modules at build time.
//

import FactoryKit

extension Container {
    /// Domain-facing post repository, wired to the network + database modules.
    var postRepository: Factory<PostRepository> {
        Factory(self) {
            PostRepositoryImplementation(
                apiService: self.apiService(),
                database: self.database()
            )
        }
        .scope(.singleton)
    }
}
