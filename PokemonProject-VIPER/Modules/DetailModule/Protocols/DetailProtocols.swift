//
//  DetailProtocola.swift
//  PokemonProject-VIPER
//
//  Created by İbrahim Bayram on 19.06.2023.
//

import Foundation

protocol DetailPresenterInterface {
    var view : DetailViewInterface? {get set}
    var interactor : DetailInteractorInterface? {get set}
    var selectedPokemon : CustomPokemon? {get set}
    func loadDetails()
}

protocol DetailBuilderInterface {
    static func buildDetail(with pokemon : CustomPokemon) -> DetailView
}

protocol DetailInteractorInterface {
    var presenter : DetailPresenterInterface? {get set}
}

protocol DetailViewInterface {
    var presenter : DetailPresenterInterface? {get set}
    var abilities : [Ability]! {get set}
    func updateViews(with pokemon : CustomPokemon)
}
