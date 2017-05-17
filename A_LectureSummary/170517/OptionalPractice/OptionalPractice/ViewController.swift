//
//  ViewController.swift
//  OptionalPractice
//
//  Created by Bo-Young PARK on 17/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    //OptionalPractice
        
        var otName:String!
        var name:String = "joo"
        
        func printTest()
        {
            otName = "BB"
            print(otName)
                //optional을 일반 타입으로 선언해주지 않았으므로 
                //print값: Optional("BB")
            
            print(otName!)
                //Optional 타입을 일반 타입으로 변경
                //print값: BB
            
            print(name)
                //원래 일반 타입이므로 문제 없음
            
        }
        
        printTest()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

