//
//  AppDatabase.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import Foundation
import CoreData
import FactoryKit

protocol DatabaseServiceProtocol {

    func fetchPosts() throws -> [Post]

    func replacePosts(_ posts: [PostDTO]) throws

    func clearPosts() throws
}

final class AppDatabase: DatabaseServiceProtocol {

    static let shared = AppDatabase()
    private let logger: AppLoggerProtocol

    private init(logger: AppLoggerProtocol = Container.shared.databaseLogger()) {
        self.logger = logger
        logger.info("AppDatabase initialized")
    }

    private lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "IosDevelopersGuideApp")

        logger.debug("Loading Core Data persistent stores")

        container.loadPersistentStores { _, error in
            if let error {
                self.logger.fault("Core Data store loading failed: \(error.localizedDescription)", privacy: .privateData)
                fatalError("Unresolved CoreData error: \(error)")
            }

            self.logger.notice("Core Data persistent stores loaded successfully")
        }

        return container
    }()

    private var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    func fetchPosts() throws -> [Post] {

        logger.debug("Fetching posts from Core Data")

        let request: NSFetchRequest<PostEntity> = PostEntity.fetchRequest()

        do {

            let entities = try context.fetch(request)

            logger.info("Successfully fetched \(entities.count) posts from database")

            return entities.map {
                Post(
                    id: Int($0.id),
                    title: $0.title ?? "No Title",
                    body: $0.body ?? "No Body"
                )
            }

        } catch {

            logger.error("Failed to fetch posts from database: \(error.localizedDescription)", privacy: .privateData)

            throw DatabaseException.readFailed(
                cause: error,
                context: "AppDatabase.fetchPosts"
            )
        }
    }

    func replacePosts(_ posts: [PostDTO]) throws {

        logger.debug("Replacing \(posts.count) posts in database")

        do {

            try clearPosts()

            logger.debug("Creating \(posts.count) new post entities")

            for post in posts {

                let entity = PostEntity(context: context)

                entity.id = Int64(post.id)
                entity.title = post.title
                entity.body = post.body
            }

            try context.save()

            logger.notice("Successfully saved \(posts.count) posts to database")

        } catch {

            logger.error("Failed to replace posts in database: \(error.localizedDescription)", privacy: .privateData)

            throw DatabaseException.writeFailed(
                cause: error,
                context: "AppDatabase.replacePosts"
            )
        }
    }

    func clearPosts() throws {

        logger.debug("Clearing all posts from database")

        let request: NSFetchRequest<PostEntity> = PostEntity.fetchRequest()

        do {

            let entities = try context.fetch(request)

            logger.debug("Found \(entities.count) posts to delete")

            for entity in entities {
                context.delete(entity)
            }

            try context.save()

            logger.notice("Successfully cleared \(entities.count) posts from database")

        } catch {

            logger.error("Failed to clear posts from database: \(error.localizedDescription)", privacy: .privateData)

            throw DatabaseException.writeFailed(
                cause: error,
                context: "AppDatabase.clearPosts"
            )
        }
    }
}
