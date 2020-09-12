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
    let imageDownloader = ImageDownloader()
    
    var currentCocktail: Drink?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let drink = self.currentCocktail else { return }
        updateInterface(cocktail: drink)
    }
    
    func updateInterface(cocktail: Drink) {
        guard let url = URL(string: cocktail.cocktailImageURL) else { return }
        imageDownloader.downloadImage(from: url, imageView: self.cocktailImageView)
        self.cocktailNameLabel.text = cocktail.cocktailName
        self.isAlcoholicLabel.text = cocktail.cocktailIsAlcoholic
        self.recipeTextView.text = cocktail.cocktailRecipe
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
