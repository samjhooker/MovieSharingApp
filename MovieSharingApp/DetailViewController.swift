//
//  DetailViewController.swift
//  MovieSharingApp
//
//  Created by Samuel Hooker on 16/02/15.
//  Copyright (c) 2015 Jocus Interactive. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var object:PFObject!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var message: UITextView!
    
    @IBOutlet weak var commentButtonPressed: UIButton!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var aboutMovieButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if object["text"] as Int == 1{
            imageView.hidden = true
            aboutMovieButton.hidden = true
        }else{
            let image = object.objectForKey("image") as String //string url
            
            let url = NSURL(string: image)
            let data = NSData(contentsOfURL: url!)
            if data != nil{
                imageView.image = UIImage(data: data!)
            }
            
        }
        
        message.text = object.objectForKey("message") as String
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func commentButtonTapped(sender: AnyObject) {
    }

    

    @IBAction func aboutMovieButtonPressed(sender: AnyObject) {
        
        self.performSegueWithIdentifier("detailToAboutMovieSegue", sender: object.objectForKey("imdbId") as String)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailToAboutMovieSegue"{
            var scene = segue.destinationViewController as movieDetailViewController
            scene.imdbID = sender as String
            
        }
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    
    
    
    
}
