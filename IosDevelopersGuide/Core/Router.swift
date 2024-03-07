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
                IosImportantConcepts()
            case .iosInstallationAndSetup:
                PageNotFound()
            case .iosDevelopment:
                PageNotFound()
            
            case .swiftFundamentals:
                SwiftFundamentalsView()
            case .swiftInstallation:
                PageNotFound()
            case .swiftIntroduction:
                PageNotFound()
            case .swiftVariablesAndConstants:
                PageNotFound()
            case .swiftDataTypes:
                PageNotFound()
            case .swiftInputAndOutput:
                PageNotFound()
            case .swiftExpressionsAndStatements:
                PageNotFound()
            case .swiftComments:
                PageNotFound()
            case .swiftOptionals:
                PageNotFound()
            case .swiftOperators:
                PageNotFound()
            case .swiftControlFlow:
                PageNotFound()
            case .swiftCollections:
                PageNotFound()
            case .swiftFunctions:
                PageNotFound()
            case .swiftOop:
                PageNotFound()
            case .swiftEnumAndStructs:
                PageNotFound()
            case .swiftAdvanced:
            PageNotFound()
            
            case .swiftUi:
                SwiftUiView()
            case .swiftUiManipulation:
                PageNotFound()
            case .swiftUiLifeCycle:
                PageNotFound()
            case .swiftUiNavigationAndRouting:
                PageNotFound()
            case .swiftUiStateManagement:
                PageNotFound()
            case .swiftUiApiHandling:
                PageNotFound()
            case .swiftUiCodeArchitecture:
                PageNotFound()
            case .swiftUiViewCatalog:
                PageNotFound()
            case .swiftUiDebugging:
                PageNotFound()
            case .swiftUiTesting:
                PageNotFound()
            case .swiftUiSuppportingClassesAndEnums:
                PageNotFound()
            case .swiftUiNativeFeaturesHandling:
                PageNotFound()
            case .swiftUiResponsiveDesign:
                PageNotFound()
            case .swiftUiBestPractices:
                PageNotFound()
            
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
                PageNotFound()
            case .deploymentProdBuild:
                PageNotFound()
            
            
            default:
                PageNotFound()
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
