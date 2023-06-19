//
//  HomeInteractor.swift
//  PokemonProject-VIPER
//
//  Created by İbrahim Bayram on 16.06.2023.
//

import UIKit

class HomeInteractor : HomeInteractorInterface {
    var presenter: HomePresenterInterface?
    var customArray = [CustomPokemon]()
    
    //MARK: - Initializer
    init()  {
        //Created custom array when interactor initialized.
         fetchPokemons()
    }
    
    //MARK: - Array Creator.
    func fetchPokemons() {
        
        if let cachedData = CacheManager.shared.readCacheData(forKey: "customArray") {
            self.customArray = cachedData
            print("Data has been fetched from cache.")
            return
        }
        
        // This function creates custom array combined with list API and detail API.
        DispatchQueue.main.async {
            let resource = Resource<ListResponse>(url:URL(string: "https://pokeapi.co/api/v2/pokemon?limit=20&offset=0")!)
            Webservice().callApi(resource: resource) { result in
                switch result {
                case .success(let pokeList):
                    let dispatchGroup = DispatchGroup()
                    for pokemon in pokeList.results {
                        // Process enters dispatch group for each api call.
                        dispatchGroup.enter()
                        let detailResource = Resource<Welcome>(url: URL(string: pokemon.url)!)
                        Webservice().callApi(resource: detailResource) { response in
                            switch response {
                            case .success(let pokemonDetail):
                                let customPokemon = CustomPokemon(name: pokemonDetail.name, imageURL: pokemonDetail.sprites.front_default, abilities: pokemonDetail.abilities)
                                self.customArray.append(customPokemon)
                                dispatchGroup.leave()
                            case .failure(let error):
                                print(error)
                                self.presenter?.errorOccuredAtInteractor(error: error)
                                dispatchGroup.leave()
                                
                            }
                        }
                    }
                    //When dispatch group processes finished and all items appended in custom array, notify called and array transfered to presenter.
                    dispatchGroup.notify(queue: .main) {
                        print("notify called")
                        self.customArray.saveOnCache(forkey: "customArray")
                        self.presenter?.handleInteractorResponse(output: .pokemonListDidDownload(self.customArray))
                    }
                case .failure(let error):
                    print(httpError.creatingCustomArrayError)
                    print(error)
                }
            }
        }
    }
    
    func pokemonDidSelect(at index : Int) {
        let pokemon = customArray[index]
        self.presenter?.handleInteractorResponse(output: .pokemonDidSelect(pokemon))
    }



}
