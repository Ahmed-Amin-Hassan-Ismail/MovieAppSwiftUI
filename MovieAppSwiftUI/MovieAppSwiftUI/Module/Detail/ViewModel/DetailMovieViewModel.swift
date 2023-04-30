//
//  DetailMovieViewModel.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 30/04/2023.
//

import Foundation



class DetailMovieViewModel: ObservableObject {
    
    //MARK: - Properties
    
    let movie: Movie
    let sections: [DetailViewSection] = [.about, .review]
    @Published var selectedSection: DetailViewSection = .about
    
    //MARK: - Init
    
    init(movie: Movie) {
        
        self.movie = movie
    }
}
