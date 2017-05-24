//: Playground - noun: a place where people can play

import UIKit

//1. inch to cm, cm to inch (2개)
func inchToCM(number:Double) -> Double
{
    return number / 2.54
}

print("\(inchToCM(number: 4))cm 입니다.")


func CmToInch(number:Double) -> Double
{
    return number * 2.54
}

CmToInch(number: 4)

// 한개로 합쳐본다면?

func invertInchAndCM(type:String, number:Double) -> String
{
    let length:Double = number
    if type == "인치"
    {
        return "\(inchToCM(number: length))"
    }else if type == "센티미터"
    {
        return "\(CmToInch(number: length))"
    }
    return "입력하세요"
}

invertInchAndCM(type: "센티미터", number: 4)

//2. m2 to 평, 평 to  m2 (2개)
func squareMeterToPyeong(size:Double) -> Double
{
    return size * 0.3025
}

squareMeterToPyeong(size: 110)

func pyeongToSquareMeter(size:Double) -> Double
{
    return size * 3.3058
}

pyeongToSquareMeter(size: 34)



//3. 화씨 to 섭씨, 섭씨 to 화씨 (2개)
func FahrenheitToCelsius(temp:Double) -> Double
{
    return temp - 32 / 1.8
}

FahrenheitToCelsius(temp: 79)

func CelsiusToFahrenheit(temp:Double) -> Double
{
    return 32 + (18/10 * temp)
}

CelsiusToFahrenheit(temp: 32)




//4. 데이터량 (KB to MB, MB to GB) (2개)
func KBToMB(byte:Double) -> Double
{
    return byte / 1024
}

KBToMB(byte: 1434425345)

func MBToGB(byte:Double) -> Double
{
    return byte / 1024
}

MBToGB(byte: KBToMB(byte: 1434425345))



//5. 시간(hhmmss)을 받으면 초단위로 변경, 초단위를 시간으로변경
//ex) 113200 >> 4400초
func hourToSec(time:UInt) -> UInt
{
    var hour:UInt = time/10000
    var min:UInt = (time%10000)/100
    var sec:UInt = (time%10000)%100
    
    return (hour * 3600) + (min * 60) + sec
}

hourToSec(time: 246024)
