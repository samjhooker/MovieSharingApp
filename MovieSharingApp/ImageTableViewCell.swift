//
//  ImageTableViewCell.swift
//  MovieSharingApp
//
//  Created by Samuel Hooker on 14/02/15.
//  Copyright (c) 2015 Jocus Interactive. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    
    var object:PFObject!
    
    @IBOutlet weak var imageOfMovie: UIImageView!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var timeAgoLabel: UILabel!
    //@IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var usernameTextField: UILabel!
    override func layoutSubviews() {
        super.awakeFromNib()
        // Initialization code
        
    
        println(object.objectForKey("image") as String)
        let image = object.objectForKey("image") as String //string url
        
        let url = NSURL(string: image)
        let data = NSData(contentsOfURL: url!)
        if data != nil{
            imageOfMovie.image = UIImage(data: data!)
        }
        
        messageTextView.text = object.objectForKey("message") as String
        
        timeAgoLabel.text = Global.calculateTimeDifference(object.objectForKey("date") as NSDate) as String
        //var user = object["user"] as PFUser
        usernameTextField.text = object["user"] as? String
        
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    

    

}
