//
//  HomeUseCases.swift
//  Walmart-stores
//
//  Created by Nivardo Ibarra on 5/20/20.
//  Copyright (c) 2020 Nivardo Ibarra. All rights reserved.
//

import UIKit

enum HomeUseCases {
    
    // MARK: - Use cases
    enum Fetch {
        
        struct Request { }
        
        struct Response {
            let store: [Store]
        }
        
        struct ViewModel {
            let store: [Store]
        }
    }
    
    // MARK: - Use cases - Detail
    enum Detail {
        
        struct Request {
            let store: Store
        }
        
        struct Response { }

        struct ViewModel { }
    }
}
