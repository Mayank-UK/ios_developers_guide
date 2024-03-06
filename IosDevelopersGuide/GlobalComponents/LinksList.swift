//
//  LinksList.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct LinksList: View {
    @EnvironmentObject var router: Router
    
    let links: [LinkData]
    
    func onTapLink(routePath: Router.routePaths) -> Void {
        router.navigateTo(routePath: routePath)
    }
    
    var body: some View {

            
    List(links) { link in
        Text(link.title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 22))
            .padding(.vertical, 16)
            .padding(.leading, 16)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(8)
            .onTapGesture {
                self.onTapLink(routePath: link.routePath)
            }
        }
        .listStyle(PlainListStyle())
    }
}

