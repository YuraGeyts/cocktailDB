//
//  ViewController+AlertController.swift
//  CocktailDB
//
//  Created by Yura Geyts on 09.09.2020.
//  Copyright © 2020 Yura Geyts. All rights reserved.
//

import UIKit

extension ViewController {
    
    func presentAlertControllerWith(title: String?, message: String?, preferredStyle: UIAlertController.Style, complitionHandler: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        alertController.addTextField()
        let searchAction = UIAlertAction(title: "Search", style: .default) { _ in
            let textField = alertController.textFields?.first
            guard let text = textField?.text else { return }
            if text != "" {
                complitionHandler(text)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alertController.addAction(searchAction)
        alertController.addAction(cancelAction)
        alertController.preferredAction = searchAction
        
        present(alertController, animated: true, completion: nil)
    }
}
