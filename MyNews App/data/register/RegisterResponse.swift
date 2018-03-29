//
//  RegisterResponse.swift
//  MyNews App
//
//  Created by sibaprasad on 29/03/18.
//  Copyright © 2018 SP inc. All rights reserved.
//

import Foundation
class RegisterResponse: Codable {
    let data : [RegisterData]?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([RegisterData].self, forKey: .data)
    }
    
}
