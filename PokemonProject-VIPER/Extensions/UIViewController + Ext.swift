//
//  UIViewController + Ext.swift
//  PokemonProject-VIPER
//
//  Created by İbrahim Bayram on 19.06.2023.
//
import UIKit
import Foundation

extension UIViewController {
    func showAlert(title : String, message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButtton = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okButtton)
        self.present(alert, animated: true)
    }
}
