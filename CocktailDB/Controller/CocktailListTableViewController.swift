//
//  CocktailListTableViewController.swift
//  CocktailDB
//
//  Created by Yura Geyts on 11.09.2020.
//  Copyright © 2020 Yura Geyts. All rights reserved.
//

import UIKit

class CocktailListTableViewController: UITableViewController {
    
    var cocktails: [Cocktail]?
    var selectedCocktail: Cocktail!

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let cocktailsCount = cocktails?.count else { return 0}
        return cocktailsCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cocktailCell", for: indexPath) as! CocktailTableViewCell
        guard let currentCocktail = cocktails?[indexPath.row] else { return cell }
        cell.configureCell(with: currentCocktail)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCocktail = cocktails?[indexPath.row]
        performSegue(withIdentifier: "selectedCocktail", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? CocktailInfoViewController else { return }
        destinationVC.currentCocktail = selectedCocktail
    }
}
