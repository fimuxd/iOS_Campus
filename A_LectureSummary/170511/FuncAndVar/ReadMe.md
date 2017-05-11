# Variable & Function

## A. 개념

### 1. 변수(var)
- 객체는 메모리에 저장된다. 
- 코드를 읽어야 한다면 메모리를 할당해서 데이터가 들어간다. 

### 2. 함수(func)
- 객체지향에서는 함수를 method라고 부른다. 
- method와 함수도 사실 서로 구분되지만, 일단 지금 시점에는 함수와 method를 구분하기 힘들다. ~나중에는 구분이 가능할 것~ 
- 한동안은 **‘함수’**라는 단어로 그 의미를 통일한다.
- 객체는 메모리에 저장된다. 
- 변수와 변수를 연산하는 행위는 함수가 처리하며 이 것은 CPU에서 처리하게 된다. 

> 변수는 메모리에, 함수는 CPU

### 3. Swift에서의 변수와 함수 
- swift 의 기본개념: 클래스(class)
	- class: 객체를 만들기위한 도면, 여기에 변수와 함수가 들어간다

- **데이터의 성질**을 선언할 때 키워드: `var` `let`

	- `var` 변할 수 있는 값 (변수)
	- `let` 변할 수 없는 값 (상수)

- **함수** 어떠한 행동(action)을 시키고자 할 때, x(input,매개변수)를 넣어서, 행동(action)과 x(input)의 결과로 y라는 결과물(return *type*)이 나오는 것
	- 여기서, 결과물을 'value' 가 아닌 *type* 이라 명명한 이유: 데이터에는 값 뿐만 아니라, 이름과 성격(type)이 필요

	###### Q: type의 첫글자는 항상 대문자인가?
	###### A: 90%는 그렇지만, 사실 소문자/대문자가 정해져 있는 것이다. 다시말하면, 기본 type	은 모두 첫 글자가 대문자이지만(90%), 사용자도 type을 만들 수 있기 때문에 첫글자가 소문자인 것도 있다. 

- 여기까지 이해한 내용을 토대로 아래와 같이 이해할 수 있다.

	```swift
	var name:String = value
	``` 

	- `name` 이라는 것은 변수(`var`)이자, `String`이라는 타입이구나.
	- `value`는 이름(`name`)과 타입(`String`)을 가지는;그러한 성격의; 변수로 인식 
	- value 는 최초값
	- 이 후 하기와 같이 명명하면, `BB`로 변경될 것이다.
	
	```swift
	name = "BB"
	```
	
	- 만약, 선언이 `var`가 아닌 `let`이였을 경우, 상수라 선언했으므로 변경을 할 수 없고, compiler error가 발생

	

## B. 변수

###### 좀 더 자세하게 

### 1. 변수명

- swift언어만 변수명을 한글로 설정 가능... ~하지만 비추~
- 이름이 길어지는 것을 고민하지 말고, 표현을 잘 하는 방법을 고민할 것. 
	- 예. 길어지는 것을 방지하기 위해 image대신 img라 명명하기도 한다.
	 단, 내 옆에 있는 사람이 내가 짠 코드를 읽고 이해할 수 있을까를 고민해야한다.
- 변수를 설정할 때 가장 어려운 것 > 변수 이름 짓기 
- 같은 맥락에서 함수 이름 짓기도 어렵다. 이름 짓기는 신중하게.


### 2. 변수의 타입

#### 기본형 (값타입)

- **정수형** `Int` `UInit`
	- `Int`: +/-,0 모두 포함하는 정수
	- `Uint`: U는 Unsigned의 약자. 부호가 없다. 절대값
	- 목적: 정확하게 필요한 메모리를 할당하기 위해서
		- 예. 10을 2진법으로 하면 1010. 그럼 총 4bit를 차지한다. 저 것을 입력하는 타입을 `Int`로 설정했다면 부호의 유무가 갈리므로 그 이상의 메모리량을 할당해야 한다. `Unit`이라면 같은양의 메모리를 할당했을 때, 표현할 수 있는 값의 절대값 `Int`에 비해 두배 클 것이다. (8bit를 기준으로 생각해보자)
		- 단, 요즘 시대에(RAM을 Gb로 쓰는 시대) `Int`면 충분하다.
		- Mac의 시스템 아키텍쳐는 64bit. 따라서 `Int`를 사용하면 자동적으로 `Int64`를 의미

	```swift
	var number1:Int = -1
	let number2:UInt = 30
	```
		 
- **실수** `Double` `Float`
	- 우리는 그냥 `Double`을 쓰면 된다.
	- 2진법으로 소수점 이하의 자리(예.0.1)를 표현하는 것은 매우 어렵다. 그래서 보통 이것을 10의 단위로 곱해서 자연수(정수)로 만든 다음 그렇게 곱했었다는 사실을 기록하게 된다. 따라서 `Init`과 `Double`을 넘나들면 약간의 오류가 생기기도 한다. 

	```swift
	var height:Double = 171.13
	```

- **문자** `Chracter`
	- 말 그대로 문자 하나. ""으로 표시
	  
	```swift
	var alphabet:Character = "a" "b" "c" "d" 
	```
	
- 문자열 `String`
	- 문자, 단어, 문장 등을 나열 할 수 있다. ""으로 표시
	
	```swift
	let fullName:String = "Bo-Young PARK"
	```

- 불리언 `Bool`
	- Boolean의 준말
	- 들어가는 값은 두가지. true(1) or false(0)
	
	```swift
	var haveACar:Bool = true
	```

- 튜플 
	- 소괄호() 안에 원하는 타입을 입력한 후, 순서에 맞게 값을 입력할 수 있다.

- interpolation(삽입)`\()`

	```swift
	var intro:(name:String, age:Int, address:String) = ("Bo-Young", "31", "Seoul")
	print("이름 : " + intro.name)
	print("나이 : \(intro.1)")
	print("주소 : \(intro.adree)")
	```

- 그 외
	- `Any` 모든 타입
	- `AnyObject` 모든 객체
	- `nil` 아무 것도 없음


> 튜플과 삽입에 대해 이해할 것

- 캐스팅(형변환)
	- 변환하고자하는 타입을 입력하고 괄호 안에 변환하고자하는 변수명을 입력

	```swift
	var total:Int = 107
	var average:Double
	average = total/5
	```

이렇게 하면 에러가 나므로, 

	```swift
	average = Double(total)/5
	```


#### 참조형(참조타입)_별도로 공부할 것 
- `ClassName`: 클래스 객체를 다른 곳에서 사용할 경우

```swift
let customView:UIView
let timer:Timer
```
	
	
> **이스케이프 시퀀스(escape sequence)**

> - 문자열 내부에 특수문자(명령어 문자) 입력할 때 사용
> 
> | E/S | 목적 |
> |---|---|
> |\b|백스페이스|
> |\n|줄바꿈(↵)|
> |\t|가로탭|
> |\v|세로탭|
> |\'|작은따옴표(')|
> |\"|큰따옴표(")|
> |\\|백슬래시|
> |\?|리터럴 물음표|




## C. 함수

###### 누구나 멘붕이 오는 부분 (ㅋㅋ쫄지말것)

- **parameter**(매개변수,x)
- **agument**(인수)
- 작성한 함수는 실행하라는 명령을 내리기 전까진 아무런 반응이 없다.
- 함수를 실행시키려면 함수의 이름을 불러줘야 한다. (아래에서는 `fName`)

```swift
func fName(agumentName paramName:Int) -> Int 
{
	return paramName + 3
}

fName(agumentName: 10)
print(fName(agumentName: 10))

```

- 이 때 `paramName`(x값) = 10
- 함수 실행 이후 출력값은 13

> 한번 함수로 자기소개를 작성해보자 [playground 바로가기](https://github.com/fimuxd/iOS_Campus/tree/master/A_LectureSummary/170511/FuncAndVar/MyPlayground.playground)
> 
> ```swift
> //함수로 자기소개 해보기
> func intro(name fullName:String, age:Int, address:String)
> {
> print("제 이름은 " + fullName + "이고, 나이는 " + String(age) + "살 입니다. 사는 곳은 " + address + "입니다." )
> }
> intro(name: "박보영", ageda: 31, address: "서울")
> ```
> 
> 이렇게 입력하면 다음과 같이 출력된다.
> 
> `제 이름은 박보영이고, 나이는 31살 입니다. 사는 곳은 서울입니다.`


### 1. Default Parameter Values

- 함수 입력시 각 parameter당 기본값을 설정할 수 있다.

![예제](DefaultParam.png)


### 2. In-OUt Parameter Keyword

- Parameter(매개변수) 타입 앞에 `inout` 입력
- 의미: 함수에 들어온 매개변수는 기본적으로 무조건 상수이다.
- 이 것을 변수로 변환해주는 것
- 보통 많이 쓰진 않는다. 왜냐하면 매개변수는 보통 외부에서 입력되기 때문에 이 값을 변형한다는 것은 논리상 맞지 않는 경우가 많다.
- inout 변수가 지정된 함수의 인수앞에서는 &가 붙어야 한다.

```swift

func addInt(num1 firstNum:inout Int, num2 secondNum:Int) -> Int
{

	firstNum = furstNum * 2 
}

```

> 일단, 함수의 기본정의, 문법 등을 정확히 인지할 것. 응용은 그 이후에

### 3. 반환타입 (return)
- 리턴되는 값은 반환타입과 같아야 한다.
- 리턴이 없는 함수라면 화살표 부터 반환타입까지 입력하지 않는다.
- 역시 반대로, 반환타입을 입력하지 않았다면 리턴도 입력하지 않는다.
