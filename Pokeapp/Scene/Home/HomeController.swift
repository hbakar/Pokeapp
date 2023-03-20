//
//  HomeController.swift
//  Pokeapp
//
//  Created by Hüseyin BAKAR on 20.03.2023.
//

import UIKit.UIViewController
import SnapKit
import Hero

public typealias tableViewDelegate = UITableViewDelegate & UITableViewDataSource

// MARK: - Protocols

protocol pokeOutput {
    func selectedPoke(result: Result)
}

final class HomeController: UIViewController {
    
    // MARK: - UI Elements
    
    var viewModel : HomeViewModelProtocol?
    
    private lazy var searchController: UISearchController = {
       let search = UISearchController()
       return search
    }()
    
    private let tableView : UITableView = {
        let tb = UITableView()
        return tb
    }()

    // - MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Properties
    
    init(viewModel: HomeViewModelProtocol) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
}

// MARK: - UI Extensions

extension HomeController {
    
    private func configure()
    {
       view.backgroundColor = .backgroundColor
        
       setupTableView()
        fetchData()
        configureSearchController()
    }
    
    private func setupTableView()
    {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(HomeTableCell.self, forCellReuseIdentifier: HomeTableCell.Identifier.custom.rawValue)
    }
}


 // MARK: - TableView Extensions

extension HomeController:tableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      //  guard let cell = UITableViewCell() else {return}
        let cell = UITableViewCell()
        cell.textLabel?.text = "Pokemon starts"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       
    }
    
}

// MARK: - Service Extension
extension HomeController
{
    private func fetchData() {
        viewModel?.fetchPokemons(onSuccess: { [weak self] data in
            guard let data = data?.results else {return}
            self?.viewModel?.pokemons = data
            
            print(data)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }, onError: { error in
            print(error)
        }, 40)
    }
}

// MARK: - Poke Output Extension
extension HomeController: pokeOutput
{
    func selectedPoke(result: Result) {
      print(result)
    }
}

// MARK: - SearchBar Extension
extension HomeController: UISearchControllerDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    private func configureSearchController() {
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchControllerUI()
        navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    
    
}
