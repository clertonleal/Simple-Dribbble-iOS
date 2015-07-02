//
//  ShotDetailViewController.swift
//  Simple Dribbble
//
//  Created by Clerton Leal on 25/06/15.
//  Copyright (c) 2015 Clerton Leal. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class ShotDetailViewController: UIViewController {
    
    let dribbbleService = DribbbleService()
    
    @IBOutlet var text: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var viewCount: UILabel!
    @IBOutlet var authorName: UILabel!
    @IBOutlet var shotDescription: UILabel!
    @IBOutlet var authorAvatar: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var shot: Shot!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.text = shot.title!
        viewCount.text = String(shot.views_count!)
        authorName.text = shot.player!.name!
        shotDescription.text = dribbbleService.getDescription(shot)
        authorAvatar.kf_setImageWithURL(NSURL(string: shot.player!.avatar_url!)!)
        image.kf_setImageWithURL(NSURL(string: shot.image_url!)!, placeholderImage: UIImage(named: "dribbble_loading.png"))
        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: 1500)
        navigationItem.title = shot.title
    }
    
}
