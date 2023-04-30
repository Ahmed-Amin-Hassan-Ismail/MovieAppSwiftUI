//
//  DetailMovieView.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 30/04/2023.
//

import SwiftUI

struct DetailMovieView: View {
    
    //MARK: - Properties
    
    @StateObject private var detailMovieViewModel: DetailMovieViewModel
    @Environment(\.dismiss) var dismiss
    @Namespace var namespace
    
    
    //MARK: - Init
    
    init(movie: Movie) {
        _detailMovieViewModel = StateObject(wrappedValue: DetailMovieViewModel(movie: movie))
    }
    
    var body: some View {
        VStack {

            headerView
            
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading) {
                    
                    imageView
                    
                    movieTimeDetails
                    
                    detailSection
                    
                    switch detailMovieViewModel.selectedSection {
                    case .about:
                        Text(detailMovieViewModel.movie.overview)
                            .offset(y: 130)
                            .padding()
                    case .review:
                        ForEach(detailMovieViewModel.reviews) { review in
                            ReviewMovieCardView(review: review)
                                .offset(y: 130)
                                .padding()
                        }
                    }
                        
                }
            }
        }
        .task {
           await detailMovieViewModel.fetchReview()
        }
        .background(Color.AppBackgroundColor)
    }
}

//MARK: - Helper Methods

extension DetailMovieView {
    
    private var posterImageHeight: CGFloat {
        return screenHeight * 0.35
    }
    
    private var backdropImageSize: CGFloat {
        return screenHeight * 0.20
    }
    
    private var backdropImageOffset: CGFloat {
        return screenHeight * 0.18
    }
}

//MARK: - Views

extension DetailMovieView {
    
    private var headerView: some View {
        HStack {
            Image.BackIcon
                .onTapGesture {
                    dismiss()
                }
            
            Spacer()
            
            Text("Detail")
                .poppins(.medium, 18.0)
            
            Spacer()
            
            Image.BookmarkIcon
        }
        .padding(.horizontal)
    }
    
    private var imageView: some View {
        ZStack(alignment: .leading) {
            CustomImageView(itemWidth: screenWidth,
                            itemHeight: posterImageHeight,
                            movie: detailMovieViewModel.movie,
                            imageType: .poster)
            
            HStack {
                CustomImageView(itemWidth: backdropImageSize,
                                itemHeight: backdropImageSize,
                                movie: detailMovieViewModel.movie,
                                imageType: .backdrop)
                
                Text(detailMovieViewModel.movie.title)
                    .minimumScaleFactor(0.5)
                    .offset(y : 25)
            }
            .padding(.leading, 30)
            .offset(y: backdropImageOffset)
        }
    }
    
    private var movieTimeDetails: some View {
        HStack {
            Image.CalendarIcon
            Text(detailMovieViewModel.movie.releaseDate.stringValue)
            Text(" | ")
            Image.ClockIcon
            Text("148 Minutes")
            Text(" | ")
            Image.GenreIcon
            Text("Action")
        }
        .poppins(.regular, 10)
        .foregroundColor(Color.AppGrayColor2)
        .offset(y: 110)
        .padding(.horizontal)        
    }
    
    private var detailSection: some View {
            HStack(spacing: 30) {
                ForEach(detailMovieViewModel.sections, id: \.self) { section in
                    DetailSegmentSectionView(section: section,
                                             namespace: namespace,
                                             selectedSection: $detailMovieViewModel.selectedSection)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            detailMovieViewModel.selectedSection = section
                        }
                    }
                }
            }
            .padding(.horizontal, 30)
            .offset(y: 130)
    }
}

struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView(movie: dev.movie)
            .preferredColorScheme(.dark)
    }
}
