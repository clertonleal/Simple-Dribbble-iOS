//
//  Shot.swift
//  Simple Dribbble
//
//  Created by Clerton Leal on 25/06/15.
//  Copyright (c) 2015 Clerton Leal. All rights reserved.
//

import Foundation
import ObjectMapper

struct Shot: Mappable {
    var id: Int?
    var title: String?
    var description: String?
    var url: String?
    var views_count: Int?
    var image_url: String?
    var image_teaser_url: String?
    var image_400_url: String?
    var player: Player?
    
    init?(_ map: Map) {
        mapping(map)
    }
    
    init? () {}
    
    mutating func mapping(map: Map) {
        id                <- map["id"]
        title             <- map["title"]
        description       <- map["description"]
        url               <- map["url"]
        views_count       <- map["views_count"]
        image_url         <- map["image_url"]
        image_teaser_url  <- map["image_teaser_url"]
        image_400_url     <- map["image_400_url"]
        player            <- (map["player"], PlayerTransformer())
    }
}