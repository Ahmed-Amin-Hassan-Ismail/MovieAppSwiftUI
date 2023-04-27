//
//  Poppins.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 27/04/2023.
//

import Foundation



enum Poppins: String {
    
    case black
    case bold
    case extraBold
    case extraLight
    case light
    case medium
    case regular
    case semiBold
    case thin
    
    
    var fontName: String {
        return "Poppins-\(self.rawValue.capitalized)"
    }
}
