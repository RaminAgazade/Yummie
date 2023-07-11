//
//  Order.swift
//  Yummie
//
//  Created by Ramin on 06.07.23.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}
