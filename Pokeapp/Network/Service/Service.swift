//
//  Service.swift
//  Pokeapp
//
//  Created by Hüseyin BAKAR on 20.03.2023.
//

import Alamofire

// MARK: - ServiceProtocol
protocol ServiceProtocol: AnyObject {
    func fetchPokemons(onSuccess: @escaping(PokemonModel?) -> Void, onError: @escaping (AFError) -> Void, limit: Int?)
    
    func fetchPokemonById(onSucces: @escaping(PokemonDetailModel?) -> Void, onError: @escaping (AFError) -> Void, name:String)
}

// MARK: - Services

final class Service: ServiceProtocol {
    
    func fetchPokemons(onSuccess: @escaping(PokemonModel?) -> Void, onError: @escaping (AFError) -> Void, limit:Int?) {
        
        ServiceManager.shared.fetch(path: Constant.Network.ServiceEndPoint.fetchPokemons(limit ?? 1), onSuccess: { (response: PokemonModel) in
            onSuccess(response)
        }, onError: { error in
            onError(error)
        }, limit: limit,name: nil)
    }
    
    func fetchPokemonById(onSucces: @escaping (PokemonDetailModel?) -> Void, onError: @escaping (AFError) -> Void,name: String)
    {
        ServiceManager.shared.fetch(path: Constant.Network.ServiceEndPoint.fetchPokemonById(name), onSuccess: { (response: PokemonDetailModel) in
            onSucces(response)
        }, onError: { error in
            onError(error)
        }, limit: nil,name: name)
    }
    
}
