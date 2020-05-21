//
//  HomeViewController.swift
//  Walmart-stores
//
//  Created by Nivardo Ibarra on 5/20/20.
//  Copyright (c) 2020 Nivardo Ibarra. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic: class {
    func displayData(viewModel: HomeUseCases.Fetch.ViewModel)
    func displayDetail(viewModel: HomeUseCases.Detail.ViewModel)
    func displayError(message: String)
}

class HomeViewController: UIViewController/*, HomeDisplayLogic*/ {
    
    // MARK: - Properties
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    let cellIdentifier = "StoreCell"
    var stores = [Store]() //var productArray = [Product]()
    
    // MARK: - IBOutlets
    @IBOutlet weak var mainTableView: UITableView!
    
    // MARK: - Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Extensions
extension HomeViewController {
    
    // MARK: - initialization
    func initialize() {
        mainTableView.rowHeight = UITableView.automaticDimension
        mainTableView.estimatedRowHeight = 300
        mainTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        title = "Walmart Stores"
        loadData()
    }
    
    func loadData() {
        let request = HomeUseCases.Fetch.Request()
        interactor?.doFetch(request: request)
    }

    func displayAlert(title: String? = nil, message: String) {
        let alertController = UIAlertController(title: "Opps something was wrong :(", message: message, preferredStyle: .alert)
        let accept = UIAlertAction(title: "Accept", style: .default)
        alertController.addAction(accept)
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - Implemented MainTableDisplayLogic protocol
extension HomeViewController: HomeDisplayLogic {
    
    func displayError(message: String) {
        displayAlert(message: message)
    }
    
    // MARK: - Implemented HomeDisplayLogic protocol
    func displayData(viewModel: HomeUseCases.Fetch.ViewModel) {
        stores = viewModel.store
        if stores.count > 0 {
            mainTableView.reloadData()
        } else {
            displayAlert(message: "Can you try again later")
        }
    }

    func displayDetail(viewModel: HomeUseCases.Detail.ViewModel) {
        router?.routeToDetail()
    }
}
