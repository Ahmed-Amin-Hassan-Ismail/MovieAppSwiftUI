//
//  HomeView.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 27/04/2023.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Properties
    
    @State private var searchText: String = ""
    @StateObject private var homeViewModel = HomeViewModel()
    @Namespace private var namespace
    
    //MARK: - Body
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading) {
                
                headerText
                
                SearchBar(searchText: $searchText)
                
                trendingMoviesView
                
                moviesSections
                
                moviesDiscovery
                
            }
            
        }
        .task {
            await homeViewModel.fetchTrendingMovies()
            await homeViewModel.fetchTopRatedMovies()
            await homeViewModel.fetchGenre()
        }
        .padding()
        .background(Color.AppBackgroundColor)
    }
}


//MARK: - Body View

extension HomeView {
    
    private var headerText: some View {
        Text("What do you want to watch ?")
            .poppins(.bold, 20.0)
    }
    
    private var trendingMoviesView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(homeViewModel.trendingMovies) { movie in
                    MovieCard(movie: movie, cardType: .poster )
                }
            }
        }
    }
    
    private var moviesSections: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(homeViewModel.genres) { genre in
                    GenreSegmentView(genre: genre, nameSapce: namespace, selectedGenre: $homeViewModel.selectedGenre)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                homeViewModel.selectedGenre = genre
                                Task {
                                    await homeViewModel.fetchMoviesForSelectedGenre()
                                }
                            }
                        }
                }
            }
        }
    }
    
    private var moviesDiscovery: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
            ForEach(homeViewModel.topRatedMovies) { movie in
                MovieCard(movie: movie, cardType: .grid)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
