//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func isNumber(inputNum:String) -> Bool {
    if let unwrapStr:String = inputNum {
        print(unwrapStr)
        return true
    }
        return false
}

isNumber(inputNum: "1")

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

checkSeveral(num1: "1", num2: "2")

