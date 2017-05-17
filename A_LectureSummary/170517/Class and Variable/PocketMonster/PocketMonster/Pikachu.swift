//
//  Pikachu.swift
//  PocketMonster
//
//  Created by Bo-Young PARK on 17/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

class Pikachu {
    var name:String
    var hp:Int = 110
    var type:String = "전기"
    var skills:[[String:Any]] = [["name":"전기충격","demage":10],["name":"몸통박치기","demage":20]]
    
    init() {
        
        name = "피카츄"
    }
    
    func attck(toMoster monster:Pikachu, skill skillNum:Int)
    {
        
        let skill:[String:Any] = skills[skillNum]
        let skillName:String = skill["name"] as! String
        
        /* as : 다운 케스팅*/
        print("\(self.name)이 \(monster)에게 \(skillName)으로 공격합니다.")
        
        let skillDemage:Int = skill["demage"] as! Int
        monster.hp -= skillDemage
        
    }
}
