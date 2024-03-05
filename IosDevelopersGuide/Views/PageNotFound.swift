//
//  PageNotFound.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 01/03/24.
//

import SwiftUI

struct PageNotFound: View {    
    var body: some View {
        PageScaffold(
            isScrollable: true,
            pageTitle: "Page not found",
            content: {
                //  maxHeight: .infinity don't work for some reason inside
                //  height don't work in the same frame modifier, it needs to be provided again in new modifier
                Text("Page not found")
                    .frame(maxWidth: .infinity)
                    .frame(height: 500)
                
            }
        )
    }
}
