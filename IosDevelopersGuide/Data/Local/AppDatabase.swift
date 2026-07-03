//
//  AppDatabase.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import Foundation
import CoreData

// MARK: - Database Service Protocol

protocol DatabaseServiceProtocol {

    func fetchPosts() throws -> [Post]

    func replacePosts(_ posts: [PostDTO]) throws

    func clearPosts() throws
}

// MARK: - Real Database Implementation

final class AppDatabase: DatabaseServiceProtocol {

    static let shared = AppDatabase()

    private init() {}

    // MARK: - Core Data Stack

    private lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "IosDevelopersGuideApp")

        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Unresolved CoreData error: \(error)")
            }
        }

        return container
    }()

    private var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    // MARK: - DatabaseServiceProtocol

    func fetchPosts() throws -> [Post] {

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

            throw DatabaseException.readFailed(
                cause: error,
                context: "AppDatabase.fetchPosts"
            )
        }
    }

    func replacePosts(_ posts: [PostDTO]) throws {

        do {

            try clearPosts()

            for post in posts {

                let entity = PostEntity(context: context)

                entity.id = Int64(post.id)
                entity.title = post.title
                entity.body = post.body
            }

            try context.save()

        } catch {

            throw DatabaseException.writeFailed(
                cause: error,
                context: "AppDatabase.replacePosts"
            )
        }
    }

    func clearPosts() throws {

        let request: NSFetchRequest<PostEntity> = PostEntity.fetchRequest()

        do {

            let entities = try context.fetch(request)

            for entity in entities {
                context.delete(entity)
            }

            try context.save()

        } catch {

            throw DatabaseException.writeFailed(
                cause: error,
                context: "AppDatabase.clearPosts"
            )
        }
    }
}