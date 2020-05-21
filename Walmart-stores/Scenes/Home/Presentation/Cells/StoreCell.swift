//
//  StoreCell.swift
//  Walmart-stores
//
//  Created by Nivardo Ibarra on 5/20/20.
//  Copyright © 2020 Nivardo Ibarra. All rights reserved.
//

import UIKit

class StoreCell: UITableViewCell {

    // MARK: - IBOultets
    @IBOutlet weak var storeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(store: Store) {
        storeLabel.text = store.name
    }
}
