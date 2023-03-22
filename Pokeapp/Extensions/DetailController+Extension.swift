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
        font = UIFont(name: "Inter-Bold", size: 24) ?? UIFont.boldSystemFont(ofSize: 24)
        
    }
    
    func detailLabel()
    {
        numberOfLines = 2
        textColor = .gray06
        font = UIFont.boldSystemFont(ofSize: 14)
        font = UIFont(name: "Inter-Regular", size: 24) ?? UIFont.boldSystemFont(ofSize: 24)
    }
}

extension UIStackView {
    func detailAttrStackView(){
        distribution = .fillEqually
        spacing = 5
        axis = .vertical
        alignment = .fill
    }
}




extension UIImageView {
    func detailCellImage()
    {
        layer.cornerRadius = 12
        clipsToBounds = true
        contentMode = .scaleAspectFit
        heroID = "imageView"
    }
}

