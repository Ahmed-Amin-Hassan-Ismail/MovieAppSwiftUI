//
//  DetailViewSection.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 30/04/2023.
//

import Foundation



enum DetailViewSection {
    
    case about
    case review
    
    
    var title: String {
        switch self {
        case .about:
            return "About Movie"
        case .review:
            return "Reviews"
        }
    }
}
