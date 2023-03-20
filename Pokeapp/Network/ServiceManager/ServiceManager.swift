//
//  ServiceManager.swift
//  Pokeapp
//
//  Created by Hüseyin BAKAR on 20.03.2023.
//

import Alamofire

// MARK: - Generic Service Manager
final class ServiceManager {
    static let shared: ServiceManager = ServiceManager()
}

extension ServiceManager {
    func fetch<T>(path: String, onSuccess: @escaping(T) ->(), onError: (AFError) ->(),_ limit:Int?) where T: Codable {
        
        let _limit = String(limit ?? 20)
     
        AF.request(path.appending(_limit), encoding: JSONEncoding.default).validate().responseDecodable(of:T.self) { response in
            
            guard let model = response.value else { print(response.error as Any); return }
            onSuccess(model)
        }
    }
}
