//
//  HomeRouter.swift
//  Walmart-stores
//
//  Created by Nivardo Ibarra on 5/20/20.
//  Copyright (c) 2020 Nivardo Ibarra. All rights reserved.
//

import UIKit

@objc protocol HomeRoutingLogic {
    func routeToDetail()
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    
    // MARK: - Properties
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    func routeToDetail() {
        let destinationVC = DetailStoreViewController()
        let destinationDS = destinationVC.router?.dataStore
        if let dataStore = dataStore, var destinationDS = destinationDS {
            passDataToSomewhere(source: dataStore, destination: &destinationDS)
        }
        if let viewController = viewController {
            navigateToSomewhere(source: viewController, destination: destinationVC)
        }
    }
    
    // MARK: - Navigation
    func navigateToSomewhere(source: HomeViewController, destination: DetailStoreViewController) {
        source.show(destination, sender: nil)
    }

    // MARK: - Passing data
    func passDataToSomewhere(source: HomeDataStore, destination: inout DetailStoreDataStore) {
        destination.detail = source.detailStore
    }
}
