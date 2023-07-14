//
//  UserDefaults+Extension.swift
//  Yummie
//
//  Created by Ramin on 14.07.23.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKey: String {
        case hasOnboarded
    }
    var hasOnboarded: Bool {
        get {
            bool(forKey: UserDefaultsKey.hasOnboarded.rawValue)
        }
        
        set {
            setValue(newValue, forKey: UserDefaultsKey.hasOnboarded.rawValue)
        }
    }
}
