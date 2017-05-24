//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func introduce(myself:(name:String, age:UInt, gender:String))
{
    print("제 이름은 \(myself.0) 이고, 나이는 \(myself.1),성별은 \(myself.2) 입니다.")
}

introduce(myself: (name:"Bo-Young", age:31, gender:"여성"))

var money:(bill50K:UInt, bill10K:UInt, bill5K:UInt) = (3,4,5)
print("5만원권은 \(money.0)장 입니다")
print("1만원권은 " + "\(money.1)" + "장 입니다")
print("5천원권은 \(money.bill5K)장 입니다")

func swapTwoInts(_ a: inout Int, _ b: inout Int)
{
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 10
swapTwoInts(&someInt, &anotherInt)