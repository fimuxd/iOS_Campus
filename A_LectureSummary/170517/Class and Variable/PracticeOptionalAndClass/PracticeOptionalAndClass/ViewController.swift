//
//  ViewController.swift
//  PracticeOptionalAndClass
//
//  Created by Bo-Young PARK on 17/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Optional Practice
    
    func isNumber(inputNum:String) -> Bool {
        if let unwrapStr:String = inputNum {
            print(unwrapStr)
            return true
        }
        return false
    }
    
    func checkSeveral(num1:String, num2:String) -> Bool {
        if let firstNum:String = num1, let secondNum:String = num2 {
            print(firstNum)
            print(secondNum)
            return true
        }
        else {
            return false
        }
    }
    

    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        isNumber(inputNum: "1")
        
        checkSeveral(num1: "1", num2: "2")
    
    
    
    
    
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

