//
//  ShotTransformer.swift
//  Simple Dribbble
//
//  Created by Clerton Leal on 27/06/15.
//  Copyright (c) 2015 Clerton Leal. All rights reserved.
//

import Foundation
import ObjectMapper

class ShotsTransformer: TransformType {
    typealias Object = [Shot]
    typealias JSON = AnyObject
    
    init() {}
    
    func transformFromJSON(value: AnyObject?) -> [Shot]? {
        return Mapper<Shot>().mapArray(value)
    }
    
    func transformToJSON(value: [Shot]?) -> AnyObject? {
        if let date = value {
            return Mapper().toJSONArray(value!)
        }
        
        return nil
    }
}
