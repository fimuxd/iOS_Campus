//
//  Pikachu.swift
//  PocketMonster
//
//  Created by Bo-Young PARK on 17/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

class Pikachu:PocketMon {
    
    init() {
        super.init(name: "피카츄", type: "전기", exp: 0, hp: 100)
        skills = [["Skill Name":"전기충격", "Damage":10, "Skill Exp": 5],["Skill Name":"몸통박치기","Damage":5, "Skill Exp": 10]]
    }
    
    override init(name: String, type: String, exp: Int, hp: Int) {
        super.init(name: name, type: type, exp: exp, hp: hp)
    }

    
    func winkToMyTrainer() {
        guard let owner:Trainer = ownerTrainer else {
            return
        }
        
        print("\(owner.name)에게 윙크했습니다.")
        hp += 10
        owner.exp += 20
    }
}
