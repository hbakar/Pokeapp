//
//  ServiceConstant.swift
//  Pokeapp
//
//  Created by Hüseyin BAKAR on 20.03.2023.
//

import Foundation

extension Constant {
    
    class Network
    {
        enum ServiceEndPoint: String {
            
            case BASE_URL = "https://pokeapi.co"
            case API = "/api/v2"
            
            case POKE_API_URL = "/pokemon?limit="
            
            static func fetchPokemons(_ _limit:Int) -> String {
                "\(ServiceEndPoint.BASE_URL.rawValue)\(ServiceEndPoint.API.rawValue)\(ServiceEndPoint.POKE_API_URL.rawValue)\(_limit)"
            }
        }
    }
}
