//
//  DetailSegmentSectionView.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 30/04/2023.
//

import SwiftUI

struct DetailSegmentSectionView: View {
    
    //MARK: - Properties
    
    let section: DetailViewSection
    let namespace: Namespace.ID
    @Binding var selectedSection: DetailViewSection
    
    //MARK: - Body
    
    var body: some View {
        Text(section.title)
            .poppins((section == selectedSection) ? .bold : .regular, 16.0)
            .background(
                ZStack {
                    if section == selectedSection {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 3)
                            .offset(y: 20)
                            .matchedGeometryEffect(id: "DetailSegmentSectionView",
                                                   in: namespace)
                    }
                }
            )
    }
}

struct DetailSegmentSectionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailSegmentSectionView(section: .about,
                                 namespace: Namespace().wrappedValue,
                                 selectedSection: .constant(.about))
    }
}
