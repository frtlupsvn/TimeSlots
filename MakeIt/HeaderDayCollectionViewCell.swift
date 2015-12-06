//
//  HeaderDayCollectionViewCell.swift
//  MakeIt
//
//  Created by Zoom Nguyen on 12/6/15.
//  Copyright © 2015 Zoom Nguyen. All rights reserved.
//

import UIKit

class HeaderDayCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblDayofWeek: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    func loadData(zoomDay:ZoomDay){
        lblDate.text = convertDateToString(zoomDay.zoomDate) as String
        lblDayofWeek.text = getDayOfWeek(zoomDay.zoomDate)
    }
    
    func convertDateToString(date:NSDate)->NSString{
        let formatter : NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "dd MMM yy"
        let dateString :NSString = formatter.stringFromDate(date)
        
        return dateString
    }
    
    func getDayOfWeek(date:NSDate)->String {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayOfWeekString = dateFormatter.stringFromDate(date)
        
        return dayOfWeekString
    }
    
}
