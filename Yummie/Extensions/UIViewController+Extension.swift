//
//  UIViewController+Extension.swift
//  Yummie
//
//  Created by Ramin on 05.07.23.
//

import UIKit

extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instaniate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return
        storyboard.instantiateViewController(identifier: identifier) as! Self
  
    }
}
