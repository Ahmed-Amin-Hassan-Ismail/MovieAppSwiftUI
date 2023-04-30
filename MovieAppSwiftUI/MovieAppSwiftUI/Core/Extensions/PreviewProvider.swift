//
//  PreviewProvider.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 29/04/2023.
//

import SwiftUI


extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        DeveloperPreview.instance
    }
}


class DeveloperPreview {
    
    //MARK: - Singleton Class
    
    static let instance: DeveloperPreview = DeveloperPreview()
    
    private init() { }
    
    let movie = Movie(
        posterPath: "/907gLzmreU@nGkIB6K3BsJbzvNv.jpg",
        adult: false,
        overview: "",
        releaseDate:"",
        genreIDS: [1],
        id: 102,
        originalTitle:"",
        originalLanguage:"",
        title: "The Shawshank Redemption",
        backdropPath: "",
        popularity: 10.0,
        voteCount: 1,
        video: false,
        voteAverage: 10.0
    )
    
    let genre = Genre (
        id: 28,
        name: "Action"
    )
    
    let review = Review(
        author: "Test Author",
        authorDetails: nil,
        content: "Test content",
        createdAt: "2023",
        id: "Test",
        updatedAt: "Test",
        url: "Test"
    )
}
