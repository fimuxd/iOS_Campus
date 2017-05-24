//
//  FightSystem.swift
//  PocketMonster
//
//  Created by Bo-Young PARK on 18/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

class FightSystem {
    
    init() {
        
    }
    
    func vsOneByOne(firstMonster:PocketMon, secondMonster:PocketMon) {
        if firstMonster.hp >= 0 && secondMonster.hp >= 0 {
            
            while (firstMonster.hp <= 0) || (secondMonster.hp <= 0) {
                firstMonster.attack(Monster: secondMonster, skill: 0)
                secondMonster.attack(Monster: firstMonster, skill: 0)
            }
            
            if firstMonster.hp > secondMonster.hp {
                print("\(firstMonster.name)(이)가 이겼습니다")
            }
                
            else {
                print("\(secondMonster.name)(이)가 이겼습니다")
            }
        }
    }
    
}
