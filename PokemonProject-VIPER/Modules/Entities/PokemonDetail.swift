// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let abilities: [Ability]
    let name: String
    let sprites: Sprites
}

// MARK: - Ability
struct Ability: Codable {
    let ability: Species
}

// MARK: - Species
struct Species: Codable {
    let name: String
    let url: String
}




// MARK: - Sprites
class Sprites: Codable {
    let front_default : String
}

