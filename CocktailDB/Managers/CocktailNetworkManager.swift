//
//  CocktailNetworkManager.swift
//  CocktailDB
//
//  Created by Yura Geyts on 09.09.2020.
//  Copyright © 2020 Yura Geyts. All rights reserved.
//

import Foundation

class CocktailNetworkManager {
    private init(){}
    static let shared = CocktailNetworkManager()
    
    var onCompletion: ((AllCocktails) -> ())?
    
    func performRequest(withURLString urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, responce, error in
            if let data = data {
                if let allCocktails = self.parseJSON(withData: data) {
                    self.onCompletion?(allCocktails)
                }
            }
        }
        task.resume()
    }
    
    fileprivate func parseJSON(withData data: Data) -> AllCocktails? {
        let decoder = JSONDecoder()
        do {
            let responseCocktailData = try decoder.decode(AllCocktails.self, from: data)
            return responseCocktailData
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
