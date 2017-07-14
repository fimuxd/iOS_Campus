//
//  ViewController.swift
//  Thread(GCD) Practice
//
//  Created by Bo-Young PARK on 14/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let queueFirst = DispatchQueue(label: "com.fimuxd.q1", qos: .unspecified)
        //
        //        queueFirst.async {
        //            for i in 1..<100 {
        //                print("Q1_task1: \(i)")
        //            }
        //        }
        //
        //        queueFirst.async {
        //            for i in 100...200 {
        //                print("Q1_task2: \(i)")
        //            }
        //        }
        //
        //        let queueSecond = DispatchQueue(label: "com.fimuxd.q2")
        //        queueSecond.async {
        //            for i in 10_000...10_010 {
        //                print("Q2_task1: \(i)")
        //            }
        //        }
        
        //        let queueThird = DispatchQueue(label: "com.fimuxd.q3", qos: .userInteractive, attributes: [.initiallyInactive, .concurrent])
        //        queueThird.async {
        //            for i in 1_000...1_010 {
        //                print("Q3_task1: \(i)")
        //            }
        //        }
        //
        //        print("end")
        //
        //        DispatchQueue.main.async {
        //            queueThird.activate()
        //        }
        //        //        queueThird.async {
        //        //            for i in 2_000...2_010 {
        //        //                print("Q3_task2: \(i)")
        //        //            }
        //        //        }
        //
        //    }
        
        let witem = DispatchWorkItem {
            print("workItem")
        }
        
        DispatchQueue.global().async {
            for n in 1..<10 {
                print(n)
            }
        }
        
        DispatchQueue.global(qos: .userInteractive).async(execute: witem)
        
        let q2 = DispatchQueue(label: "com.closerExample.q2", qos: .userInteractive)
        q2.async {
            for n in 1000...1010 {
                print(n)
            }
        }
        
        let q3 = DispatchQueue(label: "com.closerExample.q3", qos: .background, attributes: [.initiallyInactive, .concurrent])
        
        q3.async(execute: witem)
        
        q3.activate()
        
        let delayQueue = DispatchQueue(label: "com.wing.delayqueue", qos: .userInitiated)
        
        print(Date())
        
        let additionalTime: DispatchTimeInterval = .seconds(2)
        
        delayQueue.asyncAfter(deadline: .now() + additionalTime) {
            print(Date())
        }
        
        delayQueue.asyncAfter(deadline: .now() + 0.75) {
            print(Date())
        }
        
    }
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
}

