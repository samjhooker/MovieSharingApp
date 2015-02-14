//
//  FeedViewController.swift
//  MovieSharingApp
//
//  Created by Samuel Hooker on 14/02/15.
//  Copyright (c) 2015 Jocus Interactive. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var data: [PFObject]!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.slideMenuController()?.openLeft()
        // Do any additional setup after loading the view.
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        self.slideMenuController()?.openLeft()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //nul
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
        return self.data.count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if (data[indexPath.row].objectForKey("text")[0] as Int) == 1{
            return 107
        }else{
            return 140
        }
        
    }
    
    
    func getData(){
        
        var query = PFQuery(className: "Posts")
        query.addDescendingOrder("createdAt")
        query.limit = 30
        
        query.findObjectsInBackgroundWithBlock { (objects:[AnyObject]!, error:NSError!) -> Void in
            
            if error == nil {
                
                self.data = objects as? [PFObject]
                self.tableView.reloadData()
                
            }else{
                
                println("error retrieving data: \(error.localizedDescription)")
                
            }
            
        }
    }
    
    
    
    

    

}
