//
//  HomeViewController.swift
//  Yummie
//
//  Created by Ramin on 29.06.23.
//

import UIKit
import JGProgressHUD


class HomeViewController: UIViewController {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
    .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
    .init(id: "id1", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
    .init(id: "id1", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
    .init(id: "id1", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
    .init(id: "id1", name: "Africa Dish 5", image: "https://picsum.photos/100/200")
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Garri", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id1", name: "Indomie", description: "This is the best I have ever tasted This is the best I have ever tasted This is the best I have ever tasted This is the best I have ever tasted This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 314),
        .init(id: "id1", name: "Pizza", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 1004),
        
    ]
    
    var specials: [Dish] = [
        .init(id: "id1", name: "Fried Plantain", description: "This is my favorite dish.", image: "https://picsum.photos/100/200", calories: 314),
        .init(id: "id1", name: "Beans and Garri", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 1004),
        
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        specialsCollectionView.dataSource = self
        specialsCollectionView.dataSource = self
        
        registerCells()
        
       
        
        NetworkService.shared.fetchAllCategories { [weak self ] (result) in
            switch result {
            case .success(let allDishes):
                print("It was succesful")
            case .failure(let error):
                print("The error is: \(error.localizedDescription)")
            }
            
        }
    }
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        specialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return specials.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instaniate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailViewController.instaniate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row]: specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}
