//
//  Image.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 27/04/2023.
//

import SwiftUI

extension Image {
    
    
    static var BackIcon: Image {
        Image ("BackIcon")
    }
    static var BookmarkIcon: Image {
        Image( "BookmarkIcon" )
    }
    
    static var CalendarIcon: Image {
        Image("CalendarIcon")
    }
    
    static var ClockIcon: Image {
        Image("ClockIcon")
    }
    
    static var GenreIcon: Image {
        Image("GenreIcon")
    }
    
    static var SearchIcon: Image {
        Image("SearchIcon" )
    }
    
    static var CancelIcon: Image {
        Image(systemName: "xmark.circle.fill")
    }
}
