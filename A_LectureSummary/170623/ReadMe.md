# Closure

## A. 일급 객체

***
컴퓨터 프로그래밍 언어 디자인에서, 특정 언어의 일급 객체 (first-class citizens, 일급 값, 일급엔티티, 혹은 일급 시민)이라 함은 일반적으로 다른 객체들에 적용 가능한 연산을 모두 지원하는객체를 가리킨다. 함수에 매개변수로 넘기기, 변수에 대입하기와 같은 연산들이 여기서 말하는일반적인 연산의 예에 해당한다.

다음과 같은 조건을 만족할 때 일급 객체라고 말할 수 있다.
• 변수나 데이터 구조안에 담을 수 있다.<P>• 파라미터로 전달 할 수 있다.<p>• 반환값(return value)으로 사용할 수 있다.<p>• 할당에 사용된 이름과 관계없이 고유한 구별이 가능하다.<p> • 동적으로 프로퍼티 할당이 가능하다.
***

- **Swift의 함수는 일급 객체이다**
	- 지금까지 우리가 쓴 함수는 일급 객체에 필요한 부품 중 하나였다. 하지만 Swift에서는 이 함수 자체도 일급 객체다. 함수 자체를 변수나 구조에 담을 수 있고, 파라미터로 전달 할 수 있고, 반환값으로 사용할 수 있다.

## B. 중첩함수

***
• 함수 내부에서 함수를 정의해서 사용 되는 함수• 외부에는 숨겨져 있으며 선언된 함수 내부에서만 호출 가능하다.

```swift
func chooseStepFunction(backward: Bool) -> (Int) -> Int {	func stepForward(input: Int) -> Int { return input + 1 }	func stepBackward(input: Int) -> Int { return input - 1 }	return backward ? stepBackward : stepForward}
```
***

- 함수안에 함수가 있는 것.
- 함수의 범위를 보면, 변수도 마찬가지듯이 시작하고 끝이 나면 사라진다. 따라서 함수안에 함수는 함수 내부에서만 사용할 수 있다.
- 지금까지는 리턴값이 하나였다. 하지만 함수가 일급 객체이기 때문에 이제는 함수도 리턴할 수 있다.
- `backward ? stepBackward : stepForward` 의 의미: backward가 참(true)이면 stepBackward고, 거짓(false)이면 stepForward를 하라는 *삼항연산자(A?B:C)*

***
*(상단의 chooseStepFunction을 실행하는 ViewDidLoad() 같은 곳에서의 실행모습)*

```swift
var currentValue = -4let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)// moveNearerToZero now refers to the nested stepForward() functionwhile currentValue != 0 {print("\(currentValue)... ")currentValue = moveNearerToZero(currentValue)}
```

***

- 실행되는 과정을 생각해보면
	- 1. `currentValue` 가 `-4`
	- 2. `-4 > 0` : false 다.
	- 3. `chooseStepFuction(backward:)` 는 false 다.
	- 4. false이므로 return은 `stepForward()` 가 실행된다.
	- 5. `stepForward()` 의 return은 3이다. 이 것은 곧 새로운 `currentValue` 다.
	- 6. 1~5의 과정을 `currentValue` 가 0이 될 때까지 while문을 통해 반복하게 된다. 
	- 7. `currentValue` 의 값이 0이 되면 종료된다.

- 객체지향에서는 클로저를 거의 쓰지 않는다. 함수지향에서 주로 사용하게 된다.

## C. 클로저

### 1. 개념

***
클로저는 코드에서 전달되고 사용할 수 있는 독립적인 기능 블록입니다.
클로저는 정의된 context에서 모든 상수 및 변수에 대한 **참조를 캡처** 하고 저장할 수 있습니다.
글로벌 및 중첩함수는 함수라고 설명했었으나, 실제로는 클로저의 특별한 종류이다.

<클로저의 유형><p>• Global function(전역함수)는 이름이 있고 값을 캡처하지 않는 클로저입니다.<p>• Nested function(중첩함수)는 이름을 가진 클로저로 내부 함수에서 값을 캡처 할 수 있습니다.<p>• Closure expressions은 주변 컨텍스트에서 값을 캡처 할 수있는 간단한 구문으로 작성된 이름없는 클로저입니다.<p>
***

- 지금까지 우리가 썼던 모든 함수는 클로저다. 메소드는 클로저가 아니다. 클래스밖에 쓰는 함수는 글로벌함수(전역함수)이며 곧 클로저의 종류 중 하나다.


### 2. Closure Expressions

***

```swift
{(parameters) -> `return type` in
 `statements`
}
```

***

- 클로저에서는 argument를 적지 않는다. {(parameterName:type, parameterName:type, ...) -> returnType in statements} 같은 형태로만 진행된다. 

## D. Closure 예

### 1. 쓰임의 예시

- 이렇게 Closure가 쓰인다는 의미로 볼 것

***

```swift
//1. 
self.present(nextVC, animated:true, completion:( () -> void )? )//2. let alert = UIAlertAction(title: "알럿", style: .default,
						handler: ((UIAlertAction) -> Void)? )//3. UIView.animate(withDuration: 0.3,
				animations: () -> Void,
				completion: ((Bool) -> Void)?)
```

***

### 2. Sorted(by:) 예시를 통한 클로저의 이해

***

```swift
func sorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element]

	override func viewDidLoad() {		super.viewDidLoad()
				let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]		
		func backward(_ s1: String, _ s2: String) -> Bool {			return s1 > s2		}		
		let sorted = names.sorted(by: backward)		print(sorted) //[“Ewa”, "Daniella", "Chris", "Barry", "Alex"]	}

```

***

- String 과 String도 ASCII Code에 의해 결국 숫자로 변환되며, 따라서 크기를 비교할 수 있다. A to Z, 대문자 to 소문자 갈 수록 값이 커진다.
- Swift는 유니코드를 지원하기 때문에 한글(ㄱ~ㅎ)간 비교도 가능하다.

	#### 1) Inline Closure
	
	- 상단의 `func backward()...` ~ `let sorted...` 부분을 Closure 식으로 생각해보면
	
	***
	
	```swift
	override func viewDidLoad() {	super.viewDidLoad()	
		let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]	//아래 예제 backward(_:_:)는 이전 버전의 함수를 클로저식으로 나타낸 것입니다.	let sorted = names.sorted(by:		{( s1: String, s2: String) -> Bool in			return s1 > s2		}	)
			print(sorted) //[“Ewa”, "Daniella", "Chris", "Barry", "Alex"]	}
	```
	
	***
	
	- 결국, `sorted()` 의 parameter에 클로저식 문법을 쓴 것

	#### 2) 클로저 간소화
	
	- Swift는 알아서 단축시켜주는 것들이 많다. 클로저도 그렇다.
		- 1. 타입유추를 해준다: ~내가 이거 넣으라고 했으니까 당연히 이 타입으로 넣었겠지~
		- 2. `return` 삭제 가능: return 할 statement 가 한 줄일 때만 `in` 뒤에 바로 statement 입력 가능 ~어차피 한줄이면 이게 return이겠지~
		- 3. parameter명 삭제 가능: default 값(raw Value) 같이 `$0`, `$1`, `$2`... 같이 표현할 수 있다. 단, parameter가 있을 때만.
		- 4. 가장 마지막 parameter명은 삭제 가능
	
	- 따라서, 상단의 `sorted()` 를 간소화시켜보자
	
		```swift
		//원본
		let sorted = names.sorted(by:
		        {(s1: String, s2: String) -> Bool in
		            return s1 > s2
		        }
		    )
		
		//1. 타입유추 간소화
		let sorted = names.sorted(by:
				{s1, s2 in return s1 > s2
				}
		)
		
		//2. return 간소화
		let sorted = names.sorted(by:
				{s1, s2 in s1 > s2
				}
		)
		
		//3. parameter명 삭제
		let sorted = names.sorted(by: {$0 > $1})
		
		//4. 여기서, > 는 이 자체로 함수다. 따라서,
		let sorted = names.sorted(by: > )
		
		//5. trailing closure를 사용해보자. by:는 처음이자 하나이며 유일한 parameter이다.
		let sorted = names.sotrted { $0 > $1 }
		```

	#### 3) 변수 할당
	
	- 클로저 자체를 변수로 할당해서 함수를 변수처럼 쓸 수 있다.
	
		```swift
		let ascending = {(s1:Int, s2:Int) -> Bool in s1 > s2}
		let descending = {(s1:Int, s2:Int -> Bool) in s1 < s2}
		
		override func viewDidLoad() {
			super.viewDidLoad()
		
			let list = [1,2,3,4,5,6]
		
			let newList = list.sorted(by:ascending) 
			let newList2 = list.sorted(by:descending)
			
			print(newList)	//[6,5,4,3,2,1]
			print(newList2)	//[1,2,3,4,5,6]
		}
		```
	
		- 상단에서, `!ascending` 은 결국 `descending` 이 아닐까? 하는 질문 -> 아니다. `ascending` 의 타입은 `Bool` 이 아니라, `(Int, Int) -> Bool` 이다. 함수 자체인 것이다. 함수는 어떠한 return값을 저절로 내지 않는다. 

	#### 4) 캡쳐
	
	***
	
	• 클로져 안의 모든 상수와 변수에 대한 **참조를 캡쳐** 해서 관리 한다.<p>• Swift는 캡쳐를 위한 모든 메모리를 관리한다.
	
	***
	
	- 참조를 캡쳐한다는 것은 reference를 캡쳐한다는 것이고, reference를 캡쳐한다는 것은 주소값을 캡쳐한다는 것이다.
	
	***
	
	```swift
	func makeIncrementer(forIncrement amount: Int) -> () -> Int {		var runningTotal = 0		
		func incrementer() -> Int {			runningTotal += amount			return runningTotal		}	
	return incrementer	}
	
	let incrementByTen = makeIncrementer(forIncrement: 10)	incrementByTen()		// returns a value of 10	incrementByTen()		// returns a value of 20	incrementByTen()		// returns a value of 30
	```
	
	***
	
	- 여기서 `makeIncrementer()` 의 return type은 클로저다. `() -> Int` 이므로.
	- 그래서 return 값이 `incrementer` 중첩함수인 것이다.
	- 참조를 캡쳐하는 것은 중첩함수인 `incrementer` 다.

> **Summary** : 클로저 문법은 생소한데다 생략법이 많아서 처음에는 이해부터가 힘든 것이 정상이다.<p>
> 1. 일단, 문법을 외울 것<p>
> 2. 클로저 문법이 적용된 것들을 사용해볼 것<p>
> 3. 축약해볼 것<p>
> 4. 직접 클로저를 만들어볼 것