//
//  Global.swift
//  SocialMediaApp
//
//  Created by Samuel Hooker on 31/01/15.
//  Copyright (c) 2015 Jocus Interactive. All rights reserved.
//

import Foundation
import UIKit

class Global {
    
    class func showAlert(title:String, message:String, view:UIViewController){
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        view.presentViewController(alert, animated: true, completion: nil)
        
        
    }
    //Calculate time difference
    
    
    class func calculateTimeDifference(date:NSDate) -> String {
    
    let interval = NSDate().timeIntervalSinceDate(date)
    switch interval {
    case 0...60:
        return("\(Int(interval)) Seconds")
    case 61...3600:
        return("\(Int(interval)/60) Minutes")
    case 3600...86400:
        return("\(Int(interval)/3600) Hours")
    case 86401...2600000:
        return("\(Int(interval)/86400) Days")
    case 2600001...31000000:
        return("\(Int(interval)/2600000) Weeks")
    case 31000000...99999999:
        return("\(Int(interval)/31000000) Years")
    default:
        return "Forever"
        
    }
    
    
    }
    
    
    
    
    
    
    
    
    
    
    




}