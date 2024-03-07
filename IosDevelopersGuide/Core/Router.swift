//
//  Router.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 01/03/24.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    // route paths
    enum routePaths: Hashable {
        case home
        
        case iosFundamentals
        case iosImportantConcepts
        case iosInstallationAndSetup
        case iosDevelopment
        
        case swiftFundamentals
        case swiftInstallation
        case swiftIntroduction
        case swiftVariablesAndConstants
        case swiftDataTypes
        case swiftInputAndOutput
        case swiftExpressionsAndStatements
        case swiftComments
        case swiftOptionals
        case swiftOperators
        case swiftControlFlow
        case swiftCollections
        case swiftFunctions
        case swiftOop
        case swiftEnumAndStructs
        case swiftAdvanced
        
        case swiftUi
        case swiftUiManipulation
        case swiftUiLifeCycle
        case swiftUiNavigationAndRouting
        case swiftUiStateManagement
        case swiftUiApiHandling
        case swiftUiCodeArchitecture
        case swiftUiViewCatalog
        case swiftUiDebugging
        case swiftUiTesting
        case swiftUiSuppportingClassesAndEnums
        case swiftUiNativeFeaturesHandling
        case swiftUiResponsiveDesign
        case swiftUiBestPractices
        
        case uiKit
        
        case restApi
        
        case packageManager
        
        case deployment
        case deploymentTestBuild
        case deploymentProdBuild
        
        case _temp
    }
    
    // used to programatically control our navigation stack
    // whenever an ObservableObject with a property marked @Published is changed, all views using that object will be reloaded to reflect those changes
    @Published var navigationStack: NavigationPath = NavigationPath()
    
    // builds the views
    @ViewBuilder func view(for route: routePaths) -> some View {
        switch route {
            case .home:
                HomeView()
            
            case .iosFundamentals:
                IosFundamentalsView()
            case .iosImportantConcepts:
                IosImportantConceptsView()
            case .iosInstallationAndSetup:
                PageNotFoundView()
            case .iosDevelopment:
                PageNotFoundView()
            
            case .swiftFundamentals:
                SwiftFundamentalsView()
            case .swiftInstallation:
                PageNotFoundView()
            case .swiftIntroduction:
                PageNotFoundView()
            case .swiftVariablesAndConstants:
                PageNotFoundView()
            case .swiftDataTypes:
                PageNotFoundView()
            case .swiftInputAndOutput:
                PageNotFoundView()
            case .swiftExpressionsAndStatements:
                PageNotFoundView()
            case .swiftComments:
                PageNotFoundView()
            case .swiftOptionals:
                PageNotFoundView()
            case .swiftOperators:
                PageNotFoundView()
            case .swiftControlFlow:
                PageNotFoundView()
            case .swiftCollections:
                PageNotFoundView()
            case .swiftFunctions:
                PageNotFoundView()
            case .swiftOop:
                PageNotFoundView()
            case .swiftEnumAndStructs:
                PageNotFoundView()
            case .swiftAdvanced:
            PageNotFoundView()
            
            case .swiftUi:
                SwiftUiView()
            case .swiftUiManipulation:
                PageNotFoundView()
            case .swiftUiLifeCycle:
                PageNotFoundView()
            case .swiftUiNavigationAndRouting:
                PageNotFoundView()
            case .swiftUiStateManagement:
                PageNotFoundView()
            case .swiftUiApiHandling:
                PageNotFoundView()
            case .swiftUiCodeArchitecture:
                PageNotFoundView()
            case .swiftUiViewCatalog:
                PageNotFoundView()
            case .swiftUiDebugging:
                PageNotFoundView()
            case .swiftUiTesting:
                PageNotFoundView()
            case .swiftUiSuppportingClassesAndEnums:
                PageNotFoundView()
            case .swiftUiNativeFeaturesHandling:
                PageNotFoundView()
            case .swiftUiResponsiveDesign:
                PageNotFoundView()
            case .swiftUiBestPractices:
                PageNotFoundView()
            
            case .uiKit:
                UiKitView()
//            case ._:
//                PageNotFound()
            
            case .restApi:
                RestApiView()
//            case ._:
//                PageNotFound()
            
            case .packageManager:
                PackageManagerView()
//            case ._:
//                PageNotFound()
            
            case .deployment:
                DeploymentView()
            case .deploymentTestBuild:
                PageNotFoundView()
            case .deploymentProdBuild:
                PageNotFoundView()
            
            
            default:
                PageNotFoundView()
        }
    }
    
    // methods to push and pop views in navigation stack
    func navigateTo(routePath: routePaths) {
        navigationStack.append(routePath)
    }
    
    func navigateBack() {
        navigationStack.removeLast()
    }
    
    func popToRoot() {
        navigationStack.removeLast(navigationStack.count)
    }
}
