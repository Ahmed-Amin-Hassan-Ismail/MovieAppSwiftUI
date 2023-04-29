//
//  GenreSegmentView.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 29/04/2023.
//

import SwiftUI

struct GenreSegmentView: View {
    
    //MARK: - Properties
    
    let genre: Genre
    let nameSapce: Namespace.ID
    @Binding var selectedGenre: Genre
    
    var body: some View {
        Text(genre.name)
            .poppins(genre.id == selectedGenre.id ? .bold : .medium, 18.0)
            .background(
                ZStack {
                    if genre.id == selectedGenre.id {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(Color.AppGrayColor1)
                            .frame(height: 3.0)
                            .offset(y: 20)
                            .matchedGeometryEffect(id: "GenreSegmentView", in: nameSapce)
                        
                    }
                }
            )
            .padding()
    }
}

struct GenreSegmentView_Previews: PreviewProvider {
    static var previews: some View {
        GenreSegmentView(genre: dev.genre, nameSapce: Namespace().wrappedValue, selectedGenre: .constant(dev.genre))
    }
}
