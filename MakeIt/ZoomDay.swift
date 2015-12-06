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
    
    init(date:NSDate){
        super.init()
        zoomDate = date
    }
    
    init(stringDate:String){
        super.init()
        zoomDate = self.convertStringToDate(stringDate)
    }
    
    func convertStringToDate(myString:String)->NSDate{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        let date = dateFormatter.dateFromString(myString)
        return date!
    }
}
