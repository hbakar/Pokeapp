//
//  HomeTableCell+Extension.swift
//  Pokeapp
//
//  Created by Hüseyin BAKAR on 21.03.2023.
//

import Foundation
import UIKit
import Hero

extension UILabel {
    func homeCellTitle(){
        numberOfLines = 2
        textColor = .primaryBlue
        font = UIFont.boldSystemFont(ofSize: 18)
        heroID = "titleLabel"
    }
}

extension UIImageView {
    func homeCellImage()
    {
        layer.cornerRadius = 12
        clipsToBounds = true
        contentMode = .scaleAspectFit
        heroID = "imageView"
    }
}
