//
//  Optional.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 27/04/2023.
//

import Foundation


extension Optional where Wrapped == String {
    
    var stringValue: String {
        guard let self = self else { return "" }
        return self
    }
}
