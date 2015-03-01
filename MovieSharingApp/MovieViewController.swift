//
//  MovieViewController.swift
//  MovieSharingApp
//
//  Created by Samuel Hooker on 14/02/15.
//  Copyright (c) 2015 Jocus Interactive. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var resultsList: [(name:String, imdbID:String)] = []
    
    
    @IBOutlet weak var movieSearchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
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
    @IBAction func menuButtonPressed(sender: AnyObject) {
        
        self.slideMenuController()?.openLeft()
        
    }
    
    
    
    
    /// table view
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let data = resultsList[indexPath.row]
        let cell = UITableViewCell() as UITableViewCell
        cell.textLabel?.text = data.name as String
        return cell
        
        
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let data = resultsList[indexPath.row].imdbID as String
        self.performSegueWithIdentifier("searchToDetailSegue", sender: data)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var scene = segue.destinationViewController as movieDetailViewController
        scene.imdbID = sender as String
        
    }
    
    
    
    
    
    
    ///search bar 
    
    
    
    
    
    
    @IBOutlet weak var searchButtonPressed: UIButton!
    
    @IBAction func searchButtonTapped(sender: AnyObject) {
        
        if movieSearchTextField.text != ""{
        
            searchButtonPressed.setTitle("Searching", forState: UIControlState.Normal)
            getData(movieSearchTextField.text)
            
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    func getData(myText:String){
        
        let nameString = myText.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.LiteralSearch, range: nil)
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
            
            
            if jsonResult["Search"] == nil{
                println("no results found")
                Global.showAlert("No Movie Found", message: "make sure your spelling is correct", view: self)
            }else{
                var results = jsonResult["Search"] as [NSDictionary]
                
                for result in results{
                    var name = result["Title"] as String
                    var year = result["Year"] as String
                    var imdbID = result["imdbID"] as String
                    
                    //var tuple: (name:String, imdbID:String) = (name:"\(name), (\(year))", imdbID:"\(id)")
                    self.resultsList.append(name:"\(name), (\(year))", imdbID:"\(imdbID)")
                }
                
                
                
                
            }
            
            
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
                
            })
            
            
        })
        // 5
        jsonQuery.resume()
        
        ///////////////////
        
    
    }



}
