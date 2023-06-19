//
//  DetailPresenter.swift
//  PokemonProject-VIPER
//
//  Created by İbrahim Bayram on 19.06.2023.
//

import Foundation

class DetailPresenter : DetailPresenterInterface {
    var view: DetailViewInterface?
    var interactor: DetailInteractorInterface?
    var selectedPokemon: CustomPokemon?
    
    func loadDetails() {
        guard let selectedPokemon = selectedPokemon else {return}
        view?.updateViews(with: selectedPokemon)
    }
}
