//
//  CocktailInfoViewController.swift
//  CocktailDB
//
//  Created by Yura Geyts on 10.09.2020.
//  Copyright © 2020 Yura Geyts. All rights reserved.
//

import UIKit

class CocktailInfoViewController: UIViewController {
    
    @IBOutlet weak var cocktailImageView: UIImageView!
    @IBOutlet weak var cocktailNameLabel: UILabel!
    @IBOutlet weak var isAlcoholicLabel: UILabel!
    @IBOutlet weak var recipeTextView: UITextView!
    @IBOutlet weak var glassLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var currentCocktail: Cocktail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let drink = self.currentCocktail else { return }
        updateInterface(cocktail: drink)
    }
    
    func updateInterface(cocktail: Cocktail) {
        ImageDownloader.shared.downloadImage(from: cocktail.cocktailImageURL, imageView: self.cocktailImageView)
        self.cocktailNameLabel.text = cocktail.cocktailName
        self.isAlcoholicLabel.text = cocktail.cocktailIsAlcoholic
        self.recipeTextView.text = cocktail.cocktailRecipe
        self.glassLabel.text = cocktail.cocktailGlass
        self.categoryLabel.text = cocktail.cocktailCategory
    }
}
