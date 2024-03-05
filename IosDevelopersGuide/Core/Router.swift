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
        case swiftFundamentals
        case iosFundamentals
        case swiftUi
        case uiKit
        case productionBuildAndDeployment
        case thirdPartyServices
        case bestPractices
    }
    
    // used to programatically control our navigation stack
    // whenever an ObservableObject with a property marked @Published is changed, all views using that object will be reloaded to reflect those changes
    @Published var navigationStack: NavigationPath = NavigationPath()
    
    // builds the views
    @ViewBuilder func view(for route: routePaths) -> some View {
        switch route {
            case .home:
                HomeView()
//            case .swiftFundamentals:
//                _View()
//            case .iosFundamentals:
//                _View()
//            case .swiftUi:
//                _View()
//            case .uiKit:
//                _View()
//            case .productionBuildAndDeployment:
//                _View()
//            case .thirdPartyServices:
//                _View()
//            case .bestPractices:
//                _View()
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
