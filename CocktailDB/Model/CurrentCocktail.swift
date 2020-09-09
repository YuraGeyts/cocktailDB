//
//  CurrentCocktail.swift
//  CocktailDB
//
//  Created by Yura Geyts on 09.09.2020.
//  Copyright © 2020 Yura Geyts. All rights reserved.
//

import Foundation

struct CurrentCocktail {
    let drinks: [[String : String?]]
    
    init?(currentCocktailData: CurrentCocktailData) {
        drinks = currentCocktailData.drinks
    }
    
    
}
