//
//  Raichu.swift
//  PocketMonster
//
//  Created by Bo-Young PARK on 18/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

class Raichu:Pikachu {
    
    override init() {
        super.init(name: "라이츄", type: "전기", exp: 0, hp: 150)
        
        skills = [["Skill Name":"100만볼트", "Damage":20, "Skill Exp": 15],["Skill Name":"몸통박치기","Damage":10, "Skill Exp": 20]]
        
    }
    
    override func winkToMyTrainer() {
        guard let owner:Trainer = ownerTrainer else {
            return
        }
        
        print("\(owner.name)(이)가 싫어합니다.")
        hp -= 5
        exp += 10
        owner.exp += 10
    }
    
}
