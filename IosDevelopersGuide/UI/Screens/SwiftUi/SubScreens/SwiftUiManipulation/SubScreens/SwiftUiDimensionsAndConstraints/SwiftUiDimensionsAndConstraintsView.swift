//
//  UiManipulationDimensionsAndConstraints.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiDimensionsAndConstraintsView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiDimensionsAndConstraintsViewModel
    
    @EnvironmentObject var screenData: ScreenData
    
    func fixedDimensions() -> some View {
        return CustomSection(
            snippetTitle: "Fixed dimensions",
            snippetDescription: """
            Give the fixed dimensions to a UI element.
            """,
            snippetCode: """
            Rectangle()
                .frame(width: 128, height: 64)
            """,
            demoView: {
                Rectangle()
                    .frame(width: 128, height: 64)
            }
        )
    }
    
    func minDimensions() -> some View {
        return CustomSection(
            snippetTitle: "Minimum dimensions",
            snippetDescription: """
            Give the minimum dimensions to a UI element that it can take, it won't go lower than that.
            The UI element will take the maximum available width but will take minimum specified height.
            """,
            snippetCode: """
            Rectangle()
                .frame(minWidth: 64, minHeight: 64)
            """,
                demoView: {
                    Rectangle()
                        .frame(minWidth: 64, minHeight: 64)
            }
        )
    }
    
    func maxDimensions() -> some View {
        return CustomSection(
            snippetTitle: "Maximum dimensions",
            snippetDescription: """
            Give the maximum dimensions to a UI element that it can take, it won't go higher than that.
            The UI element will take the maximum specified width but will take auto height.
            """,
            snippetCode: """
            Rectangle()
                .frame(maxWidth: 128, maxHeight: 128)
            """,
            demoView: {
                Rectangle()
                    .frame(maxWidth: 128, maxHeight: 128)
            }
        )
    }
    
    func percentDimensionsBasedOnParent() -> some View {
        return CustomSection(
            snippetTitle: "Percentage dimensions based on parent",
            snippetDescription: """
            Give the percent dimensions to a UI element based on it's parent dimensions.
            GeometryReader takes all available space by default.
            """,
            snippetCode: """
            VStack{
                GeometryReader { geometry in
                    Rectangle()
                        .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.5)
                        
                }
            }
                .frame(width: 128, height: 64)
                .background(.red)
            """,
            demoView: {
                VStack{
                    GeometryReader { geometry in
                        Rectangle()
                            .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.5)
                    }
                }
                    .frame(width: 128, height: 64)
                    .background(.red)
            }
        )
    }
    
    func percentDimensionsBasedOnScreen() -> some View {
        return CustomSection(
            snippetTitle: "Percentage dimensions based on screen",
            snippetDescription: """
            Give the percent dimensions to a UI element based on page/screen dimensions.
            Use the GeometryReader at the top most level to get the dimensions of the screen.
            """,
            snippetCode: """
            import SwiftUI
            import Foundation

            class ScreenData: ObservableObject {
                @Published var height: CGFloat = 0
                @Published var width: CGFloat = 0
            }

            struct RootView<InitialView: View>: View {
                @Environment(\\.verticalSizeClass) var verticalSizeClass
                @Environment(\\.horizontalSizeClass) var horizontalSizeClass
                
                @StateObject var screenData: ScreenData = ScreenData()
                @StateObject var router: Router = Router()
                @StateObject var apiService: ApiService = ApiService()
                    
                private let initialView: InitialView
                
                init(@ViewBuilder content: @escaping () -> InitialView) {
                    self.initialView = content()
                }
                
                var body: some View {
                    GeometryReader { geometry in
                        NavigationStack(path: $router.navigationStack) {
                            initialView
                                .navigationDestination(for: Router.routePaths.self) { route in
                                router.view(for: route)
                            }
                                
                        }
                            .preference(key: SizePreferenceKey.self, value: geometry.size)
                            .onPreferenceChange(SizePreferenceKey.self) { newSize in
                                screenData.height = newSize.height
                                screenData.width = newSize.width
                                
                                screenData.isCompactHeight = verticalSizeClass == .compact
                                screenData.isCompactWidth = horizontalSizeClass == .compact
                            }
                    }
                        
                        .environmentObject(screenData)
                        .environmentObject(router)
                        .environmentObject(apiService)
                }
            }

            struct SizePreferenceKey: PreferenceKey {
                static var defaultValue: CGSize = CGSize.init(width: 1, height: 1)

                static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
                    value = nextValue()
                }
            }
            
            //  then use in some view like this
            Rectangle()
                .frame(width: screenData.width, height: screenData.height)
            """,
            demoView: {
                Rectangle()
                    .frame(width: screenData.width * 0.5, height: screenData.height * 0.5)
            }
        )
    }

    var body: some View {
        PageScaffold(
            pageTitle: "Dimensions and constraints",
            content: {
                fixedDimensions()
                minDimensions()
                maxDimensions()
                percentDimensionsBasedOnParent()
                percentDimensionsBasedOnScreen()
            }
        )
    }
}
