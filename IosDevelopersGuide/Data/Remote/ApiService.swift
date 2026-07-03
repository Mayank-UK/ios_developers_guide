//
//  ApiService.swift
//  IosDevelopersGuide
//
//  Created by Mayank Upadhyay on 22/08/24.
//

import Foundation

enum ErrorTypes: Error, LocalizedError {
    case networkError(URLError)
    case decodingError(DecodingError)
    case databaseError(Error)
    case unknownError(Error)
    
    var errorDescription: String? {
        switch self {
        case .networkError(let urlError):
            return "Network error occurred: \(urlError.localizedDescription)"
        case .decodingError(let decodingError):
            return "Failed to decode data: \(decodingError.localizedDescription)"
        case .databaseError(let dbError):
            return "Database error: \(dbError.localizedDescription)"
        case .unknownError(let error):
            return "An unknown error occurred: \(error.localizedDescription)"
        }
    }
}


protocol APIServiceProtocol {
    func fetchPosts() async throws -> [PostDTO]
}

class APIService: APIServiceProtocol {    
    // Generic method for making network requests
    private func fetchData<T: Decodable>(from urlString: String, type: T.Type) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkException("Invalid URL", context: urlString)
        }

        return try await guardedApiCall {
            // UNCOMMENT ONE OF THESE TO TEST ERROR SCENARIOS:
//             throw ErrorTestingHelper.simulateNetworkTimeout()
            //  throw ErrorTestingHelper.simulateNoConnection()
            // throw ErrorTestingHelper.simulateServerError()

            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(T.self, from: data)
        }
    }

    // Fetch posts method using the generic fetchData
    func fetchPosts() async throws -> [PostDTO] {
        return try await fetchData(from: "https://jsonplaceholder.typicode.com/posts", type: [PostDTO].self)
    }
}

