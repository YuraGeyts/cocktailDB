//
//  CurrentCocktailData.swift
//  CocktailDB
//
//  Created by Yura Geyts on 09.09.2020.
//  Copyright © 2020 Yura Geyts. All rights reserved.
//

import Foundation

struct ResponseCocktailData: Codable {
    var cocktails: [Cocktail]
    
    enum CodingKeys: String, CodingKey {
        case cocktails = "drinks"
    }
}
