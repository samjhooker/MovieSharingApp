//
//  FriendsViewController.swift
//  MovieSharingApp
//
//  Created by Samuel Hooker on 28/03/15.
//  Copyright (c) 2015 Jocus Interactive. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var myFriends:[PFUser] = []
    var searchFriends:[PFUser] = []
    
    @IBOutlet weak var myFriendsTableView: UITableView!
    @IBOutlet weak var findFriendsTableVIew: UITableView!
    @IBOutlet weak var friendSearchTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFriends()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var searchButton: UIButton!

    @IBAction func seachButtonPressed(sender: AnyObject) {
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == myFriendsTableView{
            return myFriends.count
        }else{
            return self.searchFriends.count
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView == myFriendsTableView{
            var cell = tableView.dequeueReusableCellWithIdentifier("FriendCell") as FriendsTableViewCell
            cell.user = self.myFriends[indexPath.row]
            return cell
        }else{
            
            return UITableViewCell()
        }
    }
    
    
    
    
    
    @IBAction func menuButtonPressed(sender: AnyObject) {
        self.slideMenuController()?.openLeft()
    }
    
    
    func fetchFriends(){
        
        if PFUser.currentUser() != nil{
            let friendsList = PFUser.currentUser()["friends"] as [String]
            println(friendsList)
            var queryList:[PFQuery] = []
            for i in friendsList{
                var query = PFQuery(className: "User")
                query.whereKey("username", equalTo: i)
                queryList.append(query)
                
            }
            println("querying")
            var query2 = PFQuery.orQueryWithSubqueries(queryList)
            query2.findObjectsInBackgroundWithBlock {
                (results: [AnyObject]!, error: NSError!) -> Void in
                if error == nil {
                    
                    self.myFriends = results as [PFUser]
                    self.myFriendsTableView.reloadData()
                    println("table updated")
                }else{
                    println(error)
                }
            }
            
        }
        
        
        
        
        
    }
    

}
