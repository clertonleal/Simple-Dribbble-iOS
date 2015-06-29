//
//  PlayerTransformer.swift
//  Simple Dribbble
//
//  Created by Clerton Leal on 27/06/15.
//  Copyright (c) 2015 Clerton Leal. All rights reserved.
//

import Foundation
import ObjectMapper

class PlayerTransformer: TransformType {
    typealias Object = Player
    typealias JSON = AnyObject
    
    init() {}
    
    func transformFromJSON(value: AnyObject?) -> Player? {
        return Mapper<Player>().map(value)
    }
    
    func transformToJSON(value: Player?) -> AnyObject? {
        if let date = value {
            return Mapper().toJSON(value!)
        }
        
        return nil
    }
}
