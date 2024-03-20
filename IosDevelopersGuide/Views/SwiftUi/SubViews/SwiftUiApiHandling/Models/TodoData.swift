//
//  TodoData.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 20/03/24.
//

import Foundation

struct TodoData: BaseModel, Decodable  {
    var todo: Todo?
    var error: String?
    
    struct Todo: Decodable {
        var userId: String
        var title: String
        var completed: Bool
    }
}
