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
    let baseURL = "https://www.thecocktaildb.com/api/json/v1/1/"
    var allCocktails: AllCocktails!
    var buttonSender: String?
    let searchCocktails = "searchCocktails"
    let getRandom = "getRandom"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cocktailNetworkManager.onCompletion = { allCocktails in
            DispatchQueue.main.async {
                self.allCocktails = allCocktails
                if self.buttonSender == self.getRandom {
                    self.performSegue(withIdentifier: "randomCocktail", sender: nil)
                } else if self.buttonSender == self.searchCocktails {
                    self.performSegue(withIdentifier: "searchSegue", sender: nil)
                } else if self.buttonSender == self.searchCocktails {
                    self.performSegue(withIdentifier: "searchSegue", sender: nil)
                }
            }
        }
    }
    
    @IBAction func searchCocktailByName(_ sender: Any) {
        presentAlertControllerWith(title: "Search cocktail by name", message: "Enter cocktail name below", preferredStyle: .alert) { text in
            let urlString = self.baseURL + "search.php?s=\(text)"
            self.cocktailNetworkManager.performRequest(withURLString: urlString)
            self.buttonSender = self.searchCocktails
        }
    }
    
    @IBAction func searchCocktailByFirstLetter(_ sender: Any) {
        presentAlertControllerWith(title: "Search cocktail by first letter", message: "Enter first letter of cocktails", preferredStyle: .alert) { text in
            let urlString = self.baseURL + "search.php?f=\(text)"
            self.cocktailNetworkManager.performRequest(withURLString: urlString)
            self.buttonSender = self.searchCocktails
        }
    }
    
    @IBAction func getRandomCocktail(_ sender: Any) {
        DispatchQueue.main.async {
            self.cocktailNetworkManager.performRequest(withURLString: self.baseURL + "random.php")
            self.buttonSender = self.getRandom
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "randomCocktail" {
            guard let destinationViewController = segue.destination as? CocktailInfoViewController else { return }
            destinationViewController.currentCocktail = allCocktails.cocktails.first
        } else {
            guard let destinationViewController = segue.destination as? CocktailListTableViewController else { return }
            destinationViewController.cocktails = allCocktails.cocktails
        }
    }
}

