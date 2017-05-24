//
//  ViewController.swift
//  RecursionPractice
//
//  Created by Bo-Young PARK on 24/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 피보나치의 마지막 수 구하기
    func recFibonacci(n:Int) -> Int {
        if n == 0 {
            return 0
        }
        else if n == 1 {
            return 1
        }
        else {
            return recFibonacci(n: n-1) + recFibonacci(n: n-2)
        }
        
    }
    
    
    // 피보나치 수열 구하기
    func fibonacci(n:recFibonacci) -> array {
        let lastIndex = inputNumber - 1
        
        if lastIndex == 1 {
            return [1,1]
        }
            else {
                var resultArray = fibonacci(n: lastIndex)
                
                let result: Int = resultArray[lastIndex - 1] + resultArray[lastIndex - 2]
                resultArray.append(result)
                return resultArray
            }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }


}

