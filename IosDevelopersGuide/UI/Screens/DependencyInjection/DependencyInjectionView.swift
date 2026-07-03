//
//  DependencyInjectionView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import SwiftUI
import FactoryKit

struct DependencyInjectionView: View {
    // Pro Setup: Using @ObservedObject since lifecycle and creation live at the route/container layer
    @ObservedObject var viewModel: DependencyInjectionViewModel
    
    func basics() -> some View {
        return CustomSection(
            snippetTitle: "Dependency Injection via Factory",
            snippetDescription: """
            Dependency Injection (DI) is a structural design pattern that implements Inversion of Control (IoC). Instead of a class managing, creating, or hardcoding its own low-level dependencies, it declares what it needs and receives those dependencies from an external system (the DI Container).

            Why Not Call/Instantiate a Class Directly?
            1. Tight Coupling: If Class A initializes Class B directly inside its code (e.g., let service = APIService()), Class A becomes tightly bound to that specific implementation. If the initializer of APIService changes later, Class A breaks.
            2. Hardcoded Lifetime Management: When a class instantiates its own dependency, it controls its lifetime. You lose the flexibility to share that exact instance (Singleton) or generate a clean one (Transient/Unscoped) across different screens.
            3. The Testing & Canvas Preview Wall: If a View or ViewModel initializes a real networking service internally, that code will attempt to perform real API requests during Unit Testing or inside the SwiftUI Preview Canvas. This leads to slow, flaky tests and hanging or crashing canvas previews.

            Why We Pass Dependencies (Constructor Injection):
            By shifting to Constructor Injection (passing dependencies via init(service: APIServiceProtocol)), the class stops caring HOW the dependency is constructed or WHAT concrete class it is. It only cares that the object conforms to the expected protocol interface. 
            This unlocks complete architectural decoupling, enabling you to effortlessly pass a Fake or Mock instance during tests or previews.

            What is Automatic Dependency Resolution?
            In modern DI tools like Factory, you define your dependency graph inside a central Container using modular factory closures. 
            When a class requests a dependency—such as Factory(self) { PostViewModel(fetchPostsUseCase: self.fetchPostsUseCase()) }—the container looks at the parameters needed, automatically resolves the underlying 'fetchPostsUseCase()', handles its lifetime scope (like caching or singletons), and injects it safely. 

            Key Benefits of This Setup:
            - Compile-Time Safety: Unlike legacy service locators or reflection-based DI frameworks that crash at runtime if a dependency is missing, Factory checks references at compile time.
            - Linear Graph Resolution: Complex multi-tier dependency chains (View -> ViewModel -> Use Case -> Repository -> API Client) resolve instantly and automatically in a clean, one-line call inside your Navigation Routing layer.
            """,
            snippetCode: """
            // 1. Core Services / Framework Types
            extension Container {
                var apiService: Factory<any APIServiceProtocol> {
                    Factory(self) { APIService() as any APIServiceProtocol }
                        .scope(.singleton)
                }
                
                var context: Factory<NSManagedObjectContext> {
                    Factory(self) { AppDatabase.shared.context }
                        .scope(.singleton)
                }
            }

            // 2. Data Access Layers
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

            // 3. Domain Use Cases (Unscoped transient factories)
            extension Container {
                var fetchPostsUseCase: Factory<FetchPostsUseCase> {
                    Factory(self) {
                        FetchPostsUseCase(repository: self.postRepository())
                    }
                }
            }

            // 4. UI Layer View Models (Isolated to MainActor)
            extension Container {
                @MainActor
                var postViewModel: Factory<PostViewModel> {
                    Factory(self) {
                        PostViewModel(fetchPostsUseCase: self.fetchPostsUseCase())
                    }
                    .scope(.singleton)
                }
            }

            // 5. Explicit Constructor Injection Pattern
            @MainActor
            final class PostViewModel: ObservableObject {
                private let fetchPostsUseCase: FetchPostsUseCase

                init(fetchPostsUseCase: FetchPostsUseCase) {
                    self.fetchPostsUseCase = fetchPostsUseCase
                }
            }
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Dependency Injection",
            content: {
                basics()
            }
        )
    }
}

#Preview {
    DependencyInjectionView(
        viewModel: Container.shared.dependencyInjectionViewModel()
    )
}
