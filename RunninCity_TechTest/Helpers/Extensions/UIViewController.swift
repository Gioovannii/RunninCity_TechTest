//
//  UIViewController.swift
//  RunninCity_TechTest
//
//  Created by Giovanni Gaffé on 2021/5/26.
//

import UIKit

extension UIViewController {
    ///Alert for handle errors
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Annuler", style: .cancel))
        present(alert, animated: true)
    }
}
