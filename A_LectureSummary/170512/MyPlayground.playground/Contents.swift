//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//어제 배운 것 조교님 예제

let numA:Int = 10
let numB:Int = 5

func addTwoNum(firstNumb num1: Int, secondNumb num2: Int) -> Int {
    return num1 + num2
}

func square(of number: Int) -> Int {
    return number * number
}

var result2: Int = square(of: 4)

var result: Int = addTwoNum(firstNumb: 3, secondNumb: 4)


//조건문

//1. 

func isEven1(number num:Int) -> Bool {
    if (num % 2) == 0 {
        return true
    }else{
        return false
    }
}

isEven1(number: 4)
print(isEven1(number: 4))

isEven1(number: 5)
print(isEven1(number: 5))

let evenNumber1:Bool = isEven1(number: 2123154523464635)

print(evenNumber1)


//2. else는 보안써도 무방해서 지울 수 있다. 하지만 거짓일 경우의 조건을 입력하지 않은 것이므로, 거짓일 경우에는 return이 되지 않는다. 따라서 if문 바깥, func의 내부에 return false를 별도 입력해주어야 한다.

func isEven2(number num:Int) -> Bool {
    if (num % 2 ) == 0 {
        return true}
    
    return false
}

let evenNumber2:Bool = isEven2(number: 134445)

print(evenNumber2)


//3.  튜플과 조건문, 연산자를 이용한 함수 작성

let h:(floor:Int, location:String, money:Int) = (12, "Seoul", 5000)

func isAble(myHome: (floor:Int, location:String, money:Int)) -> Bool
{
    
    if myHome.floor >= 10 && myHome.location == "Seoul" && myHome.money <= 8000
    {
        print("완벽한 나의 집")
        return true
    }
    else if (myHome.0 >= 10 && myHome.1 == "Seoul") || myHome.2 <= 8000
    {
        print("괜찮은 나의 집")
        return true
    }
    else if myHome.floor >= 10 || myHome.location == "Seoul" || myHome.money <= 8000
    {
        print("좀 더 알아보자")
        return true
    }

    return false
}

print(isAble(myHome: (h)))

let h1:(floor:Int, location:String, money:Int) = (9, "Gyeonggi-do", 3000)

print(isAble(myHome: (h1)))



//4. Swap 을 이용한 함수 작성

func swapToInt(_ num1:inout Int, _ num2:inout Int)
{
    let temp:Int = num1
    num1 = num2
    num2 = temp
}

func minus(firstNum num1:Int, secondNum num2:Int) -> Int
{
    var vNum1 = num1
    var vNum2 = num2
    
    if vNum2 > vNum1 {
        
        swapToInt(&vNum1,&vNum2)
    }
    
    return vNum1 - vNum2
    
}

print(minus(firstNum: 5, secondNum: 10))
print(minus(firstNum: 10, secondNum: 5))






