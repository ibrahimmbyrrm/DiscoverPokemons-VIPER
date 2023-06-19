//
//  HomeView.swift
//  PokemonProject-VIPER
//
//  Created by İbrahim Bayram on 16.06.2023.
//

import Foundation
import UIKit

class HomeView : UITableViewController , HomeViewInterface {
    
    var presenter: HomePresenterInterface?
    var list = [CustomPokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func saveList(list: [CustomPokemon]) {
        self.list = list
        self.tableView.reloadAsync()
    }
    
    private func setupTableView() {
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "PokemonCell")
        tableView.rowHeight = 110
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetailScreen(at: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonTableViewCell
        cell.configure(pokemon: list[indexPath.row])
        return cell
    }
    
}
extension HomeView : AlertPerformable {
    func presentAlert(title: String, message: String) {
        self.showAlert(title: title, message: message)
    }
}
