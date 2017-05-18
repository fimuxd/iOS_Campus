//
//  Trainer.swift
//  PocketMonster
//
//  Created by Bo-Young PARK on 18/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

class Trainer {
    var name:String
    var exp:Int
    
    
    init(name:String, exp:Int) {
        self.name = name
        self.exp = exp
    }
    
    func intoPocketBall(monster:PocketMon, trainer:Trainer) {
        
        if monster.exp < trainer.exp {
            print("\(monster.name)가 \(trainer.name)포켓볼에 잡혔습니다")
            
        }
        else {
            print("\(monster.name)을 잡는데 실패했습니다.")
        }
    
    }
    
}
