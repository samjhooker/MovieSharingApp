//
//  CollectionViewCell.swift
//  MovieSharingApp
//
//  Created by Samuel Hooker on 3/03/15.
//  Copyright (c) 2015 Jocus Interactive. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    var imdbID:String!
    
    override func layoutSubviews() {
        
        let urlString = "http://www.omdbapi.com/?i=" + self.imdbID
        
        
        ///////////////
        
        
        
        // 1
        let urlAsString = urlString
        let url = NSURL(string: urlAsString)!
        let urlSession = NSURLSession.sharedSession()
        
        //2
        let jsonQuery = urlSession.dataTaskWithURL(url, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                println(error.localizedDescription)
            }
            var err: NSError?
            
            // 3
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
            if (err != nil) {
                println("JSON Error \(err!.localizedDescription)")
                
            }
            
            // 4
            
            
            
            dispatch_async(dispatch_get_main_queue(), {
                
                //update page
                
                if jsonResult["Title"] != nil{
                    self.nameLabel.text = jsonResult["Title"] as? String
                }
                
                if jsonResult["Poster"] != nil{
                    var t = jsonResult["Poster"] as? String
                    let url = NSURL(string: t!)
                    let data = NSData(contentsOfURL: url!)
                    if data != nil{
                        self.image.image = UIImage(data: data!)
                        
                        
                    }
                    
                    
                    
                }
                
                
                
                
                
            })
            
            
        })
        // 5
        jsonQuery.resume()
        
        
    }
    

    
}
