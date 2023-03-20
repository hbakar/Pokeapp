//
//  HomeController+Extension.swift
//  Pokeapp
//
//  Created by Hüseyin BAKAR on 20.03.2023.
//

import UIKit

extension UISearchController {
    
    func searchControllerUI() {
        searchBar.sizeToFit()
        loadViewIfNeeded()
        obscuresBackgroundDuringPresentation = false
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.returnKeyType = UIReturnKeyType.done
        searchBar.tintColor = UIColor(.blue)
        searchBar.searchTextField.textColor = .black
        searchBar.placeholder = "Search"
    }
}
