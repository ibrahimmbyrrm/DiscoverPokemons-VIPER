//
//  DetailView.swift
//  PokemonProject-VIPER
//
//  Created by İbrahim Bayram on 19.06.2023.
//
import UIKit
import Foundation
import SnapKit

class DetailView : UIViewController, DetailViewInterface {
    //MARK: - Programmatic UI Objects
    private let pokemonImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let pokemonNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let abilitiesTableView : UITableView = {
        let tableview = UITableView()
        tableview.isUserInteractionEnabled = false
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    //MARK: - Interface Variables
    var presenter: DetailPresenterInterface?
    var abilities: [Ability]!
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupContstraints()
        setupTableView()
        presenter?.loadDetails()
    }
    
    func updateViews(with pokemon : CustomPokemon) {
        self.pokemonNameLabel.text = pokemon.name
        self.pokemonImageView.sd_setImage(with: URL(string: pokemon.imageURL))
        self.abilities = pokemon.abilities
        abilitiesTableView.reloadAsync()
    }
    //MARK: - UI Setup Functions
    private func setupContstraints() {
        pokemonImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        pokemonNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(pokemonImageView.snp.bottom).offset(16)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
        
        abilitiesTableView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
            make.top.equalTo(pokemonNameLabel.snp.bottom).offset(16)
        }
        view.backgroundColor = .white
    }
    
    private func addSubviews() {
        [pokemonImageView, pokemonNameLabel,abilitiesTableView].forEach { v in
            view.addSubview(v)
        }
    }
    private func setupTableView() {
        abilitiesTableView.dataSource = self
        abilitiesTableView.delegate = self
        abilitiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "AbilitiyCell")
    }
}
extension DetailView : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return abilities.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AbilitiyCell",for: indexPath)
        cell.textLabel?.text = abilities[indexPath.row].ability.name
        return cell
    }
}
