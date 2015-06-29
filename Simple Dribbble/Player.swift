//
//  Player.swift
//  Simple Dribbble
//
//  Created by Clerton Leal on 27/06/15.
//  Copyright (c) 2015 Clerton Leal. All rights reserved.
//

import Foundation
import ObjectMapper

struct Player: Mappable {
    
    var id: Int?
    var name: String?
    var avatar_url: String?
    var username: String?
    
    init?(_ map: Map) {
        mapping(map)
    }
    
    init? () {}
    
    mutating func mapping(map: Map) {
        id           <- map["id"]
        name         <- map["name"]
        avatar_url   <- map["avatar_url"]
        username     <- map["username"]
    }
    
}
