//
//  AllDishes.swift
//  Yummie
//
//  Created by Ramin on 08.07.23.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
