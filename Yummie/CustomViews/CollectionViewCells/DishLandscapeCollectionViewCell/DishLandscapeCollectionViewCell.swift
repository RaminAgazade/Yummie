//
//  DishLandscapeCollectionViewCell.swift
//  Yummie
//
//  Created by Ramin on 04.07.23.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    static let identifier =  String(describing: DishLandscapeCollectionViewCell.self)
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
  
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
        
    }

}
