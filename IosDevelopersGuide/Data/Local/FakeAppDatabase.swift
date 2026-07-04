//
//  FakeAppDatabase.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 03/07/26.
//

import Foundation

enum DbScenario {
    case success
    case empty
    case readError
    case writeError
    case connectionFailed
}

final class FakeAppDatabase: DatabaseServiceProtocol {

    private var scenario: DbScenario
    private var cachedPosts: [Post] = []

    init(scenario: DbScenario = .success) {
         self.scenario = scenario
//        self.scenario = .readError
    }

    func setScenario(_ scenario: DbScenario) {
        self.scenario = scenario
    }

    func fetchPosts() throws -> [Post] {


        switch scenario {

        case .success:

            return cachedPosts

        case .empty:
            return []

        case .readError:


            throw DatabaseException.readFailed(
                cause: nil,
                context: "FakeAppDatabase.fetchPosts"
            )

        case .writeError:

            return cachedPosts

        case .connectionFailed:

            throw DatabaseException.connectionFailed(
                cause: nil,
                context: "FakeAppDatabase.fetchPosts"
            )
        }
    }

    func replacePosts(_ posts: [PostDTO]) throws {

        switch scenario {

        case .success,
             .empty,
             .readError:

            cachedPosts = posts.map {
                Post(
                    id: $0.id,
                    title: $0.title,
                    body: $0.body
                )
            }

        case .writeError:

            throw DatabaseException.writeFailed(
                cause: nil,
                context: "FakeAppDatabase.replacePosts"
            )

        case .connectionFailed:

            throw DatabaseException.connectionFailed(
                cause: nil,
                context: "FakeAppDatabase.replacePosts"
            )
        }
    }

    func clearPosts() throws {

        switch scenario {

        case .success,
             .empty,
             .readError:

            cachedPosts.removeAll()

        case .writeError:

            throw DatabaseException.writeFailed(
                cause: nil,
                context: "FakeAppDatabase.clearPosts"
            )

        case .connectionFailed:

            throw DatabaseException.connectionFailed(
                cause: nil,
                context: "FakeAppDatabase.clearPosts"
            )
        }
    }
}
