//
//  DishCategory.swift
//  Yummie
//
//  Created by Ramin on 30.06.23.
//

import Foundation


struct DishCategory: Decodable {
     let id, name, image: String?
     
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
    
}
