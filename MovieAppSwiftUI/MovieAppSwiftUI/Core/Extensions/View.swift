//
//  View.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 27/04/2023.
//

import SwiftUI


extension View {
    
    func poppins(_ font: Poppins, _ size: CGFloat = 14.0) -> some View{
        
        self.font(.custom(font.fontName, size: size))
    }
}
