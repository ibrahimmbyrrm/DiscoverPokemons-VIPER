//
//  HomeRouter.swift
//  PokemonProject-VIPER
//
//  Created by İbrahim Bayram on 16.06.2023.
//

import UIKit

class HomeRouter : HomeRouterInterface{
    var entryPoint: EntryPoint?
    
    func navigateTo(to route : NavigationRouter) {
        switch route {
        case .detail(let selectedPokemon):
            let vc = DetailBuilder.buildDetail(with: selectedPokemon)
            entryPoint?.navigationController?.show(vc, sender: nil)
        }
    }
    
    static func startExecution() -> HomeRouterInterface {
        var router = HomeRouter()
        var presenter : HomePresenterInterface = HomePresenter()
        var interactor : HomeInteractorInterface = HomeInteractor()
        var view : EntryPoint = HomeView()
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        view.presenter = presenter
        router.entryPoint = view as? EntryPoint
        interactor.presenter = presenter
        return router
    }
}
