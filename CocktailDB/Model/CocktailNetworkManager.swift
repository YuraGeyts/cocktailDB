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
                if let currentCocktail = self.parseJSON(withData: data) {
                    print(currentCocktail)
                }
            }
        }
        task.resume()
    }
    
    fileprivate func parseJSON(withData data: Data) -> CurrentCocktail? {
        let decoder = JSONDecoder()
        do {
            let currentCocktailData = try decoder.decode(CurrentCocktailData.self, from: data)
            guard let currentCocktail = CurrentCocktail(currentCocktailData: currentCocktailData) else { return nil }
            return currentCocktail
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
