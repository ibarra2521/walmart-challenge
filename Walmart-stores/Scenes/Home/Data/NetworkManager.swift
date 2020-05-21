//
//  NetworkManager.swift
//  Walmart-stores
//
//  Created by Nivardo Ibarra on 5/20/20.
//  Copyright © 2020 Nivardo Ibarra. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://www.walmartmobile.com.mx/walmart-services/mg/address/storeLocatorCoordinates"
    
    func getStores(completationHandler: @escaping StoreResponseHandler) {
        let url = URL(string: baseURL)!// REMOVE FORCE UNWRAPPING
        Spinner.start()
        let  dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                Spinner.stop()
                guard let data = data else {
                    //completationHandler(.failure(.decodingError))
                    completationHandler(nil, nil)
                    return
                }
                do {
                    //guard let resp = try? JSONDecoder().decode(Response.self, from: data), let albums = resp.feed?.results else {
                    guard let resp = try? JSONDecoder().decode(Response.self, from: data), let stores = resp.responseArray else {
                        //completion(.failure(.decodingError))
                        completationHandler(error, nil)
                        return
                    }
                    //completationHandler(nil, .success(stores))
                    completationHandler(nil, stores)// NEEDS to check to use .success(stores)
                }
            }
        }
        dataTask.resume()
    }
}
