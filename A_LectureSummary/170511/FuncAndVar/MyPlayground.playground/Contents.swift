//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("print \(str)")

var name:String = "B"

print("my name is \(name)")

name = "Park"

print("my name is \(name)")

print("Int의 최대수는 \(Int.max)입니다.")
print("Int의 최소수는 \(Int.min)입니다.")

print("Uint의 최대수는 \(UInt.max)입니다.")
print("Uint의 최소수는 \(UInt.min)입니다.")

var number:Int = 50
number = 51

print(number)

let age:Int = 100

print(age)


var coin:(Int,Int,Int,Int) = (3,1,5,3)
print("10원짜리 :\(coin.0)")
print("100원짜리 \(coin.1)")
print("1,000원짜리 \(coin.2)")
print("10,000원짜리 \(coin.3)")

var person:(name:String, age:Int, height:Double) = ("B", 29, 171.9)
print("이름 : " + person.name)
print("나이 : \(person.age)")
print("신장 : \(person.height)")

