//
//  File.swift
//  PokemonProject-VIPER
//
//  Created by İbrahim Bayram on 19.06.2023.
//

import Foundation
import UIKit

extension UITableView {
    func reloadAsync() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}


