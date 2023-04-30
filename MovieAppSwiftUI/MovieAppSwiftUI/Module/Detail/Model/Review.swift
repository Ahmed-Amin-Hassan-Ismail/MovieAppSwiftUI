//
//  Review.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 01/05/2023.
//

import Foundation


//MARK: - ReviewResponse

struct ReviewResponse: Codable {
    
    let results: [Review]
    
    enum CodingKeys: String, CodingKey {
        
        case results
    }
}

// MARK: - Relview

struct Review: Codable, Identifiable {
    let author: String
    let authorDetails: AuthorDetails?
    let content, createdAt, id, updatedAt: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case author
        case authorDetails = "author_details"
        case content
        case createdAt = "created_at"
        case id
        case updatedAt = "updated_at"
        case url
    }
}

extension Review {
    
    var authorName: String {
        return authorDetails?.authorName ?? author
    }
    
    var authorImage: URL? {
        var image = authorDetails?.avatarPath ?? ""
        if image.starts(with: "/") {
            image = String(image.dropFirst())
        }
        
        return URL(string: image)
    }
}

// MARK: - AuthorDetails

struct AuthorDetails: Codable {
    
    let name, username: String
    let avatarPath: String?
    let rating: Int?
    
    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }
}


extension AuthorDetails {
 
    var authorName: String {
        return name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? username : name
    }
}
