//
//  DatabaseHandlingView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 21/08/24.
//

import SwiftUI

struct DatabaseHandlingView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: DatabaseHandlingViewModel
    @EnvironmentObject var router: Router
    
    func basics() -> some View {
        return CustomSection(
            snippetTitle: "Fetch posts",
            snippetDescription: """
            Posts example
            """,
            snippetCode: """
            // PostRepository.swift
            protocol PostRepository {
                func fetchPosts() async throws -> [Post]
            }

            // FetchPostsUseCase.swift
            class FetchPostsUseCase {
                private let repository: PostRepository
                
                init(repository: PostRepository) {
                    self.repository = repository
                }
                
                func execute() async throws -> [Post] {
                    return try await repository.fetchPosts()
                }
            }

            // Post.swift
            struct Post: Identifiable {
                let id: Int
                let title: String
                let body: String
            }

            // DIContainer.swift
            class DIContainer: ObservableObject {
                static let shared = DIContainer()
                    
                lazy var apiService: APIServiceProtocol = APIService()
                lazy var context: NSManagedObjectContext = AppDatabase.shared.context
                lazy var postRepository: PostRepository = PostRepositoryImplementation(apiService: apiService, context: context)
                
                // post use cases
                lazy var fetchPostsUseCase: FetchPostsUseCase = FetchPostsUseCase(repository: postRepository)
            }

            // PostRepositoryImpl.swift
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
            
            // IosDevelopersGuideApp.xcdatamoduleid
            Entities are defined in this file

            // AppDatabase.swift
            class AppDatabase {
                static let shared = AppDatabase()
                
                lazy var persistentContainer: NSPersistentContainer = {
                    let container = NSPersistentContainer(name: "IosDevelopersGuideApp")
                    
                    container.loadPersistentStores { (storeDescription, error) in
                        if let error = error as NSError? {
                            fatalError("Unresolved error \\(error), \\(error.userInfo)")
                        }
                    }
                    
                    return container
                }()
                
                var context: NSManagedObjectContext {
                    return persistentContainer.viewContext
                }
            }
            
            // PostDTO.swift
            struct PostDTO: Codable {
                let id: Int
                let title: String
                let body: String
            }
            
            // PostView.swift
            struct PostView: View {
                @ObservedObject var viewModel: PostViewModel
                @EnvironmentObject var screenData: ScreenData
                
                struct PostRow: View {
                    let post: Post

                    var body: some View {
                        VStack(alignment: .leading) {
                            Text(post.title)
                                .font(.headline)
                            Text(post.body)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                func basics() -> some View {
                    VStack {
                        if let errorMessage = viewModel.errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .padding()
                        }
                        List(viewModel.posts) { post in
                            PostRow(post: post)
                        }
                    }
                    .frame(height: screenData.height)
                    .onAppear {
                        Task {
                            await viewModel.fetchPosts()
                        }
                    }
                }
                
                var body: some View {
                    PageScaffold(
                        pageTitle: "Posts example",
                        content: {
                            basics()
                        }
                    )
                }
            }

            // PostViewModel.swift
            @MainActor
            class PostViewModel: ObservableObject {
                @Published var posts: [Post] = []
                @Published var errorMessage: String?
                
                private let fetchPostsUseCase: FetchPostsUseCase
                
                init(fetchPostsUseCase: FetchPostsUseCase) {
                    self.fetchPostsUseCase = fetchPostsUseCase
                }
                
                func fetchPosts() async {
                    do {
                        posts = try await fetchPostsUseCase.execute()
                    } catch let error as ErrorTypes {
                        errorMessage = error.localizedDescription
                    } catch {
                        errorMessage = "An unexpected error occurred."
                    }
                }
            }
            """,
            demoView: {
                Text("Database handling is implemented alongside API handling.")
                
                Button {
                    router.navigateTo(routePath: Router.routePaths.posts)
                } label: {
                    Text("Fetch posts")
                }
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Database handling",
            content: {
                basics()
            }
        )
    }
}

//#Preview {
//    DatabaseHandlingView()
//}
