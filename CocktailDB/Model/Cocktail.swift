//
//  Drink.swift
//  CocktailDB
//
//  Created by Yura Geyts on 14.09.2020.
//  Copyright © 2020 Yura Geyts. All rights reserved.
//

import Foundation

struct Cocktail: Codable {
    var cocktailName: String
    var cocktailImageURL: String
    var cocktailID: String
    var cocktailIsAlcoholic: String
    var cocktailRecipe: String
    var cocktailCategory: String
    var cocktailGlass: String
    
    
    enum CodingKeys: String, CodingKey {
        case cocktailName = "strDrink"
        case cocktailImageURL = "strDrinkThumb"
        case cocktailID = "idDrink"
        case cocktailIsAlcoholic = "strAlcoholic"
        case cocktailRecipe = "strInstructions"
        case cocktailCategory = "strCategory"
        case cocktailGlass = "strGlass"
    }
}
