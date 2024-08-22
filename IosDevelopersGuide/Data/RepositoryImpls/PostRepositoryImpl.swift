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
    
    func fetchPosts() async throws -> [Post] {
        do {
            let localPosts = try fetchLocalPosts()
            if !localPosts.isEmpty {
                return localPosts
            }
            
            let remotePosts = try await apiService.fetchPosts()
            try savePosts(remotePosts)
            return remotePosts.map { Post(id: $0.id, title: $0.title, body: $0.body) }
        } catch let error as ErrorTypes {
            throw error
        } catch {
            throw ErrorTypes.unknownError(error)
        }
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
            throw ErrorTypes.databaseError(error)
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
            throw ErrorTypes.databaseError(error)
        }
    }
}
