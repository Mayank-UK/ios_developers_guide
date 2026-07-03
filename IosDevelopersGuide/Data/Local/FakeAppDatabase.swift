//
//  FakeAppDatabase.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 03/07/26.
//

import Foundation

// MARK: - Database Scenario

enum DbScenario {
    case success
    case empty
    case readError
    case writeError
    case connectionFailed
}

// MARK: - Fake Database

final class FakeAppDatabase: DatabaseServiceProtocol {

    private var scenario: DbScenario
    private var cachedPosts: [Post] = []

    init(scenario: DbScenario = .success) {
        // self.scenario = scenario
        self.scenario = .readError

        print("🧪 [FAKE_DB] Initialized with scenario: \(scenario)")
    }

    // MARK: - Scenario Management

    func setScenario(_ scenario: DbScenario) {
        self.scenario = scenario
        print("🧪 [FAKE_DB] Scenario changed to: \(scenario)")
    }

    // MARK: - DatabaseServiceProtocol

    func fetchPosts() throws -> [Post] {

        print("🧪 [FAKE_DB] fetchPosts()")

        switch scenario {

        case .success:

            print("✅ [FAKE_DB] Returning \(cachedPosts.count) cached posts")
            return cachedPosts

        case .empty:

            print("✅ [FAKE_DB] Returning empty cache")
            return []

        case .readError:

            print("❌ [FAKE_DB] Simulating read error")

            throw DatabaseException.readFailed(
                cause: nil,
                context: "FakeAppDatabase.fetchPosts"
            )

        case .writeError:

            print("✅ [FAKE_DB] Read still succeeds")
            return cachedPosts

        case .connectionFailed:

            print("❌ [FAKE_DB] Simulating connection failure")

            throw DatabaseException.connectionFailed(
                cause: nil,
                context: "FakeAppDatabase.fetchPosts"
            )
        }
    }

    func replacePosts(_ posts: [PostDTO]) throws {

        print("🧪 [FAKE_DB] replacePosts(\(posts.count))")

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

            print("✅ [FAKE_DB] Cache updated")

        case .writeError:

            print("❌ [FAKE_DB] Simulating write error")

            throw DatabaseException.writeFailed(
                cause: nil,
                context: "FakeAppDatabase.replacePosts"
            )

        case .connectionFailed:

            print("❌ [FAKE_DB] Simulating connection failure")

            throw DatabaseException.connectionFailed(
                cause: nil,
                context: "FakeAppDatabase.replacePosts"
            )
        }
    }

    func clearPosts() throws {

        print("🧪 [FAKE_DB] clearPosts()")

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