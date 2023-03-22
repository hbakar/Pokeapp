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
    
    var viewModel : HomeViewModelProtocol!
    
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



// MARK: - HomeController Extensions
extension HomeController {
    
    func configure() {
        drawDesign()
        setupTableView()
        fetchData()
        configureSearchController()
    }
    
    func drawDesign() {
        tableView.register(HomeTableCell.self, forCellReuseIdentifier: HomeTableCell.Identifier.custom.rawValue)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        view.backgroundColor = .backgroundColor
        title = "POKEAPP"
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
        return viewModel.isSearch ? viewModel.searchData.count : viewModel.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
     
        guard let cell: HomeTableCell = tableView.dequeueReusableCell(withIdentifier: HomeTableCell.Identifier.custom.rawValue, for: indexPath) as? HomeTableCell else { return UITableViewCell() }
        
        cell.backgroundColor = .gray01
        
        Utils.animate(cell, indexPath)
        
        viewModel.isSearch ? cell.saveModel(model: viewModel.searchData[indexPath.row])
               : cell.saveModel(model: viewModel.pokemons[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if viewModel.isSearch
        {
            selectedPoke(result: viewModel.searchData[indexPath.row])
            
            print(viewModel.searchData[indexPath.row])
        }
        else
        {
            selectedPoke(result: viewModel.pokemons[indexPath.row])
            print(viewModel.pokemons[indexPath.row])
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       
    }
}



// MARK: - Service Extension
extension HomeController
{
    private func fetchData() {
        // limit 2 default
        viewModel?.fetchPokemons(onSuccess: { [weak self] data in
            guard let data = data?.results else {return}
            self?.viewModel?.pokemons = data
           // print(self?.viewModel?.pokemons[0])
            print(data)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }, onError: { error in
            print(error)
        },100)
        // 100 pokemons default
    }
}

// MARK: - Poke Output Extension
extension HomeController: pokeOutput
{
    func selectedPoke(result: Result) {
        
        let detail = DetailControllerBuilder.build(result: result)
        
        navigationController?.pushViewController(detail, animated: true)
    }
}

// MARK: - SearchBar Extension
extension HomeController: UISearchControllerDelegate, UISearchResultsUpdating {
    
    private func configureSearchController() {
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchControllerUI()
        navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    func updateSearchResults(for searchController: UISearchController) {
            guard let searchText = searchController.searchBar.text else { return }
            viewModel.searchTitle(searchText: searchText)
            if searchText.count > 2 {
                viewModel.isSearch = true && viewModel.searchData.isEmpty == false
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }else {
                viewModel.isSearch = false
                tableView.reloadData()
            }
        }
}
