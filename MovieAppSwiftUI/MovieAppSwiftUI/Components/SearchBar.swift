//
//  SearchBar.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 27/04/2023.
//

import SwiftUI

struct SearchBar: View {
    
    //MARK: - properties
    
    @Binding var searchText: String
    
    //MARK: - Body
    
    var body: some View {
        TextField("Search", text: $searchText)
            .foregroundColor(Color.AppGrayColor2)
            .padding()
            .overlay(
                ZStack {
                    Image.CancelIcon
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                            UIApplication.shared.endEditing()
                        }
                    
                    Image.SearchIcon
                        .opacity(searchText.isEmpty ? 1.0 : 0.0)
                }
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
                
                , alignment: .trailing
            )
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.AppGrayColor1)
            )
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
    }
}
