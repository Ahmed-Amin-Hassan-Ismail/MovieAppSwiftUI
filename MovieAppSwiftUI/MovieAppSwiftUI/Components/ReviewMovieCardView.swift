//
//  ReviewMovieCardView.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 01/05/2023.
//

import SwiftUI

struct ReviewMovieCardView: View {
    
    //MARK: - Properties
    
    let review: Review
    
    //MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                    AsyncImage(url: review.authorImage) { image in
                        image
                            .resizable()
                    } placeholder: {
                        ZStack {
                            Color.AppGrayColor1
                            
                            if let firstChar = review.authorName.first {
                                Text(String(firstChar))
                            }
                        }
                    }
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                    
                    Text(review.authorName)
                        .poppins(.medium, 16.0)
            }
            
            Text(review.content)
                .poppins(.light, 16.0)
                .lineLimit(2)
            
            Divider()
        }
    }
}

struct ReviewMovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewMovieCardView(review: dev.review)
    }
}
