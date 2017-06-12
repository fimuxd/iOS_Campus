//
//  ViewController.swift
//  FunctionPractice_170612
//
//  Created by Bo-Young PARK on 12/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(addFromOneTo(n: 10)) //55
        print(addFromOneTo(m: 10)) //55
        print(addFromOneTo(l: 3)) //6
        print(giveCentermLetters(of: "ParkBoYoung")) //o
        print(giveCentermLetters(of: "12345678")) //45
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /******************************************************************/
    //                      1부터 N까지의 합 구하기                        //
    //                          1. 반복문 사용                           //
    //                          2. 공식 사용 n(n+1)/2                   //
    //                          3. 재귀 사용                            //
    /******************************************************************/
    
    //1. 반복문 사용
    
    func addFromOneTo(n:Int) -> Int {
        var result:Int = 0
        
        for number in 1...n {
            result += number
        }
        return result
    }
    
    
    //2. 공식 사용
    
    func addFromOneTo(m:Int) -> Int {
        return m * (m+1) / 2
    }
    
    
    //3. 재귀 사용
    
    func addFromOneTo(l:Int) -> Int {
        if l <= 1 {
            return 1
        }else {
            return l + addFromOneTo(l:l-1)
        }
    }
    
    
    /******************************************************************/
    //                        가운데 문자 출력하기                          //
    //                 예) apple => "p" | iPad => "P"                  //
    /******************************************************************/
    
    func giveCentermLetters(of:String) -> String {
        
        var str:String = of
        let count = str.characters.count
        
        if count % 2 != 0 {
            str.characters.removeFirst(count/2)
            str.characters.removeLast(count/2)
        }else{
            str.characters.removeFirst((count-2)/2)
            str.characters.removeLast((count-2)/2)
        }
        
        return str
        
    }
}
