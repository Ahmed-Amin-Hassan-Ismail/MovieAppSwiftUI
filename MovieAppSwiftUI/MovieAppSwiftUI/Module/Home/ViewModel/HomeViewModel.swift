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
    @Published private(set) var moviesForSelectedGenres: [Movie] = []
    @Published private(set) var genres: [Genre] = []
    @Published var selectedGenre: Genre = DeveloperPreview.instance.genre
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
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: apiConstractor)
            trendingMovies = movieApiResponse.results
            
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
    
    func fetchGenre() async {
        do {
            let apiConstructor = ApiConstructor(endPoint: .genre)
            let genreApiResponse: GenreResponse = try await movieService.fetchData(api: apiConstructor)
            genres = genreApiResponse.genres
            guard let firstGenre = genres.first else { return }
            selectedGenre = firstGenre
            
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
    
    func fetchMoviesForSelectedGenre() async {
        do {
            let apiConstructor = ApiConstructor(endPoint: .discoverMovies,
                                                params: ["with_genres": "\(selectedGenre.id)"])
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: apiConstructor)
            moviesForSelectedGenres = movieApiResponse.results
            
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
}
