//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 시간(hhmmss)을 받으면 초단위로 변경, 초단위를 시간으로 변경
 ex) 11320 >> 4400초
 */

func second(fromTime time:UInt) -> UInt
{
    var hour:UInt = time/10000
    var min:UInt = (time%10000)/100
    var sec:UInt = time%100
    
    //3600: 시간을 초로 변경하기 위한 수 60초 * 60분
    //60: 분을 초로 변경하기 위한 수 60초
    return (hour * 3600) + (min * 60) + sec
}

second(fromTime: 123450)


//본 수업 시작 - switch 문

//1. 시험 점수를 받아서 해당 점수의 등급(Grade)을 반환해주는 함수
//* Grade = A+, A, B+, B, C+. ...
// > switch문과 interval matching을 이용해서 만들어 볼 것

func grade(fromScore score:UInt) -> String
{
    var gradeValue:String = "F"
    
    switch score
    {
    case 95...100:
        gradeValue = "A+"
    case 90..<95:
        gradeValue = "A"
    case 85..<90:
        gradeValue = "B+"
    case 80..<85:
        gradeValue = "B"
    case 75..<80:
        gradeValue = "C+"
    case 70..<75:
        gradeValue = "C"
    case 65..<70:
        gradeValue = "D+"
    case 60..<65:
        gradeValue = "D"
    default:
        gradeValue = "F"
    }
    
    return gradeValue
}

grade(fromScore: 100)



// 2. Grade 받아서 Point로 변환해주는 함수 (switch를 이용해서)

func point(fromGrade grade:String) -> Double
{
    var pointValue:Double = 0.0
    
    switch grade
    {
    case "A+":
        pointValue = 4.5
    case "A":
        pointValue = 4.0
    case "B+":
        pointValue = 3.5
    case "B":
        pointValue = 3.0
    case "C+":
        pointValue = 2.5
    case "C":
        pointValue = 2.0
    case "D+":
        pointValue = 1.5
    case "D":
        pointValue = 1.0
    default:
        pointValue = 0.0
    }
    
    return pointValue
}

point(fromGrade: "A+")

