//
//  SwiftUiResponsive.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 07/03/24.
//

import SwiftUI

struct SwiftUiResponsiveDesignView: View {
    // inject the viewModel from route
    @StateObject var viewModel: SwiftUiResponsiveDesignViewModel
    
    @EnvironmentObject var screenData: ScreenData
    
    func sizeClasses() -> some View {
        return CustomSection(
            snippetTitle: "Size classes",
            snippetDescription: """
            Responsive UI is made in swiftUI based on size classes, there are only two size classes compact and regular.
            For example size classes of few devices are:
            
            -11” iPad Pro :
            Portrait : Regular width, regular height
            Landscape : Regular width, regular height
            
            -iPhone 15 :
            Portrait : Compact width, regular height
            Landscape : Compact width, compact height
            
            On iPad, size classes also apply when your app or game runs in a multitasking/split-view configuration.
            
            Add responsiveness based on wheather width is compact or regular.
            """,
            snippetCode: """
            
            """,
            demoView: {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Height : ")
                        Text(screenData.isCompactHeight ? "Compact": "Regular")
                            .bold()
                            
                    }
                    Spacer()
                    HStack {
                        Text("Width : ")
                        Text(screenData.isCompactWidth ? "Compact": "Regular")
                            .bold()
                            
                    }
                    
                }
                    .padding()
            }
        )
    }
    
    var body: some View {
        PageScaffold(
            pageTitle: "Responsive design",
            content: {
                sizeClasses()
            }
        )
    }
}

//#Preview {
////    @EnvironmentObject var screenData: ScreenData
//    
//    SwiftUiResponsiveDesignView()
////        .environmentObject(screenData)
//            .environmentObject(ScreenData())
//}
