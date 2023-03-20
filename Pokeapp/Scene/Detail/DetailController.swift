//
//  DetayVC.swift
//  Pokeapp
//
//  Created by Hüseyin BAKAR on 20.03.2023.
//

import UIKit.UIViewController
import SnapKit
import Kingfisher

final class DetailController: UIViewController {

    // - MARK: Properties
   
    private let imgView : UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    
    private let lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textColor = .gray06
        lbl.font = UIFont(name: "OpenSans-ExtraBold", size: 18) ?? .systemFont(ofSize: 18)
        return lbl
    }()
    
    private let lblName: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textColor = .gray06
        lbl.font = UIFont(name: "OpenSans-Regular", size: 14) ?? .systemFont(ofSize: 14)
        return lbl
    }()
    
    private var stViewAbilities: UIStackView = {
        let stView = UIStackView()
        stView.distribution = .fillEqually
        stView.spacing = 5
        stView.axis = .vertical
        stView.alignment = .fill
        return stView
    }()
    
    // - MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
}

// - MARK: API Service Extensions
extension DetailController
{
    private func configureView(){
        
    }
}

// - MARK: View Extensions
extension DetailController
{
    private func configure() {
        self.view.backgroundColor = .backgroundColor
        
    }
    
    private func setupImageView()
    {
        self.view.addSubview(imgView)
        
        imgView.snp.makeConstraints { make in
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
            make.top.equalTo(16.18)
            make.height.equalTo(200)
        }
       // imgView.kf.setImage(with: "https://placehold.co/600x400/png")!
    }
}
