//
//  ViewController.swift
//  Simple Dribbble
//
//  Created by Clerton Leal on 25/06/15.
//  Copyright (c) 2015 Clerton Leal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var shots: [Shot] = []
    var selectedShot: Shot!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var progress: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        DribbbleService().retrievePage(1) { page in
            self.shots = page.shots!
            self.tableView.reloadData()
            self.progress.stopAnimating()
        }
        
        tableView.registerNib(UINib(nibName: "ShotTableViewCell", bundle:nil), forCellReuseIdentifier: "Cell")
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
        
        cell.title.text = shots[indexPath.row].title
        cell.imageShot.kf_setImageWithURL(NSURL(string: shots[indexPath.row].image_teaser_url!)!)
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
        tableView.rowHeight = 300
        tableView.estimatedRowHeight = 300
    }
    
    

}

