//
//  MovieService.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 29/04/2023.
//

import Foundation

enum MovieServiceError: Error {
    case invalidResponse
}

struct MovieService {
    
    static func fetchData<T: Decodable>(api: ApiConstructor) async throws -> T {
        
        let url = try DefaultURLBuilder.build(api: api)
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw MovieServiceError.invalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
