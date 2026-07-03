//
//  SwiftUiWidgetView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 29/08/24.
//

import Foundation
import SwiftUI

struct SwiftUiWidgetView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiWidgetViewModel
    
    func basics() -> some View {
        return CustomSection(
            snippetTitle: "Basics",
            snippetDescription: """
            Shows widgets on home screen.
            
            Creating a widget in ios is very simple, most of the files are generated and configured by the system.
            
            Create a Widget Extension:
            
            1) Open your Xcode project.
            2) Go to File > New > Target.
            3) Select Widget Extension from the template options.
            4) Click Next, name your widget, and choose your settings.
            5) Click Finish. Xcode will create a new target and a new folder in your project.
            
            Above steps were at the time of development of this app, the steps may change over time.
            
            Make sure that the deployment target is same for both the app and widget, in ios they both can have different targets causing the widgets to not work properly.
            """
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Widgets",
            content: {
                basics()
            }
        )
    }
}

//#Preview {
//    SwiftUiWidgetView()
//}
