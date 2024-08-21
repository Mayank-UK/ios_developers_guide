//
//  TodoData.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 20/03/24.
//

import Foundation

struct TodoData: BaseModel, Decodable {
    var userId: Int?
    var title: String?
    var completed: Bool?
    var id: Int?
    var error: String?
}
