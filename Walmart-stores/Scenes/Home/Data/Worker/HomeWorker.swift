//
//  HomeWorker.swift
//  Walmart-stores
//
//  Created by Nivardo Ibarra on 5/20/20.
//  Copyright (c) 2020 Nivardo Ibarra. All rights reserved.
//

import UIKit

class HomeWorker {
    func fetchingData(completionHandler: @escaping StoreResponseHandler) {
        NetworkManager.shared.getStores(completationHandler: { (error: Error?, stores: [Store]?) in
            completionHandler(nil, stores)
        })
    }
}
