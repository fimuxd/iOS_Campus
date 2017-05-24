//: Playground - noun: a place where people can play

import UIKit

//(정)사각형의 넓이 구하는 함수 만들기
//argument : width(가로), length(세로).
func sizeOfSquare(width:Int, length:Int) -> Int
{
    return width * length
}

sizeOfSquare(width: 3, length: 4)



//원의 넓이 구하는 함수 만들기
//argument : radius(반지름)
func sizeOfCircle(radius:Double) -> Double
{
    let pi:Double = 3.14
    return radius * radius * pi
}

sizeOfCircle(radius: 4)


//삼각형의 넓이 구하는 함수 만들기
//argument : base(밑변), height(높이)
func sizeOfTriangle(base:Int, height:Int) -> Int
{
    return base * height * 1/2
}

sizeOfTriangle(base: 3, height: 4)



//사다리꼴의 넓이 구하는 함수 만들기
//argument : base(밑변), top(윗변), height(높이)
func sizeOfTrapzoid(base:Int, top:Int, height:Int) -> Int
{
    return (base + top) * height * 1/2
}

sizeOfTrapzoid(base: 3, top: 3, height: 1)



//(정)육면체의 부피 구하는 함수 만들기
//argument: width(가로), length(세로), height(높이)
func volumeOfCube(width:Int, length:Int, height:Int) -> Int
{
    return width * length * height
}

volumeOfCube(width: 12, length: 12, height: 13)


//원기둥의 부피 구하는 함수 만들기
//argument: radius(반지름), height(높이)
func volumeOfCylinder(radius:Int, height:Int) -> Double
{
    let pi:Double = 3.14
    return Double(radius) * Double(radius) * pi * Double(height)
}

volumeOfCylinder(radius: 4, height: 5)

//구체의 부피 구하는 함수 만들기
//argument : radius(반지름)
func volumeOfBall(radius:Int) -> Double
{
    let pi:Double = 3.14
    return 4/3 * pi * Double(radius) * Double(radius) * Double(radius)
}

volumeOfBall(radius: 3)



//원뿔의 부피 구하는 함수 만들기
//argument: radius(반지름), height(높이)
func volumeOfCone(radius:Double, height:Double) -> Double
{
    let pi:Double = 3.14
    return 1/3 * pi * radius * radius * height
}

volumeOfCone(radius: 4, height: 4)

