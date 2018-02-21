//
//  GRRepositoriesListViewController.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/19/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import Foundation
import UIKit
/**
 *  GRRepositoriesListViewController table view controller contains the repositories details showen on list
 */
class GRRepositoriesListViewController: GRBaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var repositoryTableView: UITableView!
    
    // MARK: - Properties
    var searchText: String? {
        didSet{
            if let text = searchText {
                presenter?.loadData(forSearchText: text)
            }
        }
    }
    var presenter : RepoListPresenterProtocol?
    internal var searchController: UISearchController = UISearchController(searchResultsController: nil)
    
    var repositoriesList = [GRRepositoryViewModel](){
        didSet{
            repositoryTableView.reloadData()
        }
    }
    
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.viewDidLoad()
        repositoryTableView.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Methods
    
    // MARK: - Init
    
    /**
     Initialize an instance of Repositories List ViewController
     - returns: GRRepositoriesListViewController Object
     */
    public static func create() -> GRRepositoriesListViewController {
        
        return UIStoryboard(name: StoryboardIdentifier.mainStoryboardIdentifier, bundle: Bundle.main).instantiateViewController(withIdentifier: StoryboardIdentifier.repositoriesListVCIdentifier)as! GRRepositoriesListViewController
    }
    
    //MARK:- Private Methods
    private func setupTableView () {
        repositoryTableView.estimatedRowHeight = UITableViewConstants.estimatedRowHeight
        repositoryTableView.rowHeight = UITableViewAutomaticDimension
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.delegate = self
        definesPresentationContext = true
        repositoryTableView.tableHeaderView = searchController.searchBar
    }
}
