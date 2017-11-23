//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Closure연습


//1. Int 배열 받아서 String 배열 출력

let numberList:[Int] = [5,6,7,12,25,35]

let changeNumberArray:([Int]) -> [String] = {(inputNumberArray:[Int]) -> [String] in
    var returnArray:[String] = []
    
    for value in inputNumberArray {
        returnArray.append("\(value)")
    }
    return returnArray
}


changeNumberArray(numberList)


//2. Int 배열의 데이터중 짝수만 구하기

//하기 내용은 for-in 문의 장점을 제대로 살리지 못한 것임. 다시 짰기 때문에 주석처리 함
//let getEvenNumberArray:([Int]) -> [Int] = {(inputNumberArray:[Int]) -> [Int] in
//    var returnArray:[Int] = []
//
//    for index in 0...inputNumberArray.count-1 {
//        if inputNumberArray[index]%2 == 0 {
//            returnArray.append(inputNumberArray[index])
//        }
//
//    }
//    return returnArray
//}

let getEvenNumberArray:([Int]) -> [Int] = {(inputNumberArray:[Int]) -> [Int] in
    var returnArray:[Int] = []
    
    for value in inputNumberArray {
        if value%2 == 0 {
            returnArray.append(value)
        }
        
    }
    return returnArray
}
getEvenNumberArray([102,103,4,526])


/****************************************/
//                  map                 //
/****************************************/
let strList = numberList.map { (num:Int) -> String in
    return "\(num)"
}

//상기 Closure는 줄일 수 있다.
let strList1 = numberList.map {"\($0)"}
print(strList1)


/****************************************/
//                filter                 //
/****************************************/
let evenNums = numberList.filter { (number) -> Bool in
    number%2 == 0
}

//상기 Closure는 줄일 수 있다.
let evenNums1 = numberList.filter {$0%2 == 0}
//print(evenNums1)


/****************************************/
//                Reduce                 //
/****************************************/
//1. 구구단 구하는 Closure: (Int) -> [String]

let danList = 1...9

let gugudan:(Int) -> [Int] = {(dan:Int) -> [Int] in
    var resultList:[Int] = []
    
    for gob in danList {
        resultList.append(gob*dan)
    }
    return resultList
}

gugudan(3)


//map을 사용한다면,

let gugudanMap = danList.map { (number:Int) -> Int in
    return number*7
}

print(gugudanMap)


//2. Factorial 구하기

let factorialFive = [1,2,3,4,5]

let factorialNumber = factorialFive.reduce(1) {(num1, num2) -> Int in
    num1*num2
}

let sumNumber = factorialFive.reduce(0) { (num1, num2) -> Int in
    (num1+num2)
}
print(factorialNumber)
print(sumNumber)
