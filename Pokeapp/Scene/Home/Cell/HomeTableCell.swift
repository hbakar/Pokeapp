//
//  HomeTableCell.swift
//  Pokeapp
//
//  Created by Hüseyin BAKAR on 20.03.2023.
//

import UIKit

class HomeTableCell: UITableViewCell {

    // MARK: - Identifier
        enum Identifier: String {
            case custom = "Cell"
        }
    
    // MARK: - Properties
    private let imgView : UIImageView = {
        let imgV = UIImageView()
        return imgV
    }()
    
    private var stackView : UIStackView = {
        let stView = UIStackView()
        stView.alignment = .fill
        stView.axis = .vertical
        stView.distribution = .fillEqually
        stView.spacing = 5
        return stView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}


// MARK: - Snapkit Extensions
private extension HomeTableCell {
    
}
