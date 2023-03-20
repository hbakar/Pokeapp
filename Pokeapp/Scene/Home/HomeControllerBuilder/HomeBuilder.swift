//
//  HomeBuilder.swift
//  Pokeapp
//
//  Created by Hüseyin BAKAR on 20.03.2023.
//

import UIKit.UIViewController

// MARK: Home Builder
final class HomeBuilder {
    static func build() -> UIViewController {
        let service = Service()
        let viewModel: HomeViewModel = HomeViewModel(service: service)
        let vc = HomeController(viewModel: viewModel)
        return vc
    }
}
