//
//  ViewController.swift
//  Simple Dribbble
//
//  Created by Clerton Leal on 25/06/15.
//  Copyright (c) 2015 Clerton Leal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    var shots: [Shot] = []
    var selectedShot: Shot!
    var actualPage = 1
    var isLoading = false
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var progressView: UIView!
    @IBOutlet var loadingView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        progressView.hidden = false
        DribbbleService().retrievePage(actualPage) { page in
            self.actualPage++
            self.shots = page.shots!
            self.progressView.hidden = true
            self.tableView.reloadData()
        }
        
        tableView.registerNib(UINib(nibName: "ShotTableViewCell", bundle:nil), forCellReuseIdentifier: "Cell")
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = scrollView.contentOffset.y
        var maxOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if (maxOffset - offset) <= 40 && progressView.hidden && !isLoading {
            isLoading = true
            loadingView.hidden = false
            DribbbleService().retrievePage(actualPage) { page in
                self.isLoading = false
                self.loadingView.hidden = true
                self.actualPage++
                self.shots.extend(page.shots!)
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shots.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ShotTableViewCell
        let shot = shots[indexPath.row]
        cell.title.text = shot.title
        cell.imageShot.kf_setImageWithURL(NSURL(string: shot.image_url!)!)
        cell.viewCount.text = String(shot.views_count!)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        selectedShot = shots[indexPath.row]
        performSegueWithIdentifier("Detail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Detail" {
            let controller = segue.destinationViewController as! ShotDetailViewController
            controller.shot = selectedShot
        }
    }
    
    func configureTableView() {
        tableView.rowHeight = 302
        tableView.estimatedRowHeight = 302
    }
    
    

}

