//
//  PostRepository.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import Foundation

class PostRepositoryImplementation: PostRepository {

    private let apiService: APIServiceProtocol
    private let database: DatabaseServiceProtocol

    init(
        apiService: APIServiceProtocol,
        database: DatabaseServiceProtocol
    ) {
        self.apiService = apiService
        self.database = database
    }

    func fetchPosts() async -> Result<[Post]> {

        return await safeRepositoryCall(

            call: { [weak self] in

                guard let self else {
                    throw ServerException("Repository deallocated during operation")
                }

                print("🌐 [REPO] Fetching latest posts from API")

                let remotePosts = try await self.apiService.fetchPosts()

                print("✅ [REPO] Received \(remotePosts.count) posts from API")

                try self.database.replacePosts(remotePosts)

                return remotePosts.map {
                    Post(
                        id: $0.id,
                        title: $0.title,
                        body: $0.body
                    )
                }
            },

            onNetworkError: { [weak self] networkException in

                guard let self else {
                    return .failure(
                        ExceptionMapper.mapExceptionToFailure(networkException)
                    )
                }

                do {

                    let cachedPosts = try self.database.fetchPosts()

                    if !cachedPosts.isEmpty {

                        print("✅ [REPO] Network failed, using cached data: \(cachedPosts.count) posts")

                        return .success(cachedPosts)
                    }

                    print("❌ [REPO] Network failed and cache empty")

                    return .failure(
                        ExceptionMapper.mapExceptionToFailure(networkException)
                    )

                } catch {

                    let cacheFailure = ExceptionMapper.mapExceptionToFailure(
                        error as? DatabaseException ??
                        DatabaseException.readFailed()
                    )

                    let chainedFailure = NetworkFailure(
                        "Network failed - cache also unavailable",
                        severity: .warning,
                        cause: cacheFailure
                    )

                    print("❌ [REPO] Both network and cache failed")

                    return .failure(chainedFailure)
                }
            },

            onServerError: { [weak self] serverException in

                guard let self else {
                    return .failure(
                        ExceptionMapper.mapExceptionToFailure(serverException)
                    )
                }

                do {

                    let cachedPosts = try self.database.fetchPosts()

                    if !cachedPosts.isEmpty {

                        print("✅ [REPO] Server failed, using cached data: \(cachedPosts.count) posts")

                        return .success(cachedPosts)
                    }

                    print("❌ [REPO] Server failed and cache empty")

                    return .failure(
                        ExceptionMapper.mapExceptionToFailure(serverException)
                    )

                } catch {

                    let cacheFailure = ExceptionMapper.mapExceptionToFailure(
                        error as? DatabaseException ??
                        DatabaseException.readFailed()
                    )

                    let chainedFailure = ServerFailure(
                        "Server failed - cache also unavailable",
                        severity: .critical,
                        cause: cacheFailure,
                        statusCode: serverException.statusCode
                    )

                    print("❌ [REPO] Both server and cache failed")

                    return .failure(chainedFailure)
                }
            }
        )
    }
}