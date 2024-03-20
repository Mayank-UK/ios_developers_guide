//
//  ApiService.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 01/03/24.
//

import Foundation

class ApiService: ObservableObject {
    func getRequest() async throws -> UserData {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            fatalError("Invalid URL")
        }
        
        var userData = UserData()
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let users = try JSONDecoder().decode([UserData.User].self, from: data)
            userData.users = users
        } catch {
            userData.error = "\(error)"
        }
        
        return userData
    }
    
    func postRequest(userId: String, title: String, completed: Bool) async throws -> TodoData {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            fatalError("Invalid URL")
        }
        
        let body = """
        {
            "userId": \(userId),
            "title": \(title),
            "completed": \(completed)
        }
        """
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body.data(using: .utf8)

        var todoData = TodoData()
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            todoData = try JSONDecoder().decode(TodoData.self, from: data)
            
            let responseBody = String(data: data, encoding: .utf8) ?? ""
            print(responseBody)
        } catch {
            todoData.error = "\(error)"
        }
        
        return todoData
    }
}
