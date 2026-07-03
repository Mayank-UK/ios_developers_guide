//
//  PostRepository.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import Foundation
import CoreData

class PostRepositoryImplementation: PostRepository {
    private let apiService: APIServiceProtocol
    private let context: NSManagedObjectContext
    
    init(apiService: APIServiceProtocol, context: NSManagedObjectContext) {
        self.apiService = apiService
        self.context = context
    }
    
    func fetchPosts() async -> Result<[Post]> {
        return await safeRepositoryCall(
            call: { [weak self] in
                guard let self = self else {
                    throw ServerException("Repository deallocated during operation")
                }

                // Directly fetch from remote (no cache for testing)
                let remotePosts = try await self.apiService.fetchPosts()
                try self.savePosts(remotePosts)
                return remotePosts.map { Post(id: $0.id, title: $0.title, body: $0.body) }
            },
            onNetworkError: { networkException in
                // Return failure directly (no cache fallback for testing)
                return .failure(ExceptionMapper.mapExceptionToFailure(networkException))
            },
            onServerError: { serverException in
                // Return failure directly (no cache fallback for testing)
                return .failure(ExceptionMapper.mapExceptionToFailure(serverException))
            }
        )
    }
    
    private func fetchLocalPosts() throws -> [Post] {
        let request: NSFetchRequest<PostEntity> = PostEntity.fetchRequest()
        do {
            let entities = try context.fetch(request)
            return entities.map {
                Post(
                    id: Int($0.id),
                    title: $0.title ?? "No Title",
                    body: $0.body ?? "No Body"
                )
            }
        } catch {
            throw DatabaseException.readFailed(cause: error, context: "fetchLocalPosts")
        }
    }
    
    private func savePosts(_ posts: [PostDTO]) throws {
        for post in posts {
            let entity = PostEntity(context: context)
            entity.id = Int64(post.id)
            entity.title = post.title
            entity.body = post.body
        }
        do {
            try context.save()
        } catch {
            throw DatabaseException.writeFailed(cause: error, context: "savePosts")
        }
    }
}
