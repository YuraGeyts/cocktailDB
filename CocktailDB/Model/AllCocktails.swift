//
//  CurrentCocktail.swift
//  CocktailDB
//
//  Created by Yura Geyts on 09.09.2020.
//  Copyright © 2020 Yura Geyts. All rights reserved.
//

import Foundation

struct AllCocktails {
    var drinks: [Drink]
    
    init?(responseCocktailData: ResponseCocktailData) {
        drinks = responseCocktailData.drinks
    }
    
    
}
