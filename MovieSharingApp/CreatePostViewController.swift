//
//  CreatePostViewController.swift
//  MovieSharingApp
//
//  Created by Samuel Hooker on 15/02/15.
//  Copyright (c) 2015 Jocus Interactive. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

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
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
