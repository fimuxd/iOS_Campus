
//
//  RealmFirst.swift
//  RealmPlugin
//
//  Created by Bo-Young PARK on 28/6/2017.
//  Copyright © 2017 Realm. All rights reserved.
//

import Foundation
import RealmSwift

class RealmFirst: Object {
    
    let name:String = ""
    let ignore:String = ""
    
    override static func ignoredProperties() -> [String] {
        return ["ignore"]
    }
}

class Second {
    let name:String = ""
}
