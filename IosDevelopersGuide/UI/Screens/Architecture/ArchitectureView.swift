//
//  SwiftUiCodeArchitecture.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI
import FactoryKit

struct ArchitectureView: View {
    // inject the viewModel from route
    @StateObject var viewModel: ArchitectureViewModel
    
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
    
    var body: some View {
        PageScaffold(
            pageTitle: "Architecture",
            content: {
                cleanMvvm()
            }
        )
    }
}

#Preview {
    ArchitectureView(
        viewModel: Container.shared.architectureViewModel()
    )
}
