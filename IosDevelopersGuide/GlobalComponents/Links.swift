//
//  LinksList.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import SwiftUI

struct Links: View {
    @EnvironmentObject var router: Router
    
    let links: [LinkData]
    
    func onTapLink(routePath: Router.routePaths) -> Void {
        router.navigateTo(routePath: routePath)
    }
    
    var body: some View {
        LazyVStack(spacing: 16) {
            ForEach(links, id: \.self) { link in
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
        }
        .padding()
    }
}

