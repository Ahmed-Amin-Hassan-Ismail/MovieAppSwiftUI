//
//  UIApplication.swift
//  MovieAppSwiftUI
//
//  Created by Ahmed Amin on 27/04/2023.
//

import SwiftUI


extension UIApplication {
    
    func endEditing() {
        sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
