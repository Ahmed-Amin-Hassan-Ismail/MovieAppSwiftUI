//
//  EndPoint.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 29/04/2023.
//

import Foundation


enum EndPoint {
    case trending
    case topRated
    case genre
    case movieReviews(_ movieId: Int)
    
    
  private var path: String {
        switch self {
        case .trending:
            return "/3/trending/movie/week"
        case .topRated:
            return "/3/movie/top_rated"
        case .genre:
            return "/3/genre/movie/list"
        case .movieReviews(let movieId):
            return "/3/movie/\(movieId)reviews"
        }
    }
    
    var fullPath: String {
        Constants.apiBaseUrl + path
    }
}
