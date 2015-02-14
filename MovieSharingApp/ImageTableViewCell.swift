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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
        let image = object.objectForKey("image")[0] as String //string url
        
        let url = NSURL(string: image)
        let data = NSData(contentsOfURL: url!)
        if data != nil{
            imageOfMovie.image = UIImage(data: data!)
        }
        
        messageTextView.text = object.objectForKey("message")[0] as String
        
        timeAgoLabel.text = Global.calculateTimeDifference(object.objectForKey("date")[0] as NSDate) as String
        usernameTextField.text = object.objectForKey("user").username
        
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    

    

}
