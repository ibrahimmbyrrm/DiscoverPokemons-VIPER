//
//  DetailBuilder.swift
//  PokemonProject-VIPER
//
//  Created by İbrahim Bayram on 19.06.2023.
//

import Foundation


class DetailBuilder : DetailBuilderInterface {
    
    static func buildDetail(with pokemon : CustomPokemon) -> DetailView {
        let view = DetailView()
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        presenter.selectedPokemon = pokemon
        return view
    }
    
}
