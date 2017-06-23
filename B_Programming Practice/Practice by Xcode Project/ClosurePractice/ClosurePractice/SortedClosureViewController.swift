//
//  SortedClosureViewController.swift
//  ClosurePractice
//
//  Created by Bo-Young PARK on 23/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class SortedClosureViewController: UIViewController {
    
    /********************************************************/
    //                  IBAction | Function                 //
    /********************************************************/
    
    
    
  
    
    /********************************************************/
    //                      Life Cycle                      //
    /********************************************************/
    //MARK: View Life Cycle 영역
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let names = ["박보영", "조선미", "이재성", "이창호", "김은영", "임현정"]
        
        // 이 부분을 Inline Closure 방식으로 변경해보자 (하단 참고)
        //        func backward(_ s1:String, _ s2:String) -> Bool {
        //            return s1 > s2
        //        }
        //        let sorted = names.sorted(by: backward)
        
        //        let sorted = names.sorted(by: {(s1:String, s2:String) -> Bool in s1 < s2})
        
        let sorted = names.sorted {$0 > $1}
        
        print(sorted)
        
        
        
        
        
        //-----응용해보자. 사칙연산
        
        func calculation(num1:Int, num2:Int, op:(Int,Int) -> Int) -> Int {
            return op(num1, num2)
        }
        
        let plus = {(f:Int, c:Int) -> Int in f + c}
        let minus = {(f:Int, c:Int) -> Int in f - c}
        let multiply = {(f:Int, c:Int) -> Int in f * c}
        let devide = {(f:Int, c:Int) -> Int in f / c}
        
        print(calculation(num1: 10, num2: 15, op: plus))
        print(calculation(num1: 10, num2: 12){ $0 + $1 })
        print(calculation(num1: 12, num2: 14, op: +))
        
        
        
        
        //-----이것도 한번 생각해보자 (제대로 적었는진 모르겠음)
        
        let f = File()
        
        f.testActionwWithCompletion({(isSuccess:Bool) in
            if isSuccess {
                
            }else{
                
            }
        })
        
        f.testActionwWithCompletion{(isBool) in
            if isBool{
                
            }
        }
        
    }
    

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}


class File {
    
    
    //File 안에 존재한다고 가정
    func testActionwWithCompletion(_ completion:(Bool) -> Void) {
        print("함수 실행")
        
        if true {
            completion(true)
        }else{
            completion(false)
        }
    }
    
}
