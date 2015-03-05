//
//  MyMoviesViewController.swift
//  MovieSharingApp
//
//  Created by Samuel Hooker on 3/03/15.
//  Copyright (c) 2015 Jocus Interactive. All rights reserved.
//

import UIKit

class MyMoviesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var imdbArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
    }
    @IBAction func menuButtonClicked(sender: AnyObject) {
        
        self.slideMenuController()?.openLeft()
        
    }
    override func viewDidAppear(animated: Bool) {
        
        imdbArray = PFUser.currentUser().objectForKey("movies") as [String]
        collectionView.reloadData()
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
    
    
    //UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {  //compulsory functions
        return  1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imdbArray.count //number of all cells
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell { //creates each instnace of the a cell.
        
        // creates a reuasbale cell (instance of FeedCell)
        var cell:CollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as CollectionViewCell
        cell.imdbID = imdbArray[indexPath.row] as String
        return cell

        
    }
    
    //UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) { //cell tapped on
        
    }

}
