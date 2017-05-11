/*
 이 곳은 놀이터
 변수와 함수를 가지고 놀아보자
 */

//변수 가지고 놀기

var list:String = "No.1: String 변수"
print(list)

var lastName:String = "PARK "
print(lastName)


list = "No.2: 이스케이프 시퀀스, 변수값 더하기"
print(("\n") + list)

var firstName:String = "Bo-Young"
print(firstName)


list = "No.3: String 입력값, 변수값 더하기"
print(("\n") + list + ("\n") + ("My name is ") + lastName + firstName)


list = "No.4: 캐스팅 후 변수값 더하기"
print(("\n") + list)
var age:Int = 31
print(("I am ") + String(age) + (" years old."))


list = "No.5: 튜플"
print(("\n") + list)
var address:(String,String) = ("Seoul","Gangdong-gu")
print("I live in \(address.1)" + ", \(address.0)" + ".")


list = "No.6: 불리언"
print(("\n") + list)
var haveACar:Bool = true
print(("Do you have a car? >") + String(haveACar))


list = "No.7: Double, 캐스팅"
print(("\n") + list)
var height:Double = 171.23456789
print("I am " + String(height) + "cm tall.")


list = "No.8: 사칙연산, 캐스팅"
print(("\n") + list)
var total:Int = 24
var average: Double = 1
average = Double(total)/5
print(("24 나누기 5는 ") + String(average))


list = "No.9: 캐릭터, 캐스팅, 튜플"
print(("\n") + list)
var univInit1:Character = "H"
var univInit2:Character = "Y"
var univ:(Character,Character,String) = (univInit1,univInit2,"Univ.")
print(String(univ.0) + String(univ.1) + " " + univ.2)


list = "No.10: 상수"
print(("\n") + list)
let Motto:String = "Life is a game. Play it."
print(Motto)

print("\n \n")
//함수 가지고 놀기
func print(name printStr:String)
{
    print(printStr)
}

print(name: "바우")
print(name: "보")
print(name: "보다지")
print(name: "박보다지")

func addInt(num1 firstNum:Int, num2 secondNum:Int) -> Int
{
    return firstNum + secondNum
}

var totalNum:Int = addInt(num1: 1, num2: 2)
print(totalNum)

//함수로 자기소개 해보기

func intro(name fullName:String, ageda age:Int, address:String)
{
    print("제 이름은 " + fullName + "이고, 나이는 " + String(age) + "살 입니다. 사는 곳은 " + address + "입니다." )
}

intro(name: "박보영", ageda: 31, address: "서울")

print("\n")

func getNumber(firstNum num1:Int) -> Int
{
    return num1
}

getNumber(firstNum: 3)

func getNumber(num1:Int) -> Int
{
    return num1
}

getNumber(num1: 3)

func getNumber() -> Int
{
    var num1:Int = 22
    return num1
}

getNumber()

func getNumber(firstNum num1:Int, secondNum num2:Int) -> Int
{
    return num1 + num2
}

getNu
