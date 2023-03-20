//
//  PokemonModel.swift
//  Pokeapp
//
//  Created by Hüseyin BAKAR on 20.03.2023.
//

import Foundation

// MARK: - PokemonModel
struct PokemonModel: Codable {
    let count: Int?
    //let next: String?
    //let previous: JSONNull?
    let results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    let name: String?
    let url: String?
}


