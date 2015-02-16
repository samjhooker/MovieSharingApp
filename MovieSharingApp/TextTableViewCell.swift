//
//  TextTableViewCell.swift
//  MovieSharingApp
//
//  Created by Samuel Hooker on 14/02/15.
//  Copyright (c) 2015 Jocus Interactive. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    
    var object:PFObject!
    
    @IBOutlet weak var timeAgoLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var message: UITextView!
    override func layoutSubviews() {
        super.awakeFromNib()
        // Initialization code
        
        
        usernameLabel.text = object["user"] as? String
        message.text = object.objectForKey("message") as String
        timeAgoLabel.text = Global.calculateTimeDifference(object.objectForKey("date") as NSDate)
        
        
        
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
