//
//  DetailViewModel.swift
//  Pokeapp
//
//  Created by Hüseyin BAKAR on 21.03.2023.
//


import Alamofire

// MARK: - View Model Protocol

protocol DetailViewModelProtocol: AnyObject
{
    func fetchPokemonsById(onSuccess: @escaping(PokemonDetailModel?) ->Void,onError:@escaping(AFError) -> Void,_ name: String)
    var result : Result? {get set}
    var pokemonDetail: PokemonDetailModel? {get set}
}

final class DetailViewModel: DetailViewModelProtocol {
  
    var result : Result?
    var pokemonDetail: PokemonDetailModel?
  
    var service: ServiceProtocol
    
    init(service: ServiceProtocol, result: Result)
    {
        self.service = service
        self.result = result
    }
}


// MARK: - Service

extension DetailViewModel
{
    func fetchPokemonsById(onSuccess: @escaping (PokemonDetailModel?) -> Void, onError: @escaping (Alamofire.AFError) -> Void, _ name: String)
    {
        
        service.fetchPokemonById(onSucces: { data in
            guard let model = data else {
                onSuccess(nil)
                return
            }
            onSuccess(model)
        }, onError: { error in
            onError(error)
        }, name: self.result?.name ?? "")
    }
}

