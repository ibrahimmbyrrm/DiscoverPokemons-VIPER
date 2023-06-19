//
//  DetailView.swift
//  PokemonProject-VIPER
//
//  Created by İbrahim Bayram on 19.06.2023.
//
import UIKit
import Foundation

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
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            pokemonImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 200),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 200),
            
            pokemonNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonNameLabel.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor, constant: 16),
            pokemonNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pokemonNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            abilitiesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            abilitiesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            abilitiesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            abilitiesTableView.topAnchor.constraint(equalTo: pokemonNameLabel.bottomAnchor, constant: 16)
        ])
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
