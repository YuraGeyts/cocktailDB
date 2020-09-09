//
//  ViewController.swift
//  CocktailDB
//
//  Created by Yura Geyts on 09.09.2020.
//  Copyright © 2020 Yura Geyts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cocktailNetworkManager = CocktailNetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchCocktailByName(_ sender: Any) {
        presentAlertControllerWith(title: "Search cocktail by name", message: "Enter cocktail name below", preferredStyle: .alert) { text in
            let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(text)"
            self.cocktailNetworkManager.performRequest(withURLString: urlString)
        }
    }
    
    @IBAction func searchCocktailByFirstLetter(_ sender: Any) {
        presentAlertControllerWith(title: "Search cocktail by first letter", message: "Enter first letter of cocktails", preferredStyle: .alert) { text in
            let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=\(text)"
            self.cocktailNetworkManager.performRequest(withURLString: urlString)
        }
    }
    
    @IBAction func getRandomCocktail(_ sender: Any) {
        cocktailNetworkManager.performRequest(withURLString: "https://www.thecocktaildb.com/api/json/v1/1/random.php")
    }

}

