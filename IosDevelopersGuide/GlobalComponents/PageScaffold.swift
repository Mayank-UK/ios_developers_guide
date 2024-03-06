//
//  PageScaffold.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 05/03/24.
//

import SwiftUI

struct PageScaffold<Content: View>: View {
    var isScrollable: Bool = true
    let pageTitle: String
    private let children: Content
    
    init(isScrollable: Bool, pageTitle: String, @ViewBuilder content: @escaping () -> Content) {
        self.children = content()
        self.pageTitle = pageTitle
        self.isScrollable = isScrollable
    }
    
    var body: some View {
        //  use Group to combine 
        Group {
            if isScrollable {
                ScrollView(.vertical){
                    children
                }
            } else {
                VStack {
                    children
                }
            }
        }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Text(pageTitle)
                        .bold()
                        .font(.system(size: 28))
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
        
    }
}
