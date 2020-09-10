//
//  CocktailNetworkManager.swift
//  CocktailDB
//
//  Created by Yura Geyts on 09.09.2020.
//  Copyright © 2020 Yura Geyts. All rights reserved.
//

import Foundation

class CocktailNetworkManager {
    
    func performRequest(withURLString urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, responce, error in
            if let data = data {
                if let allCocktails = self.parseJSON(withData: data) {
                    print(allCocktails.drinks)
                }
            }
        }
        task.resume()
    }
    
    fileprivate func parseJSON(withData data: Data) -> AllCocktails? {
        let decoder = JSONDecoder()
        do {
            let responseCocktailData = try decoder.decode(ResponseCocktailData.self, from: data)
            guard let allCocktails = AllCocktails(responseCocktailData: responseCocktailData) else { return nil }
            return allCocktails
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
