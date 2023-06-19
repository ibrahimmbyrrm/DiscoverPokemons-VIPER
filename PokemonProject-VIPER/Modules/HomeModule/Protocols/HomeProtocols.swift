//
//  HomeProtocols.swift
//  PokemonProject-VIPER
//
//  Created by İbrahim Bayram on 19.06.2023.
//

import Foundation
import UIKit

typealias EntryPoint = UITableViewController & HomeViewInterface & AlertPerformable

enum NavigationRouter {
    case detail(CustomPokemon)
}

enum InteractorOutput {
    case pokemonDidSelect(CustomPokemon)
    case pokemonListDidDownload([CustomPokemon])
}

protocol HomeViewInterface {
    var presenter : HomePresenterInterface? {get set}
    
    func saveList(list : [CustomPokemon])
}

protocol AlertPerformable {
    func presentAlert(title : String, message : String)
}

protocol HomeInteractorInterface {
    var presenter : HomePresenterInterface? {get set}
    var customArray : [CustomPokemon] {get set}
    func fetchPokemons()
    func pokemonDidSelect(at index : Int)
}

protocol HomeRouterInterface {
    var entryPoint : EntryPoint? {get set}
    
    static func startExecution() -> HomeRouterInterface
    func navigateTo(to route : NavigationRouter)
}

protocol HomePresenterInterface {
    var interactor : HomeInteractorInterface? {get set}
    var view : EntryPoint? {get set}
    var router : HomeRouterInterface?  {get set}
    
    func handleInteractorResponse(output : InteractorOutput)
    func errorOccuredAtInteractor(error : Error)
    func showDetailScreen(at index : Int)
}


