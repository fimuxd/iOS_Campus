# Function Control Flow

## A. 조건문

### 1. 개념

- 함수 내부에서 실행
	- 다른 곳에서는 실행되지 않음.
- 특정 조건에 따라 선택적 코드 실행
	- 내가 작성한 걸 모두 하는게 아니라, a,b,c 등 내가 선택의 기로에 섰을 때, 조건이 들어가고 만족할 경우 실행
- `if-else` `switch-case`

### 2. if-else 문

- 조건이 만족되면 if, 불만족시 else
- 또한 if-else는 간단한 error처리 방법으로 사용 가능
- code를 선택적으로 실행시킬 수 있는 방법

```swift
if 조건 {
		//조건이 만족되면 실행
	}else{
		//조건이 만족되지 않을 때 실행
	}
```

### 3. else if 문

- 조건에 조건을 (반복)추가 가능한 문
- 조건의 순서는 순차적으로. 작은 범위에서 큰 범위로 작성

```swift
if 조건1 {
		//조건1이 만족되면 실행
	}else if 조건2{
		//조건1이 만족되지 않을 때 실행
	}else{
		//조건들 모두 만족되지 않을 때 실행
	}
```

### 4. switch 문

#### 기본 개념
- 패턴 비교문: swift의 switch문은 지금까지의 다른 언어의 switch문과 다르다. 
- 가장 첫번째 매칭되는 패터의 구문이 실행된다.

```switch
switch 어떠한 값 (x)
{
	//x에 value 1을 넣으면, 어떻게 반응하라는 의미
	case value 1:
		respond to value 1
	//case를 추가할 때는 콜론(,)을 넣고 추가한다
	case value 2,
		value 3:
		respond to value 2 or 3
	default:
		otherwise, do something else
}
```
- case문을 사용했으면 어떠한 값에든 걸려야 한다. 어떠한 값에도 걸리지 않으면 error가 발생한다.
- `default`는 90% 이상의 경우에 무조건 쓰는 것이 일반적이다.
	- `default`는 switch	문 내에서 아무 case에도 해당하지 않을 때 나타내는 기본 값
	- 함수의 `return`과 비슷해 보일 수 있지만, return과 default는 적용의 범위와 작용이 다르다.
- 조건이 여러개의 case에 적용되더라도, 첫번째 case에 적용되면 그 뒤의 case는 읽지 않고 그냥 끝나버린다.
- 기존 switch문이랑 다른 것
	- 브레이크가 없다. 그냥 case 하나만 걸리면 끝남
	- 유니코드 사용 가능
	- String도 쓸 수 있다.


```swift
func sampleSwitch(someCharacter:Character)
{
	switch someCharacter
	{
	case "a":
		print("The first letter of the alphabet")
	case "z":
		print("The last letter of the alphabet")
	default:
		print("Some other character")
	}
}
```

#### Interval Matching

- 범위 연산자를 사용하는 것 (예. 1...100)


#### 튜플매칭

- 튜플을 이용해서 여러개의 값(value)을 동시에 확인 가능
- 사용가능한 모든 값에 대한 매칭은 와일드 카드(_)로 매칭 가능
	- 와일드카드는 모든값에 대한 매칭이란 표현보다는, 사실 저 자리에 들어가는 값을 ***무시***하겠다는 의미가 더 강하다.
	
```switch
func getPoint(somePoint:(Int,Int))
{
	switch somePoint 
	{
	case (0, 0):
		print("\(somePoint) is at the origin")
	case (_, 0):
		print("\(somePoint) is on the x-axis")
	case (0, _):
		print("\(somePoint) is on the y-axis")
	case (-2...2, -2...2):
		print("\(somePoint) is inside the box")
	default:
		print("\(somePoint) is outside of the box")
	}
}
```


#### 값 바인딩

- swift 언어의 switch 문에서만 볼 수 있는 가장 특이한 기능
- case 내부에서 사용되는 임시 값으로 매칭 시킬 수 있다.

```swift
func getPoint(somePoint:(Int,Int))
{
	switch somePoint 
	{
	case (0, 0):
		print("\(somePoint) is at the origin")
	case (let x, 0):
		print("on the x-axis with an x value of \(x)"
	case (0, let y):
		print("on the x-axis with an y value of \(y)"
	case (-2...2, -2...2):
		print("\(somePoint) is inside the box")
	default:
		print("\(somePoint( is outside of the box")
	}
}
```

		
#### where 문

- switch문 내에서 값 바인딩을 한 후, where문을 추가할 수 있다.
- where문의 목적: case에 추가로 또  조건을 쓸 수 있는 것
 
```swift
func wherePoint(point:(Int, Int))
{
	switch point
	{
	//상단에서 point의 타입은 (Int, Int)라 정의하였기 때문에, 아래에서 x와 y가 자동적으로 Int일 것이라, 컴파일러가 추론할 수 있다,
	case let (x, y) where x == y:
		print("(\(x), \(y)) is on the line x == y")
	//상단의 let (x,y)는 (let x, let y)와 같은 의미다.
	case let (x, y) where x == -y:
		print("(\(x), \(y)) is on the line x == -y")
	case let (x, y):
		print("(\(x), \(y)) is just some arbitrary point")
	//여기서는 default를 입력하지 않았다. 이유는, 상기 case에 모든 경우가 적용되므로
	}
}
```



## B. 연산자

### 1. 산술 연산자

| 기호 | 설명 | 예제 |
|:---:|:---:|:---:|
|+|더하기|1 + 2 = 3|
|-|빼기|5 - 3 = 2|
|*|곱하기|4 * 8 = 32|
|/|나누기|10 / 5 = 2|
|%|나머지|10 % 3 = 1|

### 2. 비교 연산자
| 기호 | 설명 | 예제 |
|:---:|:---:|:---:|
|==|같다|A == B|
|>=|이상|A >= B|
|<=|이하|A <= B|
|>|초과|A > B|
|<|미만|A < B|

- = (equal)은 '같다'는 의미가 아닌, 대입 연산자. 따라서 '같다'는 의미로는 비교 연산자인 `==`를 사용한다.

### 3. 논리 연산자

```swift
//swift에서는, 일반적인 수학문법 같은

	100 > x > 0 
	// error: 인식하지 못함
	
//따라서, 논리 연산자를 이용, 아래와 같이 표기한다.

	(100 > x) && (x > 0)
```

| 기호 | 설명 | 예제 |
|:---:|:---:|:---:|
|&&|모두가 참일 때 참|A && B|
|ㅣㅣ|하나라도 참이면 참|A ㅣㅣ B|
|!|부정(Not)|!(A && B), A != B|

### 4. 추가연산자

###### 알아두면 좋고 몰라도 큰 문제 없음

```swift
//일반적인 수식
	a = a + 1

//이 것을 복합 연산자로 표현하면
	a += 1
```

> 산술, 비교, 논리연산자는 확실히 이해할 것


[Project 실습파일](https://github.com/fimuxd/iOS_Campus/blob/master/A_LectureSummary/170512/FunctionPractice/FunctionPractice/ViewController.swift)






