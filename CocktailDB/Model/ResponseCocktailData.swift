//
//  CurrentCocktailData.swift
//  CocktailDB
//
//  Created by Yura Geyts on 09.09.2020.
//  Copyright © 2020 Yura Geyts. All rights reserved.
//

import Foundation

struct ResponseCocktailData: Codable {
    var drinks: [Drink]
}

struct Drink: Codable {
    var cocktailName: String
    var cocktailImageURL: String
    var cocktailID: String
    var cocktailIsAlcoholic: String
    var cocktailRecipe: String
    
    enum CodingKeys: String, CodingKey {
        case cocktailName = "strDrink"
        case cocktailImageURL = "strDrinkThumb"
        case cocktailID = "idDrink"
        case cocktailIsAlcoholic = "strAlcoholic"
        case cocktailRecipe = "strInstructions"
    }
}
