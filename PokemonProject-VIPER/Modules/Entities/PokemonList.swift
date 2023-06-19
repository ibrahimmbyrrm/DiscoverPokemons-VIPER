//
//  PokemonList.swift
//  PokemonProject-VIPER
//
//  Created by İbrahim Bayram on 16.06.2023.
//

import Foundation

struct ListResponse : Codable {
    let results : [BasicPokemon]
}

struct BasicPokemon : Codable {
    let name : String
    let url : String
}
