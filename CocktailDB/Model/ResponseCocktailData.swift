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
    var strDrink: String
    var strDrinkThumb: String
    var idDrink: String
}
