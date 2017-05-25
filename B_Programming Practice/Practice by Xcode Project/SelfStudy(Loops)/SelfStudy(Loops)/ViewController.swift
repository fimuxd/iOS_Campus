//
//  ViewController.swift
//  SelfStudy(Loops)
//
//  Created by Bo-Young PARK on 24/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /****************************************************************************************/
    //                      반복문(Loops)과 재귀함수를 이용한 팩토리얼 함수 만들기                      //
    /****************************************************************************************/
    
    //1. 팩토리얼 by for-in
    
    func factorialForIn(input:Int) -> Int {
        var number:Int = input
        
        for index in 1..<input {
            number *= index
        }
        return number
    }
    
    //2. 팩토리얼 by while
    
    func factorialWhile(input:Int) -> Int {
        var number:Int = input
        var index:Int = 1
        
        while index < input {
            number *= index
            index += 1
        }
        return number
    }
    
    //3. 팩토리얼 by recursion
    
    func factorialRecursion(input:Int) -> Int {
        if input == 1 {
            return 1
        }
        else {
            return input * factorialRecursion(input: input - 1)
        }
    }
    
    
    
    
    /****************************************************************************************/
    //         반복문(Loops)과 재귀함수를 이용한 Collatz COnstant (반복 횟수) 함수만들기                 //
    /****************************************************************************************/
    //:Collatz Constant: 결과값이 1이 될 때까지 입력한 수가 짝수일 때는 2로 나누고 홀수일 때는 3을 곱한 후 1을 더한다.
    
    //1. 콜라츠상수 by while
    
    func cCWhile(input:Int) -> Int {
        var number:Int = input
        var count:Int = 0
        
        while number != 1 {
            if number%2 == 0 {
                number = number / 2
            }
            else {
                number = number * 3 + 1
            }
            count += 1
        }
        return count
    }
    
    
    //2. 콜라츠상수 by recursion
   
    func cCRecursion(input:Int) -> Int {
        if input == 1 {
            return 0
        }
        else {
            if input%2 == 0 {
                return 1 + cCRecursion(input: input / 2)
            }
            else {
                return 1 + cCRecursion(input: input * 3 + 1)
            }
        }
    
    }
     
    /****************************************************************************************/
    //                          재귀함수를 이용한 Fibonacci 수열 함수만들기                          //
    /****************************************************************************************/
    //: 피보나치 수열: n번째 수는 (n-1)번째 수 + (n-2)번째 수의 합. 즉, [1,1,2,3,5,8,13...]
    
    // 1. n번쨰 피보나치 수 구하기
    
    func getFibonacciNumber(count:Int) -> Int {
        if count == 0 {
            return 0
        }
        else if count == 1 {
            return 1
        }
        else {
            return getFibonacciNumber(count: count - 1 ) + getFibonacciNumber(count: count - 2)
        }
    }
    
    // 2. n까지의 피보나치 수열 구하기
    
    func getFibonacciNumberstill(n:Int) -> Array<Int> {
        var indexCount:Int = n - 1
        if indexCount == 1 {
            return [1,1]
        }
        else {
            var resultArray:[Int] = getFibonacciNumberstill(n: indexCount)
            let result:Int = resultArray[indexCount - 1] + resultArray[indexCount - 2]
            resultArray.append(result)
            return resultArray
        }
        
    }
    
    /****************************************************************************************/
    //                              재귀함수를 이용한 하노이의 탑 함수만들기                           //
    /****************************************************************************************/
    //: 하노이의 탑: A,B,C라는 위치가 있고, n개의 크기가 다른 원반이 A위치에 크기가 큰 순서대로 쌓여있을 때, 
    //  이 것을 2^n - 1 번 (최소횟수) 에 걸쳐 C 위치로 옮기는 것. 작은 원반위에 큰 원반이 올 수 없고, 원반은 하나씩 옮길 수 있다.
    //  원반들이 움직이는 로그가 찍히도록 함수를 만드는 것
    
    func towerOfHanoi(n:Int, fromPole:String, middlePole:String, toPole:String) {
        
        if n == 1 {
            print("\(n)번 원판을 \(fromPole)에서 \(toPole)로 이동")
        }
        else {
            towerOfHanoi(n: n - 1, fromPole: fromPole, middlePole: toPole, toPole: middlePole)
            print ("\(n)번 원판을 \(fromPole)에서 \(toPole)로 이동")
            towerOfHanoi(n: n - 1, fromPole: middlePole, middlePole: fromPole, toPole: toPole)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(factorialForIn(input: 5))
        print(factorialWhile(input: 5))
        print(factorialRecursion(input: 5))
        print("----")
        print(cCWhile(input: 6))
        print(cCRecursion(input: 6))
        print("----")
        print(getFibonacciNumber(count: 3))
        print(getFibonacciNumber(count: 7))
        print("----")
        print(getFibonacciNumberstill(n: 3))
        print(getFibonacciNumberstill(n: 7))
        print("----")
        towerOfHanoi(n: 3, fromPole: "A", middlePole: "B", toPole: "C")
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

