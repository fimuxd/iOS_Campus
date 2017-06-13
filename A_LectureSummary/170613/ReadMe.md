# Property

## A. 개념

- Swift안에서 스트럭트나 클래스 안에서 부르는 `인스턴스 변수` 의 이름
- 다만, 이 아이의 역할이 다양하기 때문에 별도로 변수가 아닌 프로퍼티라는 이름을 부여한 것

## B. 종류

### 1. 저장 프로퍼티(Stored Properties)

- 저장 프로퍼티는 저장만 한다.
- 열거형에서는 쓰이지 않는다. 클래스, 구조체에서만 쓰인다.
- 지금까지 쓴 기본형태의 변수들이자 가장 일반적인 형태의 프로퍼티

#### - 지연 저장 프로퍼티 (Lazy Stored Properties)

- 원래 프로퍼티는 클래스나 스트럭트에 인스터느가 생성될 당시에 만들어진다. 무조건 초기화 당시에 만들어진다.
- 하지만 lazy는 만들어지지 않는다. 언제 만들어지냐? 내가 처음으로 사용할 때 만들어진다. 불러오거나 값을 집어넣는 등 처음 사용할 때 만들어진다.
- 안 써도 상관없지만, 성능개선할 수 있는 옵션같은 느낌

### 2. 연산 프로퍼티(Computed Properties)

	#### 1) 개념
	
	- 연산 프로퍼티는 저장을 할 수 있을까? -> 없다. 연산만 한다.
	- get, set 키워드를 통해 값을 간접적으로 설정 또는 받는다.
		- get: 값을 가져오는 것
		- set: 값을 집어넣는 것
	- getter/setter 두가지 역할을 한다. ~얘네들이 머임?~ -> 객체지향에서는 은닉화, 캡슐화를 통해 다른 인스턴스 간 데이터를 주고 받으려면 메소드를 활용하라고 되어있다. 즉, 직접적으로 프로퍼티에 접근해서 값을 넣거나 빼지 말라는 뜻이다. 그렇다면 어떻게 작업하느냐? 프로퍼티의 값을 넣는 역할과 빼는 역할의 함수를 각각 만든다.
		- 예) get과 set의 개념을 이해해보자. 아래는 Java에서 쓰는 방식을 swift 언어러 표현해 본 것.
	
			```swift
			class a {
				private var total = 0 // 이 놈을 다른 곳에서 임의로 값을 바꿔버리면 안되기 때문에
				
				func getTotal() -> Int{
				}
				
				func setTotal(newValue:Int){
				} //total에 값을 집어넣어선 안된다면, setTotal을 지우면 된다.
			}
			```
			
			```swift
			class b{
				private var koreanScore = 0
				
				func setKoreanScore(newValue:int) {
					if newValue > 0 && newValue < 100 {
						koreanScore = newValue
					}else{
						koreanScore = 0
					}
				} //데이터를 외부에서 받더라도, 내가 원하는 방식으로 걸러서 받도록 if 문을 설정
			}
			```
			
			이를 swift 문법으로 표현해보면,
			
			```swift
			struct MyClass {
				private var total:Int = 0
				private var kScore:Int = 0
				private var eScore:Int = 0
				
				private var subjectCount:Int = 0
				private var isInputKScore:Bool = true
				private var isInputEScore:Bool = true
				
				var koreanScore:Int{
					get{
						return kScore
					}
					set(newScore){
						if isInputKScore { 
						
							if newScore <= 100 && newScore >= 0 {
								kScore = newScore
								total += newScore
								subjectCount += 1
								isInputKScore = false
							}
						}
					}
				}
			   
			   var englishScore:Int{
					get{
						return eScore
					}
					set(newScore){
						if isInputEScore { 
						
							if newScore <= 100 && newScore >= 0 {
								eScore = newScore
								total += newScore
								subjectCount += 1
								isInputEScore = false
							}
						}
					}
				}
				
				var average:Double{
					get{
						return Double(total)/Double(subjectCount)
					}
				}
			}
			
			//실행 시키려면, View Controller에서
			
			let bYClass:MyClass = MyClass()
			bYClass.kScore = 90
			byClass.eSCore = 80
			print(byClass.average)
			
			```
			
			
	- 이렇게 연산프로퍼티를 만들었다면, 내부적으로 저장공간이 필요하다. 따라서 내부저장프로퍼티를 관리해서 쓰는 방식으로 써야 한다.
	- 내가 `num` 이라는 프로퍼티를 만들면, 기본적으로 num의 getter, setter 그리고 num이라는 변수가 생긴다. 이 때, Objective-C에서는 어떤 숫자를 받으면 바로 저장하는게 아니라, 이 것을 정수와 소수를 구분해서 저장했다. 이러면 정수분 프로퍼티 하나 실수분 프로퍼티 하나 그리고 각각의 getter, setter가 필요하다. 하지만 지금은 연산부분과 저장부분을 구분해서 사용할 수 있게 프로퍼티를 나누었다. 
	- 연산프로퍼티 자신을 바로 사용하면 무한 반복의 늪에 빠지게 된다.
	- setter 값 미 지정시 newValue가 default로 사용된다.
	- getter/setter가 다 있거나, readonly일 경우에는 get을 생략할 수 있다. writeonly일 때는 생략 불가
	
	#### 2) Property Observers
	
	- 프로퍼티의 상태를 관찰하는 아이
	- Stored Property의 값변화를 관찰하고 대응한다.
	- 초기값이 설정되어야만 사용할 수 있다.
		- didSet: 변경된 직후의 값
		- willSet: 변경되기 전의 값
	
		```swift
		var changeValue:Int = 0{		didSet(oldV){ //oldV를 입력하지 않으면 기본값은 oldValue			print("oldValue \(oldV)") //0		}		willSet(willV){ //willV를 입력하지 않으면 기본값은 newValue			print("newValue \(willV)") //4; willSet이 먼저 불려진다.		}	}
			changeValue = 4
		```
	
	> 객체지향에서 Observing Design pattern 이라는 design patter이 있다. (delegate처럼) 이러한 방식을 구현하기 위해 `didSet` `willSet` 이라는 아이를 만든 것

### 3. 타입 프로퍼티

	#### 1) 개념
	- 저장/연산프로퍼티는 인스턴스가 되어야만 사용될 수 있다. 하지만 타입프로퍼티는 인스턴스 속성이 아닌, 타입에 따른 속성을 정의 할 수 있다.
	- 타입은 곧 클래스. 이 아이는 [데이터 영역](https://github.com/fimuxd/iOS_Campus/tree/master/A_LectureSummary/170524/Classes%20and%20Structures)에서 data 영역에 생긴다. (전역변수) 프로그램 내내 한번 불린다. 정적변수영역이 생긴다. 타입프로퍼티는 이 하나의 프로퍼티다. 인스턴스는 인스턴스마다 그의 속성에 따라 stack영역에 새로 계속 생긴다. 타입프로퍼티는 클래스 자체에 존재하는 아이여서 data영역에 하나에만 존재한다.
	
	#### 2) Method
	
	- 특정 타입에 관련된 함수
	- 인스턴스 메서드와 타입자체의 기능을 수행하는 타입 메서드로 나눌 수 있다.

### 4. self Property

- self를 통해 자기 자신을 가르킬 수 있다.




