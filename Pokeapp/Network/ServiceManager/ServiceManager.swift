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
    func fetch<T>(path: String, onSuccess: @escaping(T) ->(), onError: (AFError) ->(), limit:Int?,name: String?) where T: Codable
    {
        AF.request(path,encoding: JSONEncoding.default).validate().responseDecodable(of:T.self) { response in
            guard let model = response.value else { print(response.error as Any); return }
            onSuccess(model)
        }
    }
}
