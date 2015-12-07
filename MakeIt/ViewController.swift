//
//  ViewController.swift
//  MakeIt
//
//  Created by Zoom Nguyen on 12/5/15.
//  Copyright © 2015 Zoom Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var myCollection: UICollectionView!
    @IBOutlet weak var topHeader: UICollectionView!
    @IBOutlet weak var leftHeader: UICollectionView!
    
    var arrayEvents : NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //init Time Slot
        self.myCollection!.collectionViewLayout = Zoom(itemWidth: 150, itemHeight: 100*24, space: 0.0)
        
        //init arrayEvents
        self.arrayEvents = NSMutableArray()
        
        //sample date
        
        var sample1 : ZoomDay = ZoomDay(stringDate: "20-11-2015")
        var zoomEvent1 = ZoomEvent(startTime: 2, endTime: 3);
        sample1.addEvent(zoomEvent1)
        
        arrayEvents.addObject(sample1)
        
        var sample2 : ZoomDay = ZoomDay(stringDate: "21-11-2015")
        var zoomEvent2 = ZoomEvent(startTime: 4, endTime: 6);
        sample2.addEvent(zoomEvent2)
        arrayEvents.addObject(sample2)
        
        var sample3 : ZoomDay = ZoomDay(stringDate: "25-11-2015")
        var zoomEvent3 = ZoomEvent(startTime: 3.5, endTime: 6);
        sample3.addEvent(zoomEvent3)
        arrayEvents.addObject(sample3)
        
        //Test
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "disableScrollView:", name:"Zoom_Notif_DisableScrollView", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "anableScrollView:", name:"Zoom_Notif_AnableScrollView", object: nil)

    }
    
    func disableScrollView(notif:NSNotification){
        self.myCollection.scrollEnabled = false
    }
    
    func anableScrollView(notif:NSNotification){
        self.myCollection.scrollEnabled = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (collectionView == leftHeader){
            return 24 // Hours of day
        }
        
        return self.arrayEvents.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if (collectionView == myCollection){
            let cell:DayCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("DayCollectionViewCell", forIndexPath: indexPath) as! DayCollectionViewCell
            
            let zoomDay = self.arrayEvents.objectAtIndex(indexPath.row) as! ZoomDay
            cell.zoomDay = zoomDay
            
            return cell
        }
        
        if (collectionView == topHeader){
            let cell:HeaderDayCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("topCell", forIndexPath: indexPath) as! HeaderDayCollectionViewCell
            
            cell.loadData(self.arrayEvents.objectAtIndex(indexPath.row) as! ZoomDay)
            
            return cell
        }
        if (collectionView == leftHeader){
            let cell:HeaderHourCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("leftCell", forIndexPath: indexPath) as! HeaderHourCollectionViewCell
            
            cell.loadData(indexPath)
            
            return cell
        }
        var celldefault : UICollectionViewCell!
        return celldefault
    }
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        self.topHeader.setContentOffset(CGPointMake(self.myCollection.contentOffset.x, 0), animated: false)
        
        self.leftHeader.setContentOffset(CGPointMake(0,self.myCollection.contentOffset.y), animated: false)
    }
    
}

