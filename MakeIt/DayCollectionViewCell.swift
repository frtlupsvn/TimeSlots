//
//  DayCollectionViewCell.swift
//  MakeIt
//
//  Created by Zoom Nguyen on 12/5/15.
//  Copyright © 2015 Zoom Nguyen. All rights reserved.
//

import UIKit

class DayCollectionViewCell: UICollectionViewCell {
    
    override func drawRect(rect: CGRect) {
        
        self.backgroundColor = UIColor.whiteColor()
        
        // Draw layout
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        // Draw line seperator Hours
        for i in 1...23{
            let poitDraw:CGPoint = CGPoint(x:150 , y:(100*i) )
            draLine(poitDraw)
        }
        
        setNeedsDisplay()
    }
    
    func draLine(atPoint:CGPoint){
        
        let aPath = UIBezierPath()

        aPath.moveToPoint(CGPoint(x:0, y:atPoint.y))
        aPath.addLineToPoint(CGPoint(x:atPoint.x, y:atPoint.y))
        
        //Keep using the method addLineToPoint until you get to the one where about to close the path
        
        aPath.closePath()
        
        //If you want to stroke it with a red color
        UIColor.lightGrayColor().setStroke()
        aPath.stroke()
        //If you want to fill it as well
        aPath.fill()
        
    }
    
    func addZoomSpanItem(item:ZoomSpanItemView){
       self.addSubview(item)
    }
    

}
