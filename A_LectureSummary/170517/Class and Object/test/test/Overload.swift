//
//  Overload.swift
//  test
//
//  Created by Bo-Young PARK on 18/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

class OverloadTest {
    init () {
        
    }
    
    func check(p1 string:String, p2 int:Int) -> String {
        return string + "\(int)"
    }

    func check(p1 string:String, p2 int:String) -> String {
        return string + int
    }

    
    
}
