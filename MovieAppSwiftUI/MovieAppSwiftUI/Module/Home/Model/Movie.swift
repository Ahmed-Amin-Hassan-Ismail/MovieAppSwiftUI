//
//  Movie.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 29/04/2023.
//

import Foundation


struct MovieResponse: Codable {
    
    let page: Int
    let results: [Movie]
    let totalResults, totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
        
    }
}

// MARK: - Movie

struct Movie: Codable, Identifiable {
    
    let posterPath: String?
    let adult: Bool
    let overview: String
    let releaseDate: String?
    let genreIDS: [Int]
    let id: Int
    let originalTitle: String
    let originalLanguage: String
    let title: String
    let backdropPath: String?
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        
        case posterPath = "poster_path"
        case adult , overview
        case releaseDate = "release_date"
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
    }
}


extension Movie {
    
    func getImage(for type: MovieImageType) -> URL? {
        switch type {
        case .poster:
            return URL(string: Constants.imageBaseUrl + posterPath.stringValue)
        case .backdrop:
            return URL(string: Constants.imageBaseUrl + backdropPath.stringValue)
        }
    }
}
