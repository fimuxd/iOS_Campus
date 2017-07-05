//
//  CoverFlowLayout.swift
//  MusicPlayer
//
//  Created by youngmin joo on 2017. 7. 3..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//


import UIKit

class CoverFlowLayout : UICollectionViewFlowLayout {
    
    var itemScale:CGFloat = 0.5
    var itemAlpha:CGFloat = 0.5
    
    override func awakeFromNib() {
        self.minimumLineSpacing = 25.0
    }
    
    //override하지 않으면 기존의 flowLayout에 맞게 뿌려준다. 지금은 override 했으므로, 상속 받은 후 새로운 layout을 만드는 것
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        if let attributes = super.layoutAttributesForElements(in: rect)
        {
            
            
            var layoutAttribute:[UICollectionViewLayoutAttributes] = []
            
            for attribute in attributes
            {
                //change (Attribute를 변경하는 아이)
                changeLayoutAttribute(attribute: attribute)
                //add
                layoutAttribute.append(attribute)
            }
            
            return layoutAttribute
        }
        
        return nil
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        let attributeList =  self.layoutAttributesForElements(in: (self.collectionView?.bounds)!)
        
        let xCenter = (self.collectionView?.frame.size.width)! / 2
        let offsetOriginX = proposedContentOffset.x + xCenter
        
        let tempList =  NSArray(array: attributeList!).sortedArray(comparator: { (instance1, instance2) -> ComparisonResult in
            if fabs((instance1 as! UICollectionViewLayoutAttributes).center.x - offsetOriginX) > fabs((instance2 as! UICollectionViewLayoutAttributes).center.x - offsetOriginX) {
                return ComparisonResult.orderedDescending
            }else if fabs((instance1 as! UICollectionViewLayoutAttributes).center.x - offsetOriginX) < fabs((instance2 as! UICollectionViewLayoutAttributes).center.x - offsetOriginX) {
                
                return ComparisonResult.orderedAscending
                
            } else {
                
                return ComparisonResult.orderedSame
            }
        }) as! [UICollectionViewLayoutAttributes]
        
        let xCenterOfMinimumAttributes = (tempList.first)?.center.x
        
        let targetContentOffset = CGPoint(x:xCenterOfMinimumAttributes! - xCenter,y: proposedContentOffset.y);
        return targetContentOffset;
    }
    
    
    //layout을 업데이트 하는 것을 Invalidate Layout이라고 한다. 
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    
    func changeLayoutAttribute(attribute:UICollectionViewLayoutAttributes)
    {
        let collectionViewCenter = (self.collectionView?.frame.size.width)! / 2.0
        let offSet = (self.collectionView?.contentOffset.x)! + collectionViewCenter
        
        let maxDistance = self.itemSize.width + self.minimumLineSpacing
        let distance = min(fabs(offSet - attribute.center.x), maxDistance)
        let ratio = (maxDistance - distance) / maxDistance
        let scale = ratio * (1 - self.itemScale) + 1.0
        let alpha = ratio * (1 - self.itemAlpha) + self.itemAlpha;
        
        attribute.alpha = alpha;
        attribute.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1);
        attribute.zIndex = NSInteger(alpha * 30.0)
        
    }
    

}
