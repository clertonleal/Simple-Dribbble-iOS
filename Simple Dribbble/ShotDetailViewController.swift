//
//  ShotDetailViewController.swift
//  Simple Dribbble
//
//  Created by Clerton Leal on 25/06/15.
//  Copyright (c) 2015 Clerton Leal. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ShotDetailViewController: UIViewController {
    
    @IBOutlet var text: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var viewCount: UILabel!
    @IBOutlet var authorName: UILabel!
    @IBOutlet var shotDescription: UILabel!
    @IBOutlet var authorAvatar: UIImageView!
    
    var shot: Shot!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        text.text = shot.title!
        viewCount.text = String(shot.views_count!)
        authorName.text = shot.player!.name!
        shotDescription.text = getDescription(shot)
        authorAvatar.kf_setImageWithURL(NSURL(string: shot.player!.avatar_url!)!)
        image.kf_setImageWithURL(NSURL(string: shot.image_url!)!)
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
}
