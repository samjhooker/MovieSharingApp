//
//  LoginViewController.swift
//  MovieSharingApp
//
//  Created by Samuel Hooker on 13/02/15.
//  Copyright (c) 2015 Jocus Interactive. All rights reserved.
//


import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var slider: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.slider.hidden = true
        self.slideMenuController()?.openLeft()
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
    
    @IBAction func loginButtonPressed(sender: AnyObject) {
        
        if passwordTextField.text == "" || nameTextField.text == "" {
            
            Global.showAlert("Hey Yo", message:"you need a username and a password, if you do not have one, tap 'create account' button", view:self)
            
        }else{
            //try login
            
            PFUser.logInWithUsernameInBackground(nameTextField.text, password:passwordTextField.text) {
                (user: PFUser!, error: NSError!) -> Void in
                if user != nil {
                    
                    //self.performSegueWithIdentifier("loginToFeed", sender: nil)
                    
                    Global.showAlert("Logged In", message:"", view: self)
                    self.slider.hidden = false
                    
                } else {
                    // The login failed. Check error to see why.
                    
                    //var err = error.userInfo["error"] as NSString
                    
                    Global.showAlert("Hey Yo", message:"\(error)", view:self)
                    
                }
            }
            
            
        }
        
        
    }
}
