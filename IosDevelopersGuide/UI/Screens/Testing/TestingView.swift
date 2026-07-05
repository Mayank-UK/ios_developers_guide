//
//  TestingView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import SwiftUI

struct TestingView: View {
    // inject the viewModel from route
    @StateObject var viewModel: TestingViewModel
    
    func basics() -> some View {
        return CustomSection(
            snippetTitle: "Testing with Swift Testing",
            snippetDescription: """
            This project uses Apple's Swift Testing framework (not XCTest). Tests live in the IosDevelopersGuideTests target and are organised to mirror the app's Clean Architecture layers: Core (exceptions, failures, mappers, guards), Domain (use cases), Data (repository implementations) and Integration (end-to-end flows).

            Two custom error models run through the tests:
            • AppException — internal technical errors (NetworkException, ServerException, DatabaseException, DecodingException) thrown by the data layer.
            • Failure — user-facing, severity-tagged errors (NetworkFailure, ServerFailure, CacheFailure) returned to the UI.

            Repositories return a custom Result<T> (.success / .failure(Failure)), and ExceptionMapper bridges AppException → Failure.

            Tests stay fast and deterministic by injecting fakes and mocks through protocols (APIServiceProtocol, DatabaseServiceProtocol, PostRepository). FakeApiService and FakeAppDatabase are driven by scenario enums (.success, .networkError, .timeout, .empty, ...), so every code path can be exercised without a real network or Core Data store.
            """,
            snippetCode: """
            import Testing
            @testable import IosDevelopersGuide

            struct FetchPostsUseCaseTests {

                @Test("Use case returns posts when repository succeeds")
                func fetchPostsSuccess() async throws {
                    // Arrange — inject a mock repository
                    let posts = TestDataBuilder.createMultiplePosts(count: 3)
                    let mock = MockPostRepository(result: .success(posts))
                    let useCase = FetchPostsUseCase(repository: mock)

                    // Act
                    let result = await useCase.execute()

                    // Assert — #expect is the Swift Testing assertion macro
                    let returned = try TestHelpers.unwrapSuccess(result)
                    #expect(returned.count == 3)
                }
            }

            // A hand-written mock conforming to the PostRepository protocol
            final class MockPostRepository: PostRepository {
                private let result: Result<[Post]>
                init(result: Result<[Post]>) { self.result = result }
                func fetchPosts() async -> Result<[Post]> { result }
            }

            // Fakes are driven by a scenario enum for deterministic behaviour
            let api = FakeApiService(scenario: .networkError)   // always throws
            let db  = FakeAppDatabase(scenario: .success)       // in-memory cache
            """
        )
    }

    var body: some View {
        PageScaffold(
            pageTitle: "Testing",
            content: {
                basics()
            }
        )
    }
}

//#Preview {
//    TempView()
//}
