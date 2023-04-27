//
//  String.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 27/04/2023.
//

import Foundation


extension String {
    
    var capitalizeFirstLetter: Self { 
        if self.count == 0 { return self }
        return prefix(1).uppercased() + dropFirst()
    }
}
