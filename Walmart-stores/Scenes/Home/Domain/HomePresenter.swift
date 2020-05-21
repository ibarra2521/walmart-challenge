//
//  HomePresenter.swift
//  Walmart-stores
//
//  Created by Nivardo Ibarra on 5/20/20.
//  Copyright (c) 2020 Nivardo Ibarra. All rights reserved.
//

import UIKit

protocol HomePresentationLogic {
    func presentResponse(response: HomeUseCases.Fetch.Response)
    func presentDetialProduct(response: HomeUseCases.Detail.Response)
    func displayError(message: String) 
}

class HomePresenter: HomePresentationLogic {
    
    // MARK: - Properties
    weak var viewController: HomeDisplayLogic?
    
    // MARK: -
    func presentResponse(response: HomeUseCases.Fetch.Response) {
        //let viewModel = HomeUseCases.Fetch.ViewModel()
        let viewModel = HomeUseCases.Fetch.ViewModel(store: response.store)
        viewController?.displayData(viewModel: viewModel)
    }
    
    func presentDetialProduct(response: HomeUseCases.Detail.Response) {
        let viewModel = HomeUseCases.Detail.ViewModel()
        viewController?.displayDetail(viewModel: viewModel)
    }
    
    func displayError(message: String) {
        viewController?.displayError(message: message)
    }
}
