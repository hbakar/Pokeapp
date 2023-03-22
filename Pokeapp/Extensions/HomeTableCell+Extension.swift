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
        textColor = .whiteColor
        font = UIFont(name: "Inter-ExtraBold", size: 24) ?? UIFont.boldSystemFont(ofSize: 24)
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
    
    func homeCellIcon()
    {
        layer.cornerRadius = 12
        clipsToBounds = true
        contentMode = .scaleAspectFit
        heroID = "icons"
    }
}
