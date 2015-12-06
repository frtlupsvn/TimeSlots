//
//  Zoom.swift
//  MakeIt
//
//  Created by Zoom Nguyen on 12/5/15.
//  Copyright © 2015 Zoom Nguyen. All rights reserved.
//

import UIKit

class Zoom: UICollectionViewFlowLayout {
    
    var itemWidth : CGFloat
    var itemHeight : CGFloat
    var space : CGFloat
    init(itemWidth: CGFloat, itemHeight: CGFloat, space: CGFloat) {
        self.itemWidth = itemWidth
        self.itemHeight = itemHeight
        self.space = space
        super.init()
    }
    required init(coder aDecoder: NSCoder) {
        self.itemWidth = 150
        self.itemHeight = 100*24
        self.space = 3
        super.init()
    }
    override func collectionViewContentSize() -> CGSize {
        let w : CGFloat = CGFloat(self.collectionView!.numberOfItemsInSection(0)) * (itemWidth + space)
        let h : CGFloat = CGFloat(self.collectionView!.numberOfSections()) * (itemHeight + space)
        return CGSizeMake(w, h)
    }
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        
        let x : CGFloat = CGFloat(indexPath.row) * (itemWidth + space)
        let y : CGFloat = CGFloat(indexPath.section) + CGFloat(indexPath.section) * (itemHeight + space)
        
        attributes.frame = CGRectMake(x, y, itemWidth, itemHeight)
        return attributes
    }

    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

        var attributes : Array<UICollectionViewLayoutAttributes> = [UICollectionViewLayoutAttributes]()
        for i in 0...self.collectionView!.numberOfSections()-1 {
            for j in 0...self.collectionView!.numberOfItemsInSection(i)-1 {
                attributes.append(self.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: j, inSection: i))!)
            }
        }
        return attributes
    }
}
