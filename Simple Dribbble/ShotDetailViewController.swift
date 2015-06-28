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
    
    var shot: Shot!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.text = shot.title!
        viewCount.text = String(shot.views_count!)
        downloadImage(shot.image_url!)
    }
    
    func downloadImage(imageUrl: String) {
        image.kf_setImageWithURL(NSURL(string: imageUrl)!)
    }
    
}
