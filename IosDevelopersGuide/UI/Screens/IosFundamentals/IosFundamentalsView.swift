//
//  IosFundamentals.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI
import FactoryKit

struct IosFundamentalsView: View {
    // inject the viewModel from route
    @StateObject var viewModel: IosFundamentalsViewModel
    
    func importantConcepts() -> some View {
        return CustomSection(
            snippetTitle: "Important concepts",
            snippetDescription: """
            It is a mobile operating system developed by Apple Inc. for its hardware, for example, iPhone and iPad.
            
            It is an operating system that supports the iPhone and iPod Touch; it also provided support for the iPad before introducing iPadOS in 2019.
            
            It is the second most popular mobile operating system globally after Android.
            
            Features of IOS are:
            - Multitasking
            - Simple and beutiful UI
            - Easy to use
            - Notification
            - Hardware features like camera, bluetooth, etc
            - Services like Map, GPS, etc
            - And many many more features
            """
        )
    }
    
    func installationAndSetup() -> some View {
        return CustomSection(
            snippetTitle: "Installation & setup",
            snippetDescription: """
            Installation basically requires installation of xcode. Refer to latest online intallation guide.
            Setup involves setting up xcode for ios development. Refer to latest online resources for setup of ios development.
            """
        )
    }
    
    func development() -> some View {
        return CustomSection(
            snippetTitle: "Development",
            snippetDescription: """
            IOS development can be done in 2 languages:
            1) C# (old way)
            2) Swift (new way, recommended way)
            
            All software development done for apple devices is done using xcode which includes iPhone, macbook, iWatch, apple vision, etc.
                        
            Xcode is an IDE developed by apple specially for apple ecosystem.
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "IOS important concepts",
            content: {
                importantConcepts()
                installationAndSetup()
                development()
            }
        )
    }
}

#Preview {
    IosFundamentalsView(
        viewModel: Container.shared.iosFundamentalsViewModel()
    )
}
