//
//  DataCenter.swift
//  UICollectionViewPractice
//
//  Created by Bo-Young PARK on 3/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

class DataCenter {
    static let center:DataCenter = DataCenter()
    
    var friendsList = ["A", "B", "C", "D", "E", "F", "G", "H"]
    
    // var friendsImage = ["0", "1", "2", "3", "4", "5", "6", "7"]
    
//    func insertItems(at items:[IndexPath]) {
//        var duplicatedItems = items
//        for index in 0...items.count-1 {
//            friendsList[duplicatedItems[index].item]
//        }
//        
//    }
    
    func insertItems(at items:[IndexPath]) {
        let sortedItems = items.sorted(by: >)
        
        let duplicatedItems = sortedItems.map { (indexPath: IndexPath) -> String in
            
            friendsList[indexPath.item]
        }
        
        friendsList += duplicatedItems
        
    }
    
    
}
