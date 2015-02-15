//
//  CreatePostViewController.swift
//  MovieSharingApp
//
//  Created by Samuel Hooker on 15/02/15.
//  Copyright (c) 2015 Jocus Interactive. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var movieList:[(name:String, imdbID:String)] = []
    
    
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var movieSearchTextField: UITextField!
    @IBOutlet weak var imageOfMovie: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    @IBAction func postButtonPressed(sender: AnyObject) {
    }
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var searchMovieButtonPressed: UIButton!

    @IBAction func searchMovieButtonTapped(sender: AnyObject) {
        
        if movieSearchTextField.text != ""{
            
           
                
            self.movieList = [] as [(name:String, imdbID:String)]
            
            let nameString = movieSearchTextField.text.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.LiteralSearch, range: nil)
            let urlString = "http://www.omdbapi.com/?s=" + nameString
            
            
            ///////////////
            
            var result:NSDictionary!
            
            
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
                //let jsonDate: String! = jsonResult["date"] as NSString
                //let jsonTime: String! = jsonResult["time"] as NSString
                
                
                dispatch_async(dispatch_get_main_queue(), {
                    result = jsonResult as NSDictionary
                    println(jsonResult)
                    self.gotData(result)
                    
                })
                
                
            })
            // 5
            jsonQuery.resume()
            
            ///////////////////
            
            
            
                
                    
                    
                    
                
                
        }
            
            
            
            
    }
    
        
        
        
        
    



    func gotData(result:NSDictionary){
        
        if result.count == 0{
            println("retuned data is nil")
        }else{
            
            if result["Search"] == nil{
                println("no results found")
            }else{
                var results = result["Search"] as [NSDictionary]
                
                for result in results as [NSDictionary]{
                    var name = result["Title"] as String
                    var year = result["Year"] as String
                    var imdbID = result["imdbID"] as String
                    
                    //var tuple: (name:String, imdbID:String) = (name:"\(name), (\(year))", imdbID:"\(id)")
                    self.movieList.append(name:"\(name), (\(year))", imdbID:"\(imdbID)")
                }
                tableView.reloadData()
            
            
            
            }
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel?.text = movieList[indexPath.row].name as String
        
        return cell
        
    }
        
        
    
        
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
