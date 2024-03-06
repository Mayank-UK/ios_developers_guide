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
        case restApi
        case deployment
        case packageManager
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
            case .swiftFundamentals:
                SwiftFundamentalsView()
            case .swiftUi:
                SwiftUiView()
            case .uiKit:
                UiKitView()
            case .restApi:
                RestApiView()
            case .deployment:
                DeploymentView()
            case .packageManager:
                PackageManagerView()
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
