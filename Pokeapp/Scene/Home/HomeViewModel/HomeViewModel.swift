//
//  HomeViewModel.swift
//  Pokeapp
//
//  Created by Hüseyin BAKAR on 20.03.2023.
//

import Alamofire

// MARK: - View Model Protocol

protocol HomeViewModelProtocol: AnyObject
{
    func fetchPokemons(onSuccess: @escaping(PokemonModel?) ->Void,onError:@escaping(AFError) -> Void,_ limit: Int?)
    
    // var delegate: PokemonOutput {get set}
    var pokemons: [Result] {get set}
    var searchData: [Result] {get set}
    var isSearch: Bool {get set}
    func searchTitle(searchText:String?)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    var delegate: pokeOutput?
    var pokemons = [Result]()
    var searchData = [Result]()
    var isSearch = Bool()
  
    var service: ServiceProtocol
    
    init(service: ServiceProtocol)
    {
        self.service = service
    }
}

// MARK: - Search
extension HomeViewModel
{
    func searchTitle(searchText: String?) {
        guard let search = searchText else {return}
        searchData = pokemons.filter({($0.name?.lowercased().contains(search.lowercased()))!})
    }
}

// MARK: - Service

extension HomeViewModel
{
    func fetchPokemons(onSuccess: @escaping (PokemonModel?) -> Void, onError: @escaping (Alamofire.AFError) -> Void, _ limit: Int?) {
        
        service.fetchPokemons(onSuccess: { data in
            guard let model = data else {
                onSuccess(nil)
                return
            }
            onSuccess(model)
        }, onError: {
            error in
            onError(error)
        }
       , limit: (limit ?? 20))
    }
}

