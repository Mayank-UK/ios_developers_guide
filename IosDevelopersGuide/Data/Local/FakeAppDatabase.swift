//
//  FakeDatabaseService.swift
//  IosDevelopersGuide
//
//  Created by [Your Name]
//  Copyright © 2026. All rights reserved.
//

import Foundation
import CoreData

// MARK: - Database Scenario Enum

enum DbScenario {
    case success              // Normal database operations
    case empty                // No data in database
    case readError            // Database read failure
    case writeError           // Database write failure
    case connectionFailed     // Database connection failure
}

// MARK: - Fake Database Service

/// Fake database service for testing different error scenarios
/// This simulates CoreData operations without actual database
///
/// ## Usage Example
/// ```swift
/// let fakeDB = FakeDatabaseService(scenario: .empty)
/// // All database operations will simulate empty database
///
/// // Change scenario dynamically:
/// fakeDB.setScenario(.readError)
/// ```
class FakeDatabase {
    
    // MARK: - Properties
    
    private var scenario: DbScenario
    private var cachedPosts: [Post] = []
    
    // MARK: - Initialization
    
    init(scenario: DbScenario = .success) {
        self.scenario = scenario
        print("🔧 [FAKE_DB] Initialized with scenario: \(scenario)")
    }
    
    // MARK: - Scenario Management
    
    /// Update the current scenario for testing
    func setScenario(_ scenario: DbScenario) {
        self.scenario = scenario
        print("🔧 [FAKE_DB] Scenario changed to: \(scenario)")
    }
    
    // MARK: - Database Operations Simulation
    
    /// Simulates fetching posts from database
    func fetchPosts() throws -> [Post] {
        print("🔧 [FAKE_DB] Simulating fetchPosts")
        
        switch scenario {
        case .success:
            print("✅ [FAKE_DB] Success: returning \(cachedPosts.count) cached posts")
            return cachedPosts
            
        case .empty:
            print("✅ [FAKE_DB] Empty scenario: returning no posts")
            return []
            
        case .readError:
            print("❌ [FAKE_DB] Simulating read error")
            throw DatabaseException.readFailed(
                cause: nil,
                context: "FakeDatabaseService read error simulation"
            )
            
        case .writeError:
            print("✅ [FAKE_DB] Write error scenario: read still works")
            return cachedPosts
            
        case .connectionFailed:
            print("❌ [FAKE_DB] Simulating connection failure")
            throw DatabaseException.connectionFailed(
                cause: nil,
                context: "FakeDatabaseService connection failure simulation"
            )
        }
    }
    
    /// Simulates saving posts to database
    func savePosts(_ posts: [PostDTO]) throws {
        print("🔧 [FAKE_DB] Simulating savePosts: \(posts.count) posts")
        
        switch scenario {
        case .success:
            print("✅ [FAKE_DB] Success: caching posts")
            cachedPosts = posts.map { Post(id: $0.id, title: $0.title, body: $0.body) }
            
        case .empty:
            print("✅ [FAKE_DB] Empty scenario: caching posts")
            cachedPosts = posts.map { Post(id: $0.id, title: $0.title, body: $0.body) }
            
        case .readError:
            print("✅ [FAKE_DB] Read error scenario: write still works")
            cachedPosts = posts.map { Post(id: $0.id, title: $0.title, body: $0.body) }
            
        case .writeError:
            print("❌ [FAKE_DB] Simulating write error")
            throw DatabaseException.writeFailed(
                cause: nil,
                context: "FakeDatabaseService write error simulation"
            )
            
        case .connectionFailed:
            print("❌ [FAKE_DB] Simulating connection failure")
            throw DatabaseException.connectionFailed(
                cause: nil,
                context: "FakeDatabaseService connection failure simulation"
            )
        }
    }
    
    /// Clears the fake cache (useful for testing)
    func clearCache() {
        cachedPosts = []
        print("🔧 [FAKE_DB] Cache cleared")
    }
}
