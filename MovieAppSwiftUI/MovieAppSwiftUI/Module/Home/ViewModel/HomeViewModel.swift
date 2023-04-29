//
//  HomeViewModel.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 29/04/2023.
//

import Foundation


@MainActor
class HomeViewModel: ObservableObject {
    
    //MARK: - Properties
    
    @Published private(set) var topRatedMovies: [Movie] = []
    @Published private(set) var trendingMovies: [Movie] = []
    @Published private(set) var errorMessage: String = ""
    
    private let movieService = MovieService()
    
    
    //MARK: - Api Calling
    
    func fetchTopRatedMovies() async {
        do {
            let apiConstructor = ApiConstructor(endPoint: .topRated)
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: apiConstructor)
            topRatedMovies = movieApiResponse.results
            
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
    
    func fetchTrendingMovies() async {
        do {
            let apiConstractor = ApiConstructor(endPoint: .trending)
            let moviewApiResponse: MovieResponse = try await movieService.fetchData(api: apiConstractor)
            trendingMovies = moviewApiResponse.results
            
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
}
