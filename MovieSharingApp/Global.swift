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
    
//    class func returnApiData(urlString:String) -> AnyObject {
//        
//        
//        var result:AnyObject!
//    
//        
//        // 1
//        let urlAsString = urlString
//        let url = NSURL(string: urlAsString)!
//        let urlSession = NSURLSession.sharedSession()
//        
//        //2
//        let jsonQuery = urlSession.dataTaskWithURL(url, completionHandler: { data, response, error -> Void in
//            if (error != nil) {
//                println(error.localizedDescription)
//            }
//            var err: NSError?
//            
//            // 3
//            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
//            if (err != nil) {
//                println("JSON Error \(err!.localizedDescription)")
//
//            }
//            
//            // 4
//            //let jsonDate: String! = jsonResult["date"] as NSString
//            //let jsonTime: String! = jsonResult["time"] as NSString
//            
//            
//            dispatch_async(dispatch_get_main_queue(), {
//                result = jsonResult
//                println(jsonResult)
//                
//            })
//            
//            
//        })
//        // 5
//        jsonQuery.resume()
//    
//        
//    }
//        
//        
//        
//    
//    
//    class func searchForMovie(name:String) -> [(name:String, imdbID:String)]? {
//        
//        
//        var returnList = [] as [(name:String, imdbID:String)]
//        
//        let nameString = name.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.LiteralSearch, range: nil)
//        let urlString = "http://www.omdbapi.com/?s=" + nameString
//        
//        var data = Global.returnApiData(urlString) as NSDictionary
//        if data.count == 0{
//            println("retuned data is nil")
//        }else{
//            
//            if data["Search"] == nil{
//                println("no results found")
//            }else{
//                var results = data["Search"] as [NSDictionary]
//                
//                for result in results as [NSDictionary]{
//                    var name = result["Name"] as String
//                    var year = result["Year"] as String
//                    var imdbID = result["imdbID"] as String
//                    
//                    //var tuple: (name:String, imdbID:String) = (name:"\(name), (\(year))", imdbID:"\(id)")
//                    returnList.append(name:"\(name), (\(year))", imdbID:"\(imdbID)")
//                }
//                
//                
//                
//            }
//            
//            
//            
//            
//        }
//        
//        
//        return returnList
//        
//    }
    
    
    




}
    
        
        
    
        
        
        
    

    
    
    
    
    
    
    
    
    
    
    




