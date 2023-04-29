//
//  MovieCard.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 29/04/2023.
//

import SwiftUI

struct MovieCard: View {
    
    //MARK: - Properties
    
    let movie: Movie
    let cardType: MovieCardType
    
    var body: some View {
        CustomImageView(itemWidth: itemWidth,
                        itemHeight: itemHeight,
                        movie: movie)
    }
}

//MARK: - Helper Methods

extension MovieCard {
    var itemWidth: CGFloat {
        return screenWidth * cardType.widthPercent
    }
    
    var itemHeight: CGFloat {
        return screenHeight * cardType.heightPercent
    }
}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard(movie: dev.movie, cardType: .poster )
    }
}
