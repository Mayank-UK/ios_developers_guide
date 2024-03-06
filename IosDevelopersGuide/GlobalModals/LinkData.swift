//
//  LinkData.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import Foundation

//  use Identifiable for views that need a stable identity (e.g., list items)
struct LinkData: Identifiable {
    var id = UUID()
    var title: String
    var routePath: Router.routePaths
}
