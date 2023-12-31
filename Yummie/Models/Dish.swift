//
//  Dish.swift
//  Yummie
//
//  Created by Ramin on 04.07.23.
//

import Foundation

struct Dish: Decodable {
    let id, name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
   
}
