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
    var ballTray:[Ball] //[ball:[PocketMon],ball2:[PocketMon2]]
    
    
    init(name:String, exp:Int, ballTray:[Ball]) {
        self.name = name
        self.exp = exp
        self.ballTray = ballTray
    }
    // 여기부터 다시해보자. 몬스터를 볼 속으로 들어가게 잡는 것
    func intoMyPocketBall(monster:PocketMon) {
        let myball:Ball = Ball()
        self.ballTray.append(myball)

        if monster.ownerTrainer == nil && myball.ball?.count == 0 {
            if monster.exp < self.exp {
            print("\(monster.name)가 \(self.name)포켓볼에 잡혔습니다")
            myball.ball?.append(monster)
            self.ballTray.append(myball)
            }
                
            else if monster.exp <= self.exp {
                print("\(monster.name)을 잡는데 실패했습니다.")
            }
        }

        
    }
    
    func beKindToMonster(monster:PocketMon) {
        if monster.ownerTrainer == nil {
            intoMyPocketBall(monster: monster)
        }
    }
    
}
