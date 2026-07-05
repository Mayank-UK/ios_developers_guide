//
//  TestDataBuilder.swift
//  IosDevelopersGuideTests
//
//  Created by Claude on 04/07/26.
//

import Foundation
@testable import IosDevelopersGuide

/// Helper class to build test data for unit tests
struct TestDataBuilder {

    // MARK: - Post Data Builders

    static func createPostDTO(
        id: Int = 1,
        title: String = "Test Post",
        body: String = "Test post body"
    ) -> PostDTO {
        PostDTO(id: id, title: title, body: body)
    }

    static func createPost(
        id: Int = 1,
        title: String = "Test Post",
        body: String = "Test post body"
    ) -> Post {
        Post(id: id, title: title, body: body)
    }

    static func createMultiplePostDTOs(count: Int) -> [PostDTO] {
        (1...count).map { index in
            createPostDTO(
                id: index,
                title: "Test Post \(index)",
                body: "Test post body \(index)"
            )
        }
    }

    static func createMultiplePosts(count: Int) -> [Post] {
        (1...count).map { index in
            createPost(
                id: index,
                title: "Test Post \(index)",
                body: "Test post body \(index)"
            )
        }
    }

    // MARK: - URL Builders

    static func createTestURL() -> URL {
        URL(string: "https://api.example.com/posts")!
    }

    // MARK: - Data Builders

    static func createValidJSONData() -> Data {
        """
        [
            {
                "id": 1,
                "title": "Test Post 1",
                "body": "Test body 1"
            },
            {
                "id": 2,
                "title": "Test Post 2",
                "body": "Test body 2"
            }
        ]
        """.data(using: .utf8)!
    }

    static func createInvalidJSONData() -> Data {
        "{ invalid json }".data(using: .utf8)!
    }

    static func createEmptyJSONData() -> Data {
        "[]".data(using: .utf8)!
    }
}
