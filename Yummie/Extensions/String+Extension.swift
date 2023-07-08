//
//  String+Extension.swift
//  Yummie
//
//  Created by Ramin on 30.06.23.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
