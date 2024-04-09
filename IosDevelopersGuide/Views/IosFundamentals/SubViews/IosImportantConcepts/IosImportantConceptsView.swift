//
//  IosImportantConcepts.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct IosImportantConceptsView: View {
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
    
    var body: some View {
        PageScaffold(
            pageTitle: "IOS important concepts",
            content: {
                importantConcepts()
            }
        )
    }
}

#Preview {
    IosImportantConceptsView()
}
