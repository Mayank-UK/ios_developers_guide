//
//  LinkData.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 06/03/24.
//

import Foundation

//  use Identifiable for views that need a stable identity (e.g., list items)
//  use Hashable when you need efficient hashing and equality checks for non-view types
struct LinkData: Hashable {
    var id = UUID()
    var title: String
    var routePath: Router.routePaths
    // One-line description shown beneath the title on a navigation card. Defaults
    // to empty so screens that don't supply copy (Phase 3 scope) still compile;
    // the home screen always sets it.
    var description: String = ""
}
