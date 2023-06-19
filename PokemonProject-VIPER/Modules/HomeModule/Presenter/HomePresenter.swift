//
//  HomePresenter.swift
//  PokemonProject-VIPER
//
//  Created by İbrahim Bayram on 16.06.2023.
//

import UIKit

class HomePresenter : HomePresenterInterface {
    var view: EntryPoint?
    var router: HomeRouterInterface?
    var interactor: HomeInteractorInterface?

    func handleInteractorResponse() {
        
    }
    
    func handleInteractorResponse(output: InteractorOutput) {
        switch output {
        case .pokemonListDidDownload(let pokemonList):
            view?.saveList(list: pokemonList)
        case .pokemonDidSelect(let selectedPokemon):
            router?.navigateTo(to: .detail(selectedPokemon))
        }
    }
    
    func errorOccuredAtInteractor(error : Error) {
        view?.presentAlert(title: error.localizedDescription, message: "Please try again later")
    }
    
    func showDetailScreen(at index : Int) {
        interactor?.pokemonDidSelect(at: index)
    }
}
