//
//  movieDetailViewController.swift
//  MovieSharingApp
//
//  Created by Samuel Hooker on 26/02/15.
//  Copyright (c) 2015 Jocus Interactive. All rights reserved.
//

import UIKit

class movieDetailViewController: UIViewController {
    
    
    var imdbID:String!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var castLabel: UILabel!
    @IBOutlet weak var plotTextView: UITextView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if imdbID != nil{
            self.getMovieInfo()
        }else{
            println("no id imported")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func importantPeopleButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func spoilItButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func watchedItButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    func getMovieInfo(){
        //creates and updates api data
        
        
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
                if jsonResult["Released"] != nil{
                    self.releaseDateLabel.text = jsonResult["Released"] as? String
                }
                if jsonResult["Director"] != nil{
                    var t = jsonResult["Director"] as String
                    
                    t = t.stringByReplacingOccurrencesOfString("Optional(\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    t = t.stringByReplacingOccurrencesOfString("\")", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    
                    self.directorLabel.text = "DIRECTOR - \(t)"
                }
                if jsonResult["Actors"] != nil{
                    var t = jsonResult["Actors"] as String
                    
                    t = t.stringByReplacingOccurrencesOfString("Optional(\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    t = t.stringByReplacingOccurrencesOfString("\")", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    
                    self.castLabel.text = "CAST INCLUDES - \(t)"
                }
                if jsonResult["Plot"] != nil{
                    var t = jsonResult["Plot"] as String
                    
                    t = t.stringByReplacingOccurrencesOfString("Optional(\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    t = t.stringByReplacingOccurrencesOfString("\")", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    
                    self.plotTextView.text = "SYNOPSIS - \(t)"
                }
                if jsonResult["Metascore"] != nil{
                    var t = jsonResult["Metascore"] as String
                    
                    t = t.stringByReplacingOccurrencesOfString("Optional(\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    t = t.stringByReplacingOccurrencesOfString("\")", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    
                    self.scoreLabel.text = "\(t)"
                }
                if jsonResult["Poster"] != nil{
                    var t = jsonResult["Poster"] as? String
                    let url = NSURL(string: t!)
                    let data = NSData(contentsOfURL: url!)
                    if data != nil{
                        self.imageView.image = UIImage(data: data!)
                        
                        
                    }
                    
                    
                    
                }
                
                
                
                
                
            })
            
            
        })
        // 5
        jsonQuery.resume()
        
    }
    

}
