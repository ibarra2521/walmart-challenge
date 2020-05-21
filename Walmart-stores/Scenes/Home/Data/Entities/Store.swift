//
//  LocationStore.swift
//  Walmart-stores
//
//  Created by Nivardo Ibarra on 5/20/20.
//  Copyright © 2020 Nivardo Ibarra. All rights reserved.
//

import Foundation

struct Store: Codable {

  enum CodingKeys: String, CodingKey {
    case zipCode
    case businessID
    case id
    case storeID
    case opens
    case name
    case message
    case lonPoint
    case latPoint
    case manager
    case codeMessage
    case latSpan
    case address
    case telephone
  }

  var zipCode: String?
  var businessID: String?
  var id: Int?
  var storeID: String?
  var opens: String?
  var name: String?
  var message: String?
  var lonPoint: String?
  var latPoint: String?
  var manager: String?
  var codeMessage: Int?
  var latSpan: String?
  var address: String?
  var telephone: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    zipCode = try container.decodeIfPresent(String.self, forKey: .zipCode)
    businessID = try container.decodeIfPresent(String.self, forKey: .businessID)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    storeID = try container.decodeIfPresent(String.self, forKey: .storeID)
    opens = try container.decodeIfPresent(String.self, forKey: .opens)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    message = try container.decodeIfPresent(String.self, forKey: .message)
    lonPoint = try container.decodeIfPresent(String.self, forKey: .lonPoint)
    latPoint = try container.decodeIfPresent(String.self, forKey: .latPoint)
    manager = try container.decodeIfPresent(String.self, forKey: .manager)
    codeMessage = try container.decodeIfPresent(Int.self, forKey: .codeMessage)
    latSpan = try container.decodeIfPresent(String.self, forKey: .latSpan)
    address = try container.decodeIfPresent(String.self, forKey: .address)
    telephone = try container.decodeIfPresent(String.self, forKey: .telephone)
  }

}
