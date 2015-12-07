//
//  ZoomDay.swift
//  MakeIt
//
//  Created by Zoom Nguyen on 12/6/15.
//  Copyright © 2015 Zoom Nguyen. All rights reserved.
//

import UIKit

class ZoomDay: NSObject {
    
    var zoomDate : NSDate!
    var eventArray : NSMutableArray!
    
    init(date:NSDate){
        super.init()
        self.zoomDate = date
        self.eventArray = NSMutableArray()
        
    }
    
    init(stringDate:String){
        super.init()
        self.zoomDate = self.convertStringToDate(stringDate)
        self.eventArray = NSMutableArray()
    }
    
    func addEvent(event:ZoomEvent){
        self.eventArray.addObject(event)
    }
    
    func convertStringToDate(myString:String)->NSDate{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        let date = dateFormatter.dateFromString(myString)
        return date!
    }
}
