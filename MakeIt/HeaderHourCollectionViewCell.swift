//
//  HeaderHourCollectionViewCell.swift
//  MakeIt
//
//  Created by Zoom Nguyen on 12/6/15.
//  Copyright © 2015 Zoom Nguyen. All rights reserved.
//

import UIKit

class HeaderHourCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblHour: UILabel!
    @IBOutlet weak var lblAMPM: UILabel!
    
    func loadData(indexpath:NSIndexPath){
        if (indexpath.row <= 12){
            lblAMPM.text = "am"
            lblHour.text = String(indexpath.row)
        }else{
            lblAMPM.text = "pm"
            lblHour.text = String(indexpath.row-12)
        }
    }
    
}
