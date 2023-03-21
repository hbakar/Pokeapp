//
//  DetailControllerBuilder.swift
//  Pokeapp
//
//  Created by Hüseyin BAKAR on 21.03.2023.
//

import UIKit.UIViewController

// MARK: Detail Builder
final class DetailControllerBuilder {
    static func build(result: Result) -> UIViewController {
        let service = Service()
        let viewModel: DetailViewModel = DetailViewModel(service: service,result: result)
        let vc = DetailController(viewModel: viewModel)
        return vc
    }
}
