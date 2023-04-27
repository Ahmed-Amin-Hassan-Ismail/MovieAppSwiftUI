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
    
    //MARK: - Body
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading) {
                
                headerText
                
                SearchBar(searchText: $searchText)
            }
            
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
