//
//  ViewController.swift
//  TheGreatCommonDivisorAndTheLeastCommonMultiple
//
//  Created by Bo-Young PARK on 28/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var secondInputNumberTF: UITextField!
    @IBOutlet weak var firstInputNumberTF: UITextField!
    
    @IBOutlet weak var theGreatCommonDivisorLabel: UILabel!
    @IBOutlet weak var theLeastCommonMultipleLabel: UILabel!
    
    @IBAction func calculateBtn(_ sender: UIButton) {
        self.theGreatCommonDivisorLabel.text = String(getTheGreatCommonDivisor(for: Int(self.firstInputNumberTF.text!)!, and: Int(self.secondInputNumberTF.text!)!))
        
        self.theLeastCommonMultipleLabel.text = String(getTheLeastCommonMultiple(for: Int(self.firstInputNumberTF.text!)!, and: Int(self.secondInputNumberTF.text!)!))
    }
    
    
    //1. 최대공약수
    
    func getTheGreatCommonDivisor(for num1:Int, and num2:Int) -> Int {
        var num1DivisorList:Set<Int> = []
        var num2DivisorList:Set<Int> = []
        
//        var divisor1:Int = num1
//        var divisor2:Int = num2
        
        for i in 1...num1 {
            if num1%i == 0 {
                num1DivisorList.insert(i)
            }
        }
        for i in 1...num2 {
            if num2%i == 0 {
                num2DivisorList.insert(i)
            }
        }
        
        let resultList:[Int] = num1DivisorList.intersection(num2DivisorList).sorted()
        return resultList[resultList.count-1]
        
    }
    
 
    
    
    //2. 최소공배수
    /* 
     (두 자연수의 곱) = (최대공약수) * (최소공배수)
     따라서, (최소공배수) = (두 자연수의 곱) / (최대공약수) 
     */
    
    func getTheLeastCommonMultiple(for num1:Int, and num2:Int) -> Int {
        let theGreatCommonDivisor:Int = getTheGreatCommonDivisor(for: num1, and: num2)
        let multipleOfNumbers = num1 * num2
        
        return multipleOfNumbers / theGreatCommonDivisor
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(getTheGreatCommonDivisor(for: 6, and: 9))
        print(getTheLeastCommonMultiple(for: 6, and: 9))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

