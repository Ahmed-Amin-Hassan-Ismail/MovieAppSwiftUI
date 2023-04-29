//
//  MovieCardType.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 29/04/2023.
//

import Foundation


enum MovieCardType {
    case poster
    case grid
    
    
    var widthPercent: Double {
        switch self {
        case .poster:
            return 0.40
        case .grid:
            return 0.30
        }
    }
    
    var heightPercent: Double {
        switch self {
        case .poster:
            return 0.25
        case .grid:
            return 0.20
        }
    }
}
