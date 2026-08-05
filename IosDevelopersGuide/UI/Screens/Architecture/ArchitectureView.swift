//
//  ArchitectureView.swift
//  IosDevelopersGuide
//
//  How THIS app's code is organised so it stays maintainable. Mirrors the
//  React sibling guide's architecture screen in depth and structure, but the
//  copy and the types are this codebase's own: SwiftUI + UIKit, Factory DI,
//  the Domain/Data/Core/UI/DI layers, HTTPClient + interceptors, the
//  Result/Failure pipeline, and a real fetch-posts trace through them.
//

import SwiftUI
import FactoryKit

struct ArchitectureView: View {
    @StateObject var viewModel: ArchitectureViewModel

    var body: some View {
        PageScaffold(pageTitle: "Architecture") {
            VStack(spacing: DesignSystem.Sizes.lg) {
                WhatAndWhySection()
                LayersSection()
                DependencyRuleSection()
                RequestTracedSection()
                DependencyInjectionSection()
                WhatYouGetSection()
            }
            .padding(.horizontal, DesignSystem.Sizes.md)
            .padding(.bottom, DesignSystem.Sizes.xl)
        }
    }

    // MARK: - 1. What architecture is, and why

    private struct WhatAndWhySection: View {
        var body: some View {
            SectionWrapper("What architecture is, and why it matters") {
                ContentGroup("A rule about which code may know about which other code") {
                    TextBlock(
                        """
                        Architecture is not folders for their own sake — it is a rule about which code is allowed to depend on which other code. As a feature grows, different parts change at different speeds and for different reasons: the endpoint URL changes when the backend moves, the loading spinner changes when the designer restyles, the cache rule changes when the product adds offline mode. If all of that lives in one place, every change touches everything and every change risks breaking everything. Separating those concerns into layers means a change in one layer has no reason to touch the others.
                        """
                    )
                }
                ContentGroup("The cost of not doing it") {
                    TextBlock(
                        """
                        The alternative — fetch-and-setState inline in the view — works for a demo and then rots. The view ends up knowing the endpoint shape, the DTO-to-model mapping, the cache strategy, the error wording, and the spinner state all at once. You cannot test the fetch without rendering the view, cannot swap the real API for a fake without editing the view, and cannot reuse the logic in a second screen without copying it. Every one of those pains is a layer boundary that was never drawn.
                        """
                    )
                    TextBlock(
                        """
                        This screen is the map; every other deep-dive screen (API handling, Database handling, Dependency injection) walks one seam in detail. Here we draw the whole shape at once so the seams are concrete rather than abstract.
                        """
                    )
                }
            }
        }
    }

    // MARK: - 2. The layers

    private struct LayersSection: View {
        var body: some View {
            SectionWrapper("The layers in this app") {
                TextBlock(
                    """
                    The codebase splits into five top-level groups. Each owns one concern and is forbidden from reaching across into another. The folder a file lives in is its contract — you can read which layer it belongs to from its path.
                    """
                )

                ContentGroup("Domain — enterprise rules, framework-free") {
                    TextBlock(
                        """
                        The nouns and verbs of the business: plain Swift models, repository contracts (protocols), and use cases. No UIKit, no networking, no Core Data. This layer could be compiled into a Swift Package and exercised in a unit test target with zero setup.
                        """
                    )
                    CodeBlock(
                        code: """
                        Domain/
                        ├── Models/                # Post, LinkData, BaseModel
                        ├── RepositoryInterfaces/  # PostRepository protocol
                        └── UseCases/              # FetchPostsUseCase
                        """,
                        language: "text"
                    )
                }

                ContentGroup("Data — the implementations of those contracts") {
                    TextBlock(
                        """
                        Where the framework imports live. Remote sources talk to the network through HTTPClient; local sources talk to Core Data through AppDatabase; repository implementations orchestrate them and map DTOs to domain models. The fakes (FakeApiService, FakeAppDatabase) live here too, swapped in by config.
                        """
                    )
                    CodeBlock(
                        code: """
                        Data/
                        ├── Local/                 # AppDatabase, FakeAppDatabase (Core Data)
                        ├── Remote/
                        │   ├── DTOs/              # PostDTO
                        │   ├── Networking/        # HTTPClient + Interceptors
                        │   ├── FakeApiService.swift
                        │   └── PostRemoteDataSource.swift
                        └── RepositoryImpls/       # PostRepositoryImplementation
                        """,
                        language: "text"
                    )
                }

                ContentGroup("Core — the shared kernel every layer uses") {
                    TextBlock(
                        """
                        The plumbing that crosses every layer: the Result<T> type, the exception→failure pipeline, configuration, logging, and the guards that turn throwing calls into Results. Nothing in Core knows a screen exists.
                        """
                    )
                    CodeBlock(
                        code: """
                        Core/
                        ├── ResultType.swift        # Result<T> = success(T) | failure(Failure)
                        ├── Exceptions/             # Network/Server/Database/DecodingException
                        ├── Failures/               # Failure protocol + Network/Server/CacheFailure
                        ├── Guards/                 # guardedApiCall, safeRepositoryCall
                        ├── Mapping/                # ExceptionMapper (exception → failure)
                        ├── Config/ · Connectivity/ · Logging/ · Scenario/
                        """,
                        language: "text"
                    )
                }

                ContentGroup("UI — presentation") {
                    TextBlock(
                        """
                        SwiftUI screens and shared components, the Router that navigates between them, and the DesignSystem of color and typography tokens. Views depend on domain use cases and models, never on a concrete data implementation.
                        """
                    )
                    CodeBlock(
                        code: """
                        UI/
                        ├── Screens/               # one folder per screen (+ its ViewModel)
                        ├── Components/            # shared presentational pieces
                        ├── Navigation/            # Router + route table
                        └── DesignSystem/          # ColorScheme / FontScheme / sizes
                        """,
                        language: "text"
                    )
                }

                ContentGroup("DI — the composition root") {
                    TextBlock(
                        """
                        One Factory container, split into modules, that wires implementations to protocols and resolves the whole graph. This is the single place allowed to know about concrete types — every other file depends on a protocol.
                        """
                    )
                    CodeBlock(
                        code: """
                        DI/
                        ├── NetworkModule.swift        # httpClient, postRemoteDataSource
                        ├── DatabaseModule.swift       # localStore, postLocalDataSource
                        ├── RepositoryModule.swift     # postRepository
                        ├── UseCaseModule.swift        # fetchPostsUseCase
                        ├── ViewModelModule.swift      # one Factory per screen
                        └── LoggingModule.swift        # shared AppLogger registrations
                        """,
                        language: "text"
                    )
                }
            }
        }
    }

    // MARK: - 3. The dependency rule

    private struct DependencyRuleSection: View {
        var body: some View {
            SectionWrapper("The dependency rule — every arrow points inward") {
                ContentGroup("Domain depends on nothing concrete; Data implements Domain; UI talks to use cases") {
                    TextBlock(
                        """
                        The single rule that makes the layers work: dependencies point inward, toward the domain. Domain has no imports of UIKit, URLSession, or Core Data — it is plain Swift types and protocols, so it runs in the app, in a test target, or in a Swift Package with no setup. Data implements the domain's contracts: PostRepositoryImplementation conforms to the PostRepository protocol the domain defines, and is the only layer that touches the network and Core Data. UI depends on domain use cases and models, never on a concrete repository — it asks the container for FetchPostsUseCase and has no idea whether that resolves to a real REST client or a fake.
                        """
                    )
                    CodeBlock(
                        code: """
                                 ┌──────────────────────────────────────────┐
                                 │  UI/   (Screens, Components, Router)       │  talks to use cases
                                 │   └─────────────────────────────────────┐ │  + resolves via Container
                                 │      ┌──────────────────────────────────┘ │
                                 │      │  Data/  (Impls: remote, local, DTOs) │  implements domain contracts
                                 │      │   └───────────────────────────────┐ │  owns URLSession + Core Data
                                 │      │      ┌────────────────────────────┘ │
                                 │      │      │  Domain/  (Models, Protocols, │  depends on NOTHING concrete
                                 │      │      │             UseCases)         │  outside Core's pure types
                                 │      │      └─────────────────────────────┘ │
                                 │      └────────────────────────────────────┘ │
                                 └─────────────────────────────────────────────┘
                              Core/  underpins all of the above (Result, Failures, Guards, Mapping)
                        """,
                        language: "text"
                    )
                }
                ContentGroup("One exception: the composition root") {
                    TextBlock(
                        """
                        There is exactly one place allowed to know about concrete implementations: the DI container. Its modules wire PostRepositoryImplementation to the real or fake remote and local sources and hand the finished FetchPostsUseCase to the rest of the app. This is not a violation of the rule; it is the rule's escape hatch. Every other file depends on a protocol, and this one module is where protocols meet instances. Dependency injection is a whole screen of its own; here we only note that the container is the single arrow allowed to point outward.
                        """
                    )
                }
            }
        }
    }

    // MARK: - 4. A request, traced

    private struct RequestTracedSection: View {
        var body: some View {
            SectionWrapper("A request, traced — fetching posts, layer by layer") {
                ContentGroup("Each hop is a layer boundary, and each boundary has a reason") {
                    TextBlock(
                        """
                        Trace fetching the posts list from a button press to pixels. The return path carries a Result<[Post]> — never a thrown exception past the repository — so the view can branch on severity without a try/catch. Run this same flow on the API handling screen to see it live.
                        """
                    )
                }

                ContentGroup("UI — the ViewModel owns presentation state, nothing else") {
                    TextBlock(
                        """
                        PostViewModel clears the loading/error state, calls the use case, and switches on the Result. It does not know where posts come from.
                        """
                    )
                    CodeBlock(
                        code: """
                        // UI/Screens/ApiHandling/SubScreens/PostView/PostViewModel.swift
                        let result = await fetchPostsUseCase.execute()
                        switch result {
                        case .success(let posts):  self.posts = posts
                        case .failure(let failure): self.currentFailure = failure
                        }
                        """,
                        language: "swift"
                    )
                }

                ContentGroup("Domain — a thin seam for future policy") {
                    TextBlock(
                        """
                        The use case delegates to the repository contract (a protocol). Today it is a straight pass-through; the seam exists so caching, combining sources, or authorization can land here without the UI or Data moving.
                        """
                    )
                    CodeBlock(
                        code: """
                        // Domain/UseCases/Posts/FetchPostsUseCase.swift
                        func execute() async -> Result<[Post]> {
                            await repository.fetchPosts()
                        }
                        // Domain/RepositoryInterfaces/PostRepository.swift
                        protocol PostRepository { func fetchPosts() async -> Result<[Post]> }
                        """,
                        language: "swift"
                    )
                }

                ContentGroup("Data — the only layer that touches the network and cache") {
                    TextBlock(
                        """
                        Factory resolves PostRepository to PostRepositoryImplementation (singleton). It fetches from the remote, writes the cache, and maps each PostDTO to a domain Post — all inside safeRepositoryCall so any throw becomes a Result.
                        """
                    )
                    CodeBlock(
                        code: """
                        // Data/RepositoryImpls/PostRepositoryImplementation.swift
                        return await safeRepositoryCall(
                            call: {
                                let remotePosts = try await self.remote.fetchPosts()
                                try self.local.replacePosts(remotePosts)
                                return remotePosts.map { Post(id: $0.id, title: $0.title, body: $0.body) }
                            },
                            onNetworkError: { exception in /* fall back to cache, else map to Failure */ }
                        )
                        """,
                        language: "swift"
                    )
                }

                ContentGroup("Data → Core — HTTPClient runs the interceptor chain") {
                    TextBlock(
                        """
                        The remote data source is a few endpoints on top of the shared HTTPClient. AuthTokenInterceptor, RetryInterceptor, and (in development) FailureInjectionInterceptor wrap every request; non-2xx responses are thrown as ServerException so they flow through guardedApiCall like any other failure.
                        """
                    )
                    CodeBlock(
                        code: """
                        // Data/Remote/PostRemoteDataSource.swift
                        func fetchPosts() async throws -> [PostDTO] {
                            try await client.get("\\(baseURL)/posts", as: [PostDTO].self)
                        }
                        """,
                        language: "swift"
                    )
                }

                ContentGroup("Core — exceptions become Failures at the boundary") {
                    TextBlock(
                        """
                        safeRepositoryCall catches each typed AppException and routes it through ExceptionMapper, which returns a severity-tagged Failure (NetworkFailure, ServerFailure, or CacheFailure). That Failure — never a raw error — is what travels back up to the UI.
                        """
                    )
                    CodeBlock(
                        code: """
                        // Core/Mapping/ExceptionMapper.swift
                        static func mapExceptionToFailure(_ exception: AppException) -> Failure
                        // 500–599 → ServerFailure(.critical); 400–499 → ServerFailure(.warning)
                        // network/timeout → NetworkFailure(.warning); DB → CacheFailure(.info)
                        """,
                        language: "swift"
                    )
                }

                ContentGroup("UI — the view branches on the Result") {
                    TextBlock(
                        """
                        Back in the view, the success path renders the post list and the failure path renders the shared ErrorBanner / ErrorSnackbar, themed by severity. No layer below knew a screen existed; no layer above knew the network existed.
                        """
                    )
                }
            }
        }
    }

    // MARK: - 5. Dependency injection

    private struct DependencyInjectionSection: View {
        var body: some View {
            SectionWrapper("Dependency injection — where the boundaries become real") {
                ContentGroup("Factory registers, the container resolves") {
                    TextBlock(
                        """
                        Every dependency is registered as a Factory<T> on the shared Container, split across the modules in DI/. Call sites resolve by protocol — Container.shared.fetchPostsUseCase() — and never name a concrete implementation. That is what makes the dependency rule more than a convention: the UI literally cannot ask for PostRepositoryImplementation, only for the FetchPostsUseCase that hides it.
                        """
                    )
                    CodeBlock(
                        code: """
                        // DI/RepositoryModule.swift — singleton: one real repository
                        var postRepository: Factory<PostRepository> {
                            Factory(self) {
                                PostRepositoryImplementation(
                                    remote: self.postRemoteDataSource(),
                                    local:  self.postLocalDataSource(),
                                    logger: self.repositoryLogger()
                                )
                            }.scope(.singleton)
                        }

                        // DI/UseCaseModule.swift — unscoped: a fresh use case per resolve
                        var fetchPostsUseCase: Factory<FetchPostsUseCase> {
                            Factory(self) { FetchPostsUseCase(repository: self.postRepository()) }
                        }
                        """,
                        language: "swift"
                    )
                }
                ContentGroup("Scope follows lifetime") {
                    TextBlock(
                        """
                        Singletons back the things that hold expensive state — HTTPClient, AppDatabase, repositories, view models. Use cases are unscoped, so each resolve builds a fresh, cheap instance the way Hilt's default @Provides would. The wiring decision lives in exactly one file per concern, which is what makes the layers swappable and testable.
                        """
                    )
                }
                ContentGroup("One config flag swaps real for fake") {
                    TextBlock(
                        """
                        NetworkModule and DatabaseModule read AppConfiguration.shared.useFakeAPI / useFakeDatabase and return either the real source or the fake. The rest of the app is unchanged by the swap — the same screen runs against a live REST API in production and a canned fake in development, selected at startup with no edit to any screen.
                        """
                    )
                }
            }
        }
    }

    // MARK: - 6. What you get

    private struct WhatYouGetSection: View {
        var body: some View {
            SectionWrapper("What you get") {
                ContentGroup("Three wins, each a direct consequence of the rule") {
                    TextBlock(
                        """
                        • Testability — every layer is testable in isolation. The repository is exercised against FakeApiService and FakeAppDatabase with no network and no UI; the use case is a pure delegation you can call in one line; the ViewModel is driven against a fake use case. No layer needs the others mounted to be tested.
                        """
                    )
                    TextBlock(
                        """
                        • Swappability — because UI depends on the contract, not the implementation, the same screen runs against the real REST API and Core Data in production and against fakes in development, selected by a single config flag at startup. The screen never changes; the wiring in the container does.
                        """
                    )
                    TextBlock(
                        """
                        • Framework isolation — URLSession, Core Data, and UIKit each appear in exactly one layer. If the HTTP layer is rebuilt on a different transport, or Core Data is replaced by a different store, the blast radius is a single data file. The domain rules and the UI do not move, because they never knew the framework's name.
                        """
                    )
                }
            }
        }
    }
}

#Preview {
    ArchitectureView(viewModel: Container.shared.architectureViewModel())
        .environmentObject(DesignSystem(colorScheme: ColorScheme(.light)))
        .environmentObject(ThemeManager())
        .environmentObject(DrawerState())
}
