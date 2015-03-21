//
//  FriendsTableViewCell.swift
//  MovieSharingApp
//
//  Created by Samuel Hooker on 21/03/15.
//  Copyright (c) 2015 Jocus Interactive. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    var user:PFUser!
    var indexy = 0
    var found = false
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    override func layoutSubviews() {
        //hopefully called when the cell is loaded
        
        nameLabel.text = user.objectForKey("username") as? String
        
        
        for i in PFUser.currentUser()["friends"] as [String]{
            if i == user.objectForKey("username") as NSString{
                found = true
                break;
            }
            self.indexy += 1
        }
        if !found{
            addButton.setTitle("unAdd", forState: .Normal)
            addButton.backgroundColor = UIColor.lightGrayColor()
            
        }
            
            
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func addButtonPressed(sender: AnyObject) {
        
        var currentUser = PFUser.currentUser()
        
        currentUser.fetchInBackgroundWithBlock { (object, error) -> Void in
            if error != nil{
                println(error)
            }else{
                
                if !self.found{
                    var friendsList = object.objectForKey("friends") as [String]
                    friendsList.append(self.user.objectForKey("username") as String)
                    object["friends"] = friendsList
                    self.addButton.setTitle("unAdd", forState: .Normal)
                    object.save()
                    //Global.showAlert("Movie Watched", message: "Swell", view: self)
                }else{
                    var friendsList = object.objectForKey("friends") as [String]
                    friendsList.removeAtIndex(self.indexy)
                    object["friends"] = friendsList
                    self.addButton.setTitle("Add", forState: .Normal)
                    self.addButton.backgroundColor = UIColor.lightGrayColor()
                    object.save()
                    //Global.showAlert("Movie already watched", message: "", view: self)
                }
            }
        
    }
}
}
