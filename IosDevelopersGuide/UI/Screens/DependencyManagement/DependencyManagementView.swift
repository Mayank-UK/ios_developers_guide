//
//  PackageManager.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct DependencyManagementView: View {
    // inject the viewModel from route
    @StateObject var viewModel: DependencyManagementViewModel
    
    func swiftPackageManager() -> some View {
        return CustomSection(
            snippetTitle: "Swift Package Manager",
            snippetDescription: """
            Swift Package Manager is the recommended way to manage third-party libraries in Swift projects. It integrates well with Xcode and SwiftUI.

            Adding a Package Using SPM in Xcode:
            
            1) Open Xcode and your project.
            2) Select your project in the Project Navigator.
            3) Go to the "Package Dependencies" tab.
            4) Click the "+" button to add a new package.
            5) Enter the URL of the Swift package repository and select the version or branch you want to use.
            6) Add the package to your project, and Xcode will handle the integration.
            """
        )
    }
    
    func cocoaPods() -> some View {
        return CustomSection(
            snippetTitle: "CocoaPods",
            snippetDescription: """
            While Swift Package Manager is preferred for SwiftUI projects, CocoaPods can still be used for adding libraries, especially if they don’t support SPM.
            
            Adding a Pod to Your Project:
            
            1) Install CocoaPods if you haven’t already.
            2) Navigate to your project directory in Terminal.
            3) Create a Podfile if it doesn’t exist.
            4) Edit the Podfile to include the pods you want.
            5) Install the pods.
            6) Open the .xcworkspace file created by CocoaPods to continue working on your project.
            """
        )
    }
    
    func carthage() -> some View {
        return CustomSection(
            snippetTitle: "Carthage",
            snippetDescription: """
            Carthage is another dependency manager that can be used, although it’s less common now compared to SPM.
            
            Adding a Library Using Carthage:
            
            1) Install Carthage if you haven’t already.
            2) Create a Cartfile in your project directory and specify the libraries.
            3) Run Carthage to fetch and build the libraries.
            4) Add the built frameworks to your Xcode project.
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Package manager",
            content: {
                swiftPackageManager()
                cocoaPods()
                carthage()
            }
        )
    }
}

//#Preview {
//    DependencyManagementView()
//}
