//
//  DetailStorePresenter.swift
//  Walmart-stores
//
//  Created by Nivardo Ibarra on 5/20/20.
//  Copyright (c) 2020 Nivardo Ibarra. All rights reserved.
//

import UIKit

protocol DetailStorePresentationLogic {
    func presentResponse(response: DetailStoreUseCases.Fetch.Response)
}

class DetailStorePresenter: DetailStorePresentationLogic {
    
    // MARK: - Properties
    weak var viewController: DetailStoreDisplayLogic?
    
    // MARK: -
    func presentResponse(response: DetailStoreUseCases.Fetch.Response) {
        let viewModel = DetailStoreUseCases.Fetch.ViewModel()
        viewController?.displayData(viewModel: viewModel)
    }    
}
