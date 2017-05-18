//
//  PocketMon.swift
//  PocketMonster
//
//  Created by Bo-Young PARK on 18/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

class PocketMon {
    var name:String
    var type:String
    var exp:Int
    var hp:Int
    var skills:[[String:Any]]?  //skills Array에 들어가는 Dictionary의 형태 -> ["Skill Name":String, "Damage": Int]
    var ownerTrainer:Trainer?
    
    init(name:String, type:String, exp:Int, hp:Int) {
        self.name = name
        self.type = type
        self.exp = exp
        self.hp = hp
    }
    
    func attack(Monster attackedMonster:PocketMon, skill skillNum:Int) {
        if let skillList = skills {
            
            if attackedMonster.hp > 0 {
                let pocketmonSkill:[String:Any] = skillList[skillNum]
                let skillName:String = pocketmonSkill["Skill Name"] as! String
                
                print ("\(self.name)(이)가 \(attackedMonster.name)에게 \(skillName)(으)로 공격합니다.")
                
                let skillDamage:Int = pocketmonSkill["Damage"] as! Int
                attackedMonster.hp -= skillDamage
                
                let skillExp:Int = pocketmonSkill["Skill Exp"] as! Int
                attackedMonster.exp += skillExp
                self.exp += skillExp
                
                if attackedMonster.hp <= 0 {
                    print("이 \(attackedMonster.name)(은)는 죽었습니다")
                }
                else if attackedMonster.hp > 0 {
                    print("\(self.name) HP: \(self.hp) | \(attackedMonster.name) HP: \(attackedMonster.hp)")
                    print("\(self.name) EXP: \(self.exp) | \(attackedMonster.name) EXP: \(attackedMonster.exp)")
                }
                    
                else {
                    terminate(monster: attackedMonster)
                }
                
            }
        }
    }
    
        func terminate(monster:PocketMon) {
            guard monster.hp <= 0 else {
                return print("이 포켓몬의 HP는 \(monster.hp)입니다. \(monster.name)(은)는 아직 죽을 수 없어요")
            }
            print("이 \(monster.name)(은)는 죽었습니다.")
        }
    
}
