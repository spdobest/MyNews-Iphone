//
//  LoginModel.swift
//  MyNews App
//
//  Created by sibaprasad on 25/03/18.
//  Copyright © 2018 SP inc. All rights reserved.
//

import Foundation

struct LoginModel: Decodable {
    let loginData: [LoginData]
    enum CodingKeys : String, CodingKey {
        case loginData = "data"
    }
}

struct LoginData: Codable {
    let message: String
     let name: String
     let pic: String
     let state: Int
     let status: Int
     let total_points: Int
    let uid: Int
    let username: String
}
