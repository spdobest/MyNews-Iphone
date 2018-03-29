//
//  RegisterData.swift
//  MyNews App
//
//  Created by sibaprasad on 29/03/18.
//  Copyright © 2018 SP inc. All rights reserved.
//

import Foundation
class RegisterData  : Codable {
    let status : String?
    let uid : Int?
    let msg : String?
    let oTP : String?
    let state : String?
    let name : String?
    let profile_pic : String?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case uid = "uid"
        case msg = "msg"
        case oTP = "OTP"
        case state = "state"
        case name = "name"
        case profile_pic = "profile_pic"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        uid = try values.decodeIfPresent(Int.self, forKey: .uid)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        oTP = try values.decodeIfPresent(String.self, forKey:.oTP)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        profile_pic = try values.decodeIfPresent(String.self, forKey: .profile_pic)
    }
    
}
