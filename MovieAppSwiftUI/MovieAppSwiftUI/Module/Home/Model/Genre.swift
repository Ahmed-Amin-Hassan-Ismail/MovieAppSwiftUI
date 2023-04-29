//
//  Genre.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 29/04/2023.
//

import Foundation



struct GenreResponse: Codable {
    let genre: [Genre]
}

struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}
