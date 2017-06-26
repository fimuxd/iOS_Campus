# Closure 예제

#### 들어가기 전에 Closure 연습

1. Int배열 String배열로 바꾸기
2. Int배열 데이터 중 짝수만 구하기

```swift
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

changeNumberArray(numberList) //["5","6","7","12","25","35"]

//2. Int 배열의 데이터중 짝수만 구하기

let getEvenNumberArray:([Int]) -> [Int] = {(inputNumberArray:[Int]) -> [Int] in
    var returnArray:[Int] = []
    
    for value in inputNumberArray {
        if value%2 == 0 {
            returnArray.append(value)
        }
        
    }
    return returnArray
}

getEvenNumberArray(numberList) //[6,12]

```

## A. map

***

• map은 지도가 아닌 mapping이란 단어로 이해<p>• 컬렉션의 각 항목의 데이터를 다른 데이터로 변경해주는 역할<p>• 클로저를 이용, 각 항목에 대해 **한번** 호출되며, 해당 항목에 대해 mapping된 값을 반환한다. (다른 타입도 가능) <p>

***

- List의 Collection을 좀 더 쉽게 하기 위해 만들어진 함수
- mapping: A와 B를 연결시킨다는 의미
- 상단의 예시를 map 함수를 이용해  표현해보면,

	```swift
	let strList = numberList.map { (num:Int) -> String in
	    return "\(num)"
	}
	
	//상기 Closure는 줄일 수 있다.
	let strList = numberList.map {"\($0)"}
	``` 
	
## B. filter

***

• 컬렉션의 특정 아이템을 걸러내는 함수<p>• 클로져를 통해 걸러내어야 하는 데이터의 조건을 전달해준다.

***

- filter는 Bool 값을 리턴한다. 걸러낼 것이냐, 거르지 않을 것이냐는 의미
- filter해서 표현할 조건을 `in` 내에 넣어준다. 걸러서 버리는게 아니라, 거른 것을 내가 가지는 것.
- 상단의 예시를 filter 함수를 이용해  표현해보면,

```swift
let evenNums = numberList.filter { (number) -> Bool in
    number%2 == 0
}

//상기 Closure는 줄일 수 있다.
let evenNums = numberList.filter {$0%2 == 0}
```

## C. Reduce

***

• 컬렉션 내부의 모든 콘텐츠의 값을 하나의 값으로 합쳐주는 함수<p>• 인자를 2개받으면 첫번째 인자는 초기값, 두번째 인자는 클로져로서 결과값과 각 인자를 합치는 역할을 합니다.<p>

***

- 사실 reduce라는 말보다는 combine이라는 용어가 더 어울린다고들 한다. ~reduce에 압축하다라는 뜻도 있음~
- 단순히 합치는 기능 뿐만 아니라, in 뒤에 어떠한 방식으로 값을 연산할지 표현할 수 있다. 
- 예제 풀어보자

	```swift
	//팩토리얼 구하기
	let factorialFive = [1,2,3,4,5]
	
	let factorialNumber = factorialFive.reduce(1) {(num1, num2) -> Int in
	    num1*num2
	}
	
	print(factorialNumber) //120
	```


