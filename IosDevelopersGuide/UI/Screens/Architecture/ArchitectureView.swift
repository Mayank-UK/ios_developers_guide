//
//  SwiftUiCodeArchitecture.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct ArchitectureView: View {
    // inject the viewModel from route
    @ObservedObject var viewModel: ArchitectureViewModel
    
    func cleanMvvm() -> some View {
        return CustomSection(
            snippetTitle: "Clean MVVM",
            snippetDescription: """
            Clean MVVM architecture in Android is a way of organizing your code to promote separation of concerns, maintainability, testability, and scalability. It builds upon the Model-View-ViewModel (MVVM) design pattern by incorporating principles from Clean Architecture, which was introduced by Robert C. Martin (Uncle Bob).
                        
            Key Principles of Clean MVVM Architecture:
            -Separation of Concerns
            -Dependency Injection
            -Single Responsibility Principle (SRP)
            -Repository Pattern
            -Use Cases
            -Testability
            -UI/State Management
            -Reactive Streams
            
            Structure of Clean MVVM Architecture:
            
            ExampleApp/
            |    Data/
            |    |    Local/
            |    |    |    AppDatabase.swift
            |    |    Remote/
            |    |    |    DTOs/
            |    |    |    |    ExampleDto.swift
            |    |    |    ApiService.swift
            |    |    Repositoryimpls/
            |    |    |    ExampleRepositoryImpl.swift
            |    DI/
            |    |    DIContainer.swift
            |    Domain/
            |    |    Models/
            |    |    |    Example.swift
            |    |    RepositoryInterfaces/
            |    |    |    ExampleRepository.swift
            |    |    Usercases/
            |    |    |    ExampleUseCase.swift
            |    UI/
            |    |    DesignSystem/
            |    |    |    DesignSystem.swift
            |    |    Navigation/
            |    |    |    Router.swift
            |    |    Components/
            |    |    |    Example.swift
            |    |    screens/
            |    |    |    Example/
            |    |    |     |   ExampleScreen.swift
            |    |    |     |   ExampleViewModel.swift
            |    Util/
            |    |    Constants.kt
            |    Assets/
            |    |    Audios/
            |    |    Videos/
            """
        )
    }
    
    func dependencyInjection() -> some View {
        return CustomSection(
            snippetTitle: "Dependency Injection",
            snippetDescription: """
            Dependency Injection (DI) is a design pattern that implements Inversion of Control (IoC) — instead of objects creating their own dependencies, they receive them from an external source. This makes code more testable, maintainable, and loosely coupled.

            Why use Dependency Injection?
            - Testability: Easily substitute real dependencies with mocks/fakes
            - Maintainability: Centralized dependency configuration
            - Flexibility: Swap implementations without changing consuming code
            - Single Responsibility: Objects focus on their core logic, not object creation

            Implementation in this project using Factory:

            DI Modules (mirroring Android Hint architecture):

            1. DatabaseModule.swift — Provides Core Data stack
            extension Container {
                var context: Factory<NSManagedObjectContext> {
                    Factory(self) { AppDatabase.shared.context }
                        .scope(.singleton)
                }
            }

            2. NetworkModule.swift — Provides API service
            extension Container {
                var apiService: Factory<any APIServiceProtocol> {
                    Factory(self) { APIService() as any APIServiceProtocol }
                        .scope(.singleton)
                }
            }

            3. RepositoryModule.swift — Composes network + database dependencies
            extension Container {
                var postRepository: Factory<PostRepository> {
                    Factory(self) {
                        PostRepositoryImplementation(
                            apiService: self.apiService(),
                            context: self.context()
                        )
                    }
                    .scope(.singleton)
                }
            }

            4. UseCaseModule.swift — Provides use cases (unscoped, new instance per injection)
            extension Container {
                var fetchPostsUseCase: Factory<FetchPostsUseCase> {
                    Factory(self) {
                        FetchPostsUseCase(repository: self.postRepository())
                    }
                }
            }

            Usage in ViewModels:
            @Injected(\\.fetchPostsUseCase) var fetchPostsUseCase

            Scopes:
            - .singleton — Single instance shared across the app
            - .cached — Shared within the container's context
            - .shared — Shared across specific scope
            - unscoped — New instance each time (default)

            Factory vs traditional DI:
            - Compile-time safety (no runtime string-based keys)
            - Type-safe injections
            - Lightweight, no code generation
            - Swift-native syntax
            """
        )
    }

    
    var body: some View {
        PageScaffold(
            pageTitle: "Architecture",
            content: {
                cleanMvvm()
                dependencyInjection()
            }
        )
    }
}

//#Preview {
//    ArchitectureView()
//}
