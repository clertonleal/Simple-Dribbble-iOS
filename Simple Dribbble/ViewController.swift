//
//  ViewController.swift
//  Simple Dribbble
//
//  Created by Clerton Leal on 25/06/15.
//  Copyright (c) 2015 Clerton Leal. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var shots: [Shot]!
    var selectedShot: Shot!
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        var shot1 = Shot()!
        shot1.title = "t1"
        shot1.description = "d1"
        var shot2 = Shot()!
        shot2.title = "t2"
        shot2.description = "d2"
        shots = [shot1, shot2]
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
        
        cell.name.text = shots[indexPath.row].title
        cell.owner.text = shots[indexPath.row].description
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
    
    

}

