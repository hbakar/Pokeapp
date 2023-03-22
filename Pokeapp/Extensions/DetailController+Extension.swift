//
//  DetailController+Extension.swift
//  Pokeapp
//
//  Created by Hüseyin BAKAR on 22.03.2023.
//

import UIKit

extension UILabel {
    
    func detailTitle(){
        numberOfLines = 2
        textColor = .white
        font = UIFont(name: "Inter-ExtraBold", size: 30) ?? UIFont.boldSystemFont(ofSize: 30)
        textAlignment = .center
    }
    
    func detailAttrLabel()
    {
        numberOfLines = 2
        textColor = .whiteColor
        font = UIFont(name: "Inter-Regular", size: 18) ?? UIFont.boldSystemFont(ofSize: 18)
        textAlignment = .left
    }
    
    func detailLabel()
    {
        numberOfLines = 2
        textColor = .gray06
        font = UIFont(name: "Inter-Regular", size: 16) ?? UIFont.boldSystemFont(ofSize: 16)
        textAlignment = .left
    }
}

extension UIStackView {
    func detailAttrStackView(){
        distribution = .fillEqually
        spacing = 16.18
        axis = .vertical
        alignment = .fill
    }
}

extension UIImageView {
    func detailIconImage()
    {
        layer.cornerRadius = 12
        clipsToBounds = true
        contentMode = .scaleAspectFit
        heroID = "imageView"
    }
}




extension UIImageView {
    func detailCellImage()
    {
        backgroundColor = .white
        layer.cornerRadius = 12
        clipsToBounds = true
        contentMode = .scaleAspectFit
        heroID = "imageView"
    }
}

