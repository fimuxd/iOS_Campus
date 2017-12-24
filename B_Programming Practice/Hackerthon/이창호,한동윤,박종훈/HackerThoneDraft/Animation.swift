//
//  Animation.swift
//  HackerThoneDraft
//
//  Created by Dong Yoon Han on 7/8/17.
//  Copyright © 2017 DY. All rights reserved.
//

import Foundation
import UIKit


private let goldenRatio = CGFloat(0.625)
private let splitRatio = CGFloat(10)


private func generateFragmentsFrom(_ originView:UIView, with splitRatio:CGFloat, in containerView:UIView) -> [UIView]
{
    let x1 = originView.frame.width * 1.5
    let y1 = originView.frame.height * 1.5
//    let size = originView.frame.size
    let size = CGSize(width: x1, height: y1)
    let snapshots = originView.snapshotView(afterScreenUpdates: true)
    var fragments = [UIView]()
    
//    print("Snapshots:\(String(describing: snapshots)) from \(originView)")
    
    let shortSide = min(size.width, size.height)
    let gap = max(20, shortSide/splitRatio)
    
    for x in stride(from: 0.0, to: Double(size.width), by: Double(gap))
    {
        for y in stride(from: 0.0, to: Double(size.height), by: Double(gap))
        {
            
            let fragmentRect = CGRect(x: CGFloat(x), y: CGFloat(y), width: size.width/splitRatio, height: size.width/splitRatio)
            let fragment = snapshots?.resizableSnapshotView(from: fragmentRect, afterScreenUpdates: false, withCapInsets: UIEdgeInsets.zero)
            
            fragment?.frame = originView.convert(fragmentRect, to: containerView)
            containerView.addSubview(fragment!)
            fragments.append(fragment!)
        }
    }
    
    return fragments
    
}
private func random(from lowerBound:CGFloat, to upperBound:CGFloat) -> CGFloat {
    return CGFloat(arc4random_uniform(UInt32(upperBound - lowerBound))) + lowerBound
}



/**
 The explode direction of the animation
 - Chaos: The fragment will explode randomly
 */
enum ExplodeDirection
{
    case chaos
    
    fileprivate func explodeDirection(_ offset:CGSize) -> CGVector
    {
        switch self
        {
        case .chaos:
            let xOffset = random(from: -offset.width*goldenRatio, to: offset.width*goldenRatio)
            let yOffset = random(from: -offset.height*goldenRatio, to: offset.height*goldenRatio)
            return CGVector(dx: xOffset, dy: yOffset)
        }
    }
}

protocol Explodable {}

extension Explodable where Self:UIView
{
    
    /**
     Explode a view using the specified duration and direction
     - Parameter duration: The animation duration
     - Parameter direction: The explode direction, default is `ExplodeDirection.Chaos`
     */
    func explode(_ direction:ExplodeDirection = .chaos, duration:Double)
    {
        explode(direction, duration: duration) {}
    }
    
    /**
     Explode a view using the specified duration ,direction and completion handler
     - Parameter duration: The total duration of the animation
     - Parameter direction: The explode direction, default is `ExplodeDirection.Chaos`
     - Parameter completion: A closure to be executed when the animation sequence ends.
     */
    func explode(_ direction:ExplodeDirection = .chaos, duration:Double, completion:@escaping (()->Void))
    {
        
        guard let containerView = self.superview else { fatalError() }
        let fragments = generateFragmentsFrom(self, with: splitRatio, in: containerView)
        self.alpha = 0
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseOut,
                       animations: {
                        fragments.forEach {
                            
                            let direction = direction.explodeDirection($0.superview!.frame.size)
                            let explodeAngle = random(from: -CGFloat(Double.pi)*goldenRatio, to: CGFloat(Double.pi)*goldenRatio)
                            let scale = 0.01 + random(from: 0.01, to: goldenRatio)
                            
                            let translateTransform = CGAffineTransform(translationX: direction.dx, y: direction.dy)
                            let angleTransform = translateTransform.rotated(by: explodeAngle)
                            let scaleTransform = angleTransform.scaledBy(x: scale, y: scale)
                            
                            $0.transform = scaleTransform
                            $0.alpha = 0
                            
                        }
        },
                       completion: { _ in
                        fragments.forEach {
                            $0.removeFromSuperview()
                        }
                        self.removeFromSuperview()
                        self.alpha = 1
                        completion()
        })
    }
    
}



