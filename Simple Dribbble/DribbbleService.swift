//
//  DribbbleService.swift
//  Simple Dribbble
//
//  Created by Clerton Leal on 26/06/15.
//  Copyright (c) 2015 Clerton Leal. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import UIKit

class DribbbleService {
    func retrievePage(page: Int, callback: (Page) -> Void) {
        Alamofire.request(.GET, "http://api.dribbble.com/shots/popular", parameters: ["page" : page])
            .responseObject { (response: Page?, error: NSError?) in
                callback(response!)
        }
    }
    
    func retrieveShot(shotId: Int, callback: (Shot) -> Void) {
        Alamofire.request(.GET, "http://api.dribbble.com/shots/\(shotId)", parameters: nil)
            .responseObject { (response: Shot?, error: NSError?) in
                callback(response!)
        }
    }
    
    func getDescription(shot: Shot) -> String {
        if let description = shot.description {
            return NSAttributedString(
                data: description.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
                options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                documentAttributes: nil,
                error: nil)!.string
        } else {
            return ""
        }
    }

    func dribbbleColor() -> UIColor {
        return UIColor(red: 0.847, green: 0.106, blue: 0.376, alpha: 1)
    }

}
