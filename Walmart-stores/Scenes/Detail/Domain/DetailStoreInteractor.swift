//
//  DetailStoreInteractor.swift
//  Walmart-stores
//
//  Created by Nivardo Ibarra on 5/20/20.
//  Copyright (c) 2020 Nivardo Ibarra. All rights reserved.
//

import UIKit

protocol DetailStoreBusinessLogic {
    func doFetch(request: DetailStoreUseCases.Fetch.Request)
}

protocol DetailStoreDataStore {
    var detail: Store? { get set }
}

class DetailStoreInteractor: DetailStoreBusinessLogic, DetailStoreDataStore {
    
    // MARK: - Properties
    var presenter: DetailStorePresentationLogic?
    var worker: DetailStoreWorker?
    var detail: Store?
    
    // MARK: -
    func doFetch(request: DetailStoreUseCases.Fetch.Request) {
        worker = DetailStoreWorker()
        worker?.fetchingData()
        
        let response = DetailStoreUseCases.Fetch.Response()
        presenter?.presentResponse(response: response)
    }
}
