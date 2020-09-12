//
//  ImageDownloader.swift
//  CocktailDB
//
//  Created by Yura Geyts on 12.09.2020.
//  Copyright © 2020 Yura Geyts. All rights reserved.
//

import Foundation
import UIKit

class ImageDownloader {
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL, imageView: UIImageView) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                imageView.image = UIImage(data: data)
            }
        }
    }
}
