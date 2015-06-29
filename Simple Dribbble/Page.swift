//
//  Page.swift
//  Simple Dribbble
//
//  Created by Clerton Leal on 27/06/15.
//  Copyright (c) 2015 Clerton Leal. All rights reserved.
//

import Foundation
import ObjectMapper

struct Page: Mappable {
    var page: String?
    var per_page: Int?
    var shots: [Shot]?
    
    init?(_ map: Map) {
        mapping(map)
    }
    
    init? () {}
    
    mutating func mapping(map: Map) {
        page        <- map["page"]
        per_page    <- map["per_page"]
        shots       <- (map["shots"], ShotsTransformer())
    }

}