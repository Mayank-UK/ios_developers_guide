//
//  DIContainer.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import Foundation
import CoreData

class DIContainer: ObservableObject {
    static let shared = DIContainer()
        
    lazy var apiService: APIServiceProtocol = APIService()
    lazy var context: NSManagedObjectContext = AppDatabase.shared.context
    lazy var postRepository: PostRepository = PostRepositoryImplementation(apiService: apiService, context: context)
    
    // post use cases
    lazy var fetchPostsUseCase: FetchPostsUseCase = FetchPostsUseCase(repository: postRepository)
}
