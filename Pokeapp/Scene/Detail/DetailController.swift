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

  
    public var result: Result!
    var viewModel : DetailViewModelProtocol!    // - MARK: UI Elements
    private var abilityList : [Ability] = []
   
    private var img : UIImageView = {
        let imgV = UIImageView()
        imgV.detailCellImage()
        return imgV
    }()
    
    private var rightArrow: UIImageView = {
        let img = UIImageView()
        img.detailIconImage()
        return img
    }()
    
    private let lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.detailTitle()
        return lbl
    }()
    
    private let lblName: UILabel = {
        let lbl = UILabel()
        lbl.detailLabel()
        return lbl
    }()
    
    
    
    private var stViewAbilities: UIStackView = {
        let stView = UIStackView()
        stView.detailAttrStackView()
        return stView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        fetchData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setGradient()
        
        
    }
    
    init(viewModel: DetailViewModelProtocol) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// - MARK: API Service Extensions
extension DetailController
{
    private func configureView(){
        
    }
}

// MARK: - View Extensions
extension DetailController
{
    private func configure() {
        self.hero.isEnabled = true
        self.view.backgroundColor = .backgroundColor
        subView()
        setupImageView()
    }
    

    
    private func subView()
    {
        self.view.addSubview(img)
        self.view.addSubview(stViewAbilities)
        
        self.stViewAbilities.addArrangedSubview(lblTitle)
    }
    
    private func setupImageView()
    {
        img.snp.makeConstraints { make in
            make.leading.equalTo(self.view.snp.leading).inset(16.18)
            make.trailing.equalTo(self.view.snp.trailing).offset(-16.18)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16.18)
            make.height.equalTo(300)
        }
        
        img.hero.id = "imageView"
        
        stViewAbilities.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16.18)
            make.right.equalToSuperview().offset(16.18)
            make.top.equalTo(self.img.snp.bottom).offset(16.18)
        }
        
       
    }
    
    private func setGradient()
    {
        let gradient = CAGradientLayer()
        gradient.frame = img.bounds
        let startColor = UIColor(red: 30/255, green: 113/255, blue: 79/255, alpha: 0).cgColor
        let endColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        gradient.colors = [startColor, endColor]
        img.layer.insertSublayer(gradient, at: 0)
    }
}

// MARK: - Service Extension
extension DetailController
{
    
    
    private func fetchData() {
        
            viewModel.fetchPokemonsById(onSuccess: { [weak self] data in
                self?.viewModel.pokemonDetail = data
                print(data)
                
                if let data = data
                {
                    if let name = data.name
                    {
                        self?.lblTitle.text = name
                    }
                    
                    if let abilities = data.abilities
                    {
                        self?.abilityList = abilities
                        
                        
                        abilities.forEach { ab in
                            let label = UILabel()
                            
                            var _name = ""
                            if let nm = ab.ability?.name
                            {
                               _name = nm
                            }
                            
                            label.text = _name
                            
                            label.detailLabel()
                            
                            self?.stViewAbilities.addArrangedSubview(label)
                        }
                    }
                   
                }
                if let poster = data?.sprites?.frontDefault
                {
                    print(poster)
                    let url = URL(string: poster)!
                    self!.img.kf.setImage(with: url)
                }
            }, onError: { error in
                print(error)
            }, "pikachu")
    }
}
