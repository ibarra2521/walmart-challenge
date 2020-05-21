//
//  Response.swift
//  Walmart-stores
//
//  Created by Nivardo Ibarra on 5/20/20.
//  Copyright © 2020 Nivardo Ibarra. All rights reserved.
//

import Foundation

struct Response: Codable {

  enum CodingKeys: String, CodingKey {
    case codeMessage
    case responseArray
    case message
  }

  var codeMessage: Int?
  var responseArray: [Store]?
  var message: String?


  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    codeMessage = try container.decodeIfPresent(Int.self, forKey: .codeMessage)
    responseArray = try container.decodeIfPresent([Store].self, forKey: .responseArray)
    message = try container.decodeIfPresent(String.self, forKey: .message)
  }

}
