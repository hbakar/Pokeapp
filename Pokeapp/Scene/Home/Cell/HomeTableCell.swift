//
//  HomeTableCell.swift
//  Pokeapp
//
//  Created by Hüseyin BAKAR on 20.03.2023.
//

import UIKit
import Kingfisher

class HomeTableCell: UITableViewCell {

    // MARK: - Identifier
   enum Identifier: String {
    case custom = "Cell"
   }
    
    // MARK: - UI Elements
    private var img : UIImageView = {
        let imgV = UIImageView()
        imgV.homeCellImage()
        return imgV
    }()
    
    private let lblName: UILabel = {
        let label = UILabel()
        label.homeCellTitle()
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        subView()
        makeCellImage()
        makeCellLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func subView()
    {
        addSubview(img)
        addSubview(lblName)
    }
    
    // MARK: - Functions
    func saveModel(model: Result)
    {
        lblName.text = model.name
        
        var id = ""
        if let path = model.url
        {
            id = path.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/",
                                              with: "").replacingOccurrences(of: "/",
                                                                             with: "")
          let imgUrl =  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/".appending(id+".png")
            
            img.kf.setImage(with:URL(string:imgUrl)!)
        }
     
    }
}



// MARK: - Snapkit Extensions
private extension HomeTableCell {
    
    func makeCellImage() {
        img.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(16.18)
            make.height.equalTo(160)
            make.width.equalTo(160)
            make.center.equalToSuperview()        }
    }
    
    func makeCellLabel(){
        lblName.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16.18)
            make.left.equalToSuperview().inset(16.18)
            make.top.equalTo(img.snp.top)
          
        }
    }
    
}
