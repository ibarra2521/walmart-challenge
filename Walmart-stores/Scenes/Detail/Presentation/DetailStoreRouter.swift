//
//  DetailStoreRouter.swift
//  Walmart-stores
//
//  Created by Nivardo Ibarra on 5/20/20.
//  Copyright (c) 2020 Nivardo Ibarra. All rights reserved.
//

import UIKit

@objc protocol DetailStoreRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol DetailStoreDataPassing {
    var dataStore: DetailStoreDataStore? { get }
}

class DetailStoreRouter: NSObject, DetailStoreRoutingLogic, DetailStoreDataPassing {
    
    // MARK: - Properties
    weak var viewController: DetailStoreViewController?
    var dataStore: DetailStoreDataStore?
    
//    // MARK: - Navigation
//    func navigateToSomewhere(source: DetailStoreViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }
//
//    // MARK: - Passing data
//    func passDataToSomewhere(source: DetailStoreDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
