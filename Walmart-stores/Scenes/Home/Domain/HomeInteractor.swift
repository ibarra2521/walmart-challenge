//
//  HomeInteractor.swift
//  Walmart-stores
//
//  Created by Nivardo Ibarra on 5/20/20.
//  Copyright (c) 2020 Nivardo Ibarra. All rights reserved.
//

import UIKit

typealias StoreResponseHandler = (_ error: Error?, _ stores: [Store]?) -> ()

protocol HomeBusinessLogic {
    func doFetch(request: HomeUseCases.Fetch.Request)
    func doFetchDetail(request: HomeUseCases.Detail.Request)
}

protocol HomeDataStore {
    var detailStore: Store? { get set }
}

enum NetworkError: Error {
    case domainError
    case decodingError
}

typealias StoreResponse = (Result<[Store], NetworkError>) -> ()

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    
    // MARK: - Properties
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?
    var detailStore: Store?
    
    // MARK: -s
    func doFetch(request: HomeUseCases.Fetch.Request) {
        worker = HomeWorker()
        worker?.fetchingData(completionHandler: { (error: Error?, stores: [Store]?) in
            if let error = error {
                self.presenter?.displayError(message: error.localizedDescription)
            } else {
                if let stores = stores {
                    let response = HomeUseCases.Fetch.Response(store: stores)
                    self.presenter?.presentResponse(response: response)
                }
            }
        })
    }
    
    func doFetchDetail(request: HomeUseCases.Detail.Request) {
        let store = request.store
        detailStore = store
        let response = HomeUseCases.Detail.Response()
        presenter?.presentDetialProduct(response: response)
    }
}
