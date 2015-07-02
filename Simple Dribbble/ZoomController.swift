//
//  ZoomController.swift
//  Simple Dribbble
//
//  Created by Clerton Leal on 01/07/15.
//  Copyright (c) 2015 Clerton Leal. All rights reserved.
//

import Foundation
import UIKit

class ZoomController: UIViewController, UIScrollViewDelegate {
    
    let dribbbleService = DribbbleService()
    var shot: Shot!
    
    @IBOutlet weak var imageZoom: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageZoom.kf_setImageWithURL(NSURL(string: shot.image_url!)!, placeholderImage: UIImage(named: "dribbble_loading.png"))
        scrollView.delegate = self
        scrollView.zoomScale = 0.7
        navigationItem.title = shot.title
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageZoom
    }
    
}
