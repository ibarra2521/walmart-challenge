//
//  HomeViewController+TableView.swift
//  Walmart-stores
//
//  Created by Nivardo Ibarra on 5/20/20.
//  Copyright © 2020 Nivardo Ibarra. All rights reserved.
//

import UIKit

// MARK: - Data Source and Delegate TableView
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mainTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? StoreCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.setUp(store: stores[indexPath.row])
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let store = stores[indexPath.row]
        let request = HomeUseCases.Detail.Request(store: store)
        interactor?.doFetchDetail(request: request)
    }
}
