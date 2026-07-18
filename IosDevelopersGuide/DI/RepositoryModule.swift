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
    var postRepository: Factory<PostRepository> {
        /// Scoped and singleton — only one single instance for all injections
        Factory(self) {
            PostRepositoryImplementation(
                remote: self.postRemoteDataSource(),
                local: self.postLocalDataSource(),
                logger: self.repositoryLogger()
            )
        }
        .scope(.singleton)
    }
}
