//
//  DetailMovieViewModel.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 30/04/2023.
//

import Foundation


@MainActor
class DetailMovieViewModel: ObservableObject {
    
    //MARK: - Properties
    
    @Published var selectedSection: DetailViewSection = .about
    @Published var reviews: [Review] = []
    
    let movie: Movie
    let sections: [DetailViewSection] = [.about, .review]
    private let movieService = MovieService()
    
    //MARK: - Init
    
    init(movie: Movie) {
        
        self.movie = movie
    }
    
    func fetchReview() async {
        do {
            let apiconstructor = ApiConstructor(endPoint: .movieReviews(movie.id ))
            let response: ReviewResponse = try await movieService.fetchData(api: apiconstructor)
            reviews = response.results
            
        } catch {
            print("Error: \(error)")
        }
    }
}
