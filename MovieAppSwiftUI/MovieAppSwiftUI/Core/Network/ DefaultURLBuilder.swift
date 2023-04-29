//
//   DefaultURLBuilder.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 29/04/2023.
//

import Foundation


enum DefaultURLBuilderError: Error {
    case invalidPath
    case invalidUrl
}


enum DefaultURLBuilder {
    
    static func build(api: ApiConstructor) throws -> URL {
        
        guard var urlComponents = URLComponents(string: api.endPoint.fullPath) else {
            throw DefaultURLBuilderError.invalidPath
        }
        
        urlComponents.queryItems = try  buildQueryParams(api.params, ["api_key": Constants.apiKey])
        
        guard let url = urlComponents.url else {
            throw DefaultURLBuilderError.invalidUrl
        }
        
        return url
    }
    
    static func buildQueryParams(_ params: Parameters...) throws -> [URLQueryItem] {
        
        return params.flatMap { $0 }.map({ URLQueryItem(name: $0.key, value: $0.value) })
    }
}
