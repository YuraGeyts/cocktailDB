//
//  CocktailTableViewCell.swift
//  CocktailDB
//
//  Created by Yura Geyts on 11.09.2020.
//  Copyright © 2020 Yura Geyts. All rights reserved.
//

import UIKit

class CocktailTableViewCell: UITableViewCell {

    @IBOutlet weak var cocktailImageView: UIImageView!
    @IBOutlet weak var cocktailNameLabel: UILabel!
    @IBOutlet weak var isAlcoholicLabel: UILabel!

    func configureCell(with cocktail: Cocktail) {
        ImageDownloader.shared.downloadImage(from: cocktail.cocktailImageURL, imageView: cocktailImageView)
        cocktailNameLabel.text = cocktail.cocktailName
        isAlcoholicLabel.text = cocktail.cocktailIsAlcoholic
    }
}
