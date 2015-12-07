//
//  ZoomEvent.swift
//  MakeIt
//
//  Created by Zoom NGUYEN on 12/7/15.
//  Copyright © 2015 Zoom Nguyen. All rights reserved.
//

import UIKit

class ZoomEvent: NSObject {
    
    //Time
    var startTime:Float!
    var endTime:Float!
    
    init(startTime:Float, endTime:Float){
        super.init()
        self.startTime = startTime
        self.endTime = endTime
    }

}
