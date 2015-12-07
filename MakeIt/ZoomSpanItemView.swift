//
//  ZoomSpanItemView.swift
//  MakeIt
//
//  Created by Zoom Nguyen on 12/6/15.
//  Copyright © 2015 Zoom Nguyen. All rights reserved.
//

import UIKit

class ZoomSpanItemView: UIView {
    
    //ZoomEvent
    var zoomEvent:ZoomEvent!
    
    var jumpTime = 0.25 // 15minutes
    var heightOfHour = 100.0
    
    
    //Elements
    var fakeBtn:UIImageView!
    var greenPart:UIView!
    
    //Init Parameter
    var fakeBtnTapped:Bool!
    
    //Gesture
    var pointTouchStart:CGPoint?
    var heightOfView:Float?
    
    //Frame
    var frameOfView:CGRect?
    var currentTransform:CGAffineTransform?
    
    
    
    init(zoomEvent:ZoomEvent){
        
        super.init(frame: CGRectMake(0,0,0,0))
        
        self.zoomEvent = zoomEvent
        
        //constant: height of 1 hour
        let heightOfOneHour = Float(100)
        
        let positionYStart = self.zoomEvent.startTime * heightOfOneHour
        let heightOfView = (self.zoomEvent.endTime - self.zoomEvent.startTime) * heightOfOneHour
        
        self.frame = CGRectMake(10, CGFloat(positionYStart), 60, CGFloat(heightOfView))
        
        // Update Frame
        self.frameOfView = self.frame
        
        //green
        greenPart = UIView(frame: CGRectMake(0,0,self.frame.size.width,self.frame.size.height-8))
        greenPart.backgroundColor = UIColor(red: 69.0/255.0, green: 202.0/255.0, blue: 180.0/255.0, alpha: 1.0)
        greenPart.layer.cornerRadius = self.frame.size.width / 8
        self.addSubview(greenPart)
        
        //fake button
        fakeBtn = UIImageView(frame: CGRectMake(0,0,50,30))
        fakeBtn.center = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height-8)
        fakeBtn.contentMode = .Center
        fakeBtn.image = UIImage(named: "btnDag@2x.png")
        
        self.addSubview(fakeBtn)
        
        //default
        fakeBtnTapped = false
        self.currentTransform = self.transform
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            NSNotificationCenter.defaultCenter().postNotificationName("Zoom_Notif_DisableScrollView", object: nil)
            let location = touch.locationInView(self)
            self.pointTouchStart = location
            
            if (location.y > self.frame.size.height-30){
                fakeBtnTapped = true
                fakeBtn.image = UIImage(named: "btnDag-active@2x.png")
            }else{

                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.greenPart.backgroundColor = UIColor(red: 139.0/255.0, green: 216.0/255.0, blue: 195.0/255.0, alpha: 1.0)
                    self.transform = CGAffineTransformScale(self.currentTransform!, 1.1, 1.1)
                    }, completion: nil)
            }
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInView(self)
            if (fakeBtnTapped==true){
                if (location.y > (CGFloat(jumpTime*heightOfHour)) ){
                    UIView.animateWithDuration(0.0, animations: { () -> Void in
                        let heightChange = (location.y - self.pointTouchStart!.y)
                        self.drawLayout(heightChange)
                        }, completion: nil)
                }
                
            }else{
                UIView.animateWithDuration(0.0, animations: { () -> Void in
                    var newFrame:CGRect = self.frame;
                    newFrame.origin.y += (location.y - self.pointTouchStart!.y)
                    self.frame = newFrame
                    }, completion: nil)
                
            }
        }
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        fakeBtnTapped = false
        NSNotificationCenter.defaultCenter().postNotificationName("Zoom_Notif_AnableScrollView", object: nil)
        // Update Frame
        self.frameOfView = self.frame
        fakeBtn.image = UIImage(named: "btnDag@2x.png")

        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.transform = CGAffineTransformScale(self.currentTransform!, 1.0, 1.0)
            self.greenPart.backgroundColor = UIColor(red: 69.0/255.0, green: 202.0/255.0, blue: 180.0/255.0, alpha: 1.0)
            
            }, completion: nil)
    }
    
    //Function Layout Update
    func drawLayout(heightChange:CGFloat){
        
        //Parent
        var ParentFrame:CGRect = self.frame
        ParentFrame.size.height = (self.frameOfView?.size.height)! + heightChange
        self.frame = ParentFrame
        
        //green
        var greenFrame = greenPart.frame
        greenFrame.size.height = (self.frameOfView?.size.height)! + heightChange - 8
        greenPart.layer.cornerRadius = greenFrame.size.width / 8
        greenPart.frame = greenFrame
        
        //fake button
        fakeBtn.center = CGPoint(x: ParentFrame.size.width/2, y: ParentFrame.size.height-8)
        
    }
    
}
