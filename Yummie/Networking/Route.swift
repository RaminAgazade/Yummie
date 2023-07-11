//
//  Route.swift
//  Yummie
//
//  Created by Ramin on 07.07.23.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    
    case fetchAllCategories
    
    var description: String {
        switch self {
        case .fetchAllCategories: return
            "/dish-categories"
            
        }
    }
}
