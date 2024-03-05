//
//  ContentView.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 01/03/24.
//

import SwiftUI

struct HomeView: View {
    //  an @EnvironmentObject allows you to create an object that can be accessed by any view in your app hierarchy
    @EnvironmentObject var router: Router
    
    func linksList() -> some View {
        //  use Identifiable for views that need a stable identity (e.g., list items)
        struct LinkData: Identifiable {
            var id = UUID()
            var title: String
            var routePath: Router.routePaths
        }
        
        let links: [LinkData] = [
            LinkData(title: "Swift fundamentals", routePath: Router.routePaths.swiftFundamentals),
            LinkData(title: "Ios fundamentals", routePath: Router.routePaths.iosFundamentals),
            LinkData(title: "SwiftUI", routePath: Router.routePaths.swiftUi),
            LinkData(title: "UIKit", routePath: Router.routePaths.uiKit),
            LinkData(title: "Pruduction build and deployment", routePath: Router.routePaths.productionBuildAndDeployment),
            LinkData(title: "Third party services", routePath: Router.routePaths.thirdPartyServices),
            LinkData(title: "Best practices", routePath: Router.routePaths.bestPractices),
        ]
        
        func onTapLink(routePath: Router.routePaths) -> Void {
            router.navigateTo(routePath: routePath)
        }
            
        return List(links) { link in
            Link(title: link.title, onTap: {onTapLink(routePath: link.routePath)})
        }
        .listStyle(PlainListStyle())
    }
    
    //  combile all the sub divisions here to complete a screen
    var body: some View {
        PageScaffold(
            isScrollable: false,
            pageTitle: "Ios developer's guide",
            content: {
                Spacer().frame(height: 32)
                linksList()
            }
        )
    }
}
