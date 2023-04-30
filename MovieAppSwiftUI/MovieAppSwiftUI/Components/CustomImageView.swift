//
//  CustomImageView.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 29/04/2023.
//

import SwiftUI

struct CustomImageView: View {
    
    //MARK: - Properties
    
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    let movie: Movie
    let imageType: MovieImageType
    
    //MARK: - Body
    
    var body: some View {
        
        AsyncImage(url: movie.getImage(for: imageType)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ZStack {
                Color.AppGrayColor1
                
                Text(movie.title)
                    .poppins(.light)
                    .padding()
            }
        }
        .frame(width: itemWidth, height: itemHeight)
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
    }
}

struct CustomImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageView(itemWidth: 150,
                        itemHeight: 150,
                        movie: dev.movie,
                        imageType: .poster
        )
    }
}
