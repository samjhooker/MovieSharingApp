//
//  LeftViewController.swift
//  MovieSharingApp
//
//  Created by Samuel Hooker on 14/02/15.
//  Copyright (c) 2015 Jocus Interactive. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {
    
    
    var feedViewController: UIViewController!
    var loginViewController: UIViewController!
    var movieViewController: UIViewController!
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let loginViewController = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as LoginViewController
        self.loginViewController = UINavigationController(rootViewController: loginViewController)
        
        let feedViewController = storyboard.instantiateViewControllerWithIdentifier("FeedViewController") as FeedViewController
        self.feedViewController = UINavigationController(rootViewController: feedViewController)
        
        let movieViewController = storyboard.instantiateViewControllerWithIdentifier("MovieViewController") as MovieViewController
        self.movieViewController = UINavigationController(rootViewController: movieViewController)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginButtonPressed(sender: AnyObject) {
        

        self.slideMenuController()?.changeMainViewController(self.loginViewController, close: true)
        
        
    }
    @IBAction func feedButtonPressed(sender: AnyObject) {
        
        self.slideMenuController()?.changeMainViewController(self.feedViewController, close: true)
    }
    
    @IBAction func logoutButtonPressed(sender: AnyObject) {
        
        PFUser.logOut()
        self.slideMenuController()?.changeMainViewController(self.loginViewController, close: true)
        
    }

    @IBAction func searchButtonPressed(sender: AnyObject) {
        self.slideMenuController()?.changeMainViewController(self.movieViewController, close: true)
    }
}
