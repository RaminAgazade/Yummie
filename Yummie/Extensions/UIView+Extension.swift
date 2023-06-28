//
//  UIView+Extension.swift
//  Yummie
//
//  Created by Ramin on 27.06.23.
//

import UIKit

extension UIView {
    
   @IBInspectable var cornerRadius: CGFloat {
        
        get { return cornerRadius }
        
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
