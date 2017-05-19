//
//  ViewController.swift
//  PocketMonster
//
//  Created by Bo-Young PARK on 17/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let pika:Pikachu = Pikachu()
        let rai:Raichu = Raichu()
        let b1:Ball = Ball()
        let bb:Trainer = Trainer(name: "보영", exp: 100, ballTray: [b1])
        let fightGround:FightSystem = FightSystem()
        
        rai.attack(Monster: pika, skill: 0)
        
        bb.intoMyPocketBall(monster: pika)
        print(bb.ballTray)
        
        
        fightGround.vsOneByOne(firstMonster: pika, secondMonster: rai)
        
        
        
//        rai.attack(Monster: pika, skill: 1)
//        rai.attack(Monster: pika, skill: 0)
//        rai.attack(Monster: pika, skill: 1)
//        rai.attack(Monster: pika, skill: 1)
//        rai.attack(Monster: pika, skill: 1)
//        rai.attack(Monster: pika, skill: 1)
//        rai.attack(Monster: pika, skill: 1)
//        pika.attack(Monster: rai, skill: 0)
//        pika.attack(Monster: rai, skill: 1)
//        pika.attack(Monster: rai, skill: 1)
//        
//        pika.terminate(monster: pika)
//        pika.terminate(monster: rai)
//        
//        print(pika.exp)
//        print(rai.exp)
//        
//        
//        rai.attack(Monster: pika, skill: 1)
//        rai.attack(Monster: pika, skill: 1)
//         
//        print(pika.hp)
//        
//        
//        bb.intoPocketBall(monster: pika, trainer: bb)
//        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

