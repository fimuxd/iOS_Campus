## 수업 전 조교님 Tip

### 1. Xcode 이해
- AppDelegate: 첫번째 관문
- Main.storyboard: viewDidLoad: 두번째 관문
	- func viewDidLoad 안에 함수를 만들고 이 viewDidLoad 바깥에 함수를 실행시키면 작동이 안된다.
	- class와 viewDidLoad 사이에 변수들을 설정해놓는 것은 괜찮다. 

### 2. 숫자/버튼/결과 앱 만들기

- 숫자(Label), 버튼(Button), 결과 (Label)을 생성한다
- 해당 UI들을 코드에다 연결하는데 이 값들은 변수이므로 viewDidLoad 바깥, Class의 안쪽에 위차하도록 연결한다.

> [실습한 proj Xcode 파일 바로가기](https://github.com/fimuxd/iOS_Campus/blob/master/A_LectureSummary/170517/PracticeSwift/PracticeSwift/ViewController.swift)

# Optional

## A. nil

### 1. 개념

- 옵셔널을 이해하려면 `nil`을 정확히 이해해야 한다
- `nil`: 변수에 아무런 값이 없는 상태
	- cf) `""`와는 다르다. 이건 공백이라는 값을 가지는 것. 
	
	```swift
	//nil
	var name:String
	
	//공백
	var name:String = ""
	```

### 2. Type Safety

- Swift는 컴파일러 수준에서 nil 체크를 한다.
- 즉, nil 인 상태인 변수를 참조하거나, nil 인 상태의 함수를 실행하면 error를 발생시킨다.
- 그런데 어떡하지? 나는 어쨌든 지금은 값을 설정 못하고 나중에 값을 선언할건데! 지금 nil로 변수 선언 외않되?! => 그래서 만들어진 개념이 optional

	```swift
	var name:String
		//값이 nil이므로 error 발생
	
	var name:String?
		//nil인데 나중에 값 넣을걸?: nil일수도 아닐수도. 가능성의 의미
	
	var name:String!
		//nil인데 나중에 값 넣을거야! 무조건 여긴 값이 있다! 의미
	```

- 모든 타입은 옵셔널이냐 아니냐로 결정된다. 옵셔널로 한번 설정하면 그 타입은 일반 타입과 다르게 인식한다.

	```swift
	var name:String = "BB"
	//여기서 "BB"의 타입은 String
	
	var name:String!
	name = "BB"
	//여기서 optional("BB")의 타입은 optional(String)
	//타입 자체를 다르게 인식한다. 그래서 나중에 바꿔줘야 함
	```

- 옵셔널 타입은 실행하기전에 한번 수정해 줘야한다 일반타입으로 변형시켜줘야 한다.
	- 번거롭다! 왜 이렇게 번거롭게? 목적이 뭐지? => safety
	- 개발자 입장: 매우 번거롭지만, 프로그램 입장: 절대 error 안나!

	```swift
	var otName:String?
        var name:String = "BB"
        
        func printTest()
        {
            otName = "BB"
            print(otName)
                //optional을 일반 타입으로 선언해주지 않았으므로 
                //print값: Optional("BB")
            
            print(otName!)
                //Optional 타입을 nil이 아니라고 추가 선언하면 일반타입으로 전환
                //print값: BB
            
            print(name)
                //원래 일반 타입이므로 문제 없음
                //print값: BB
         }
    
    //만약, 상단의 otName 변수에서 시작부터 !로 명명했다면,
    var otName:String!
    
	    func printTest()
	    {
	    		otName = "PARK"
	    		print(otName)
	    			//!로 명명했으므로 별도로 !로 선언해주지 않아도 된다
	    			//print값: PARK    
        }
	```

> 옵셔널의 목적: nil로써 발생하는 error를 프로그램 차원의 안정성 유지 차원에서 개발자에게 책임 전가 ㅋ

### 3. Unwrapping

#### 1) Forced Unwrapping

- 상기에서 언급한대로 ?로 표기한 옵셔널을 추후에 !로 nil이 아니라 일일히 재명명하는 것
	- 매우 번거롭
- 매번 nil 검사를 한 후 nil이 아니면 통과하도록 한 뒤 또 !라 명명해주는 것

	```swift
	func checkFuc(inputStr:String?) {
		
		if inputStr != nil {
			//의미: 만약 개발자가 String type이라 확신(!)한 inputStr이 nil이 아니라면,
			 
		let unwrapStr:String = inputStr!
			//의미: inputStr을 무조건(!) String Type의 unwrapStr 상수에 넣어라
		}
	}
	```

#### 2) Optional Unwrapping

- nil인지 확인한 후에도 또 !를 붙여야 하는 forced unwrapping의 번거로움을 조금이라도 줄이기 위해 만들어진 방법
- 한번 nil검사를 해서 nil이면 함수 자체에서 건너뛰어버리고, nil이 아니라면 자동적으로 unwrapping된 상태로 튀어 나오는 것
	- 단 if 문 내부에서만 써야 함 (guard문과 차이)
- Swift에서는 forced보다는 optional을 많이 쓰고 선호함

	```swift
	//상기와 같은 checkFuc 함수를 optional unwrapping 해보자
	func checkFuc(inputStr:String?) {
		
		if let unwrapStr:String = inputStr {
			//의미: inputStr이 String type의 unwrapStr 이라면,
			
			print(unwrapStr)
				//if문이 조건을 만족하지 않으면 자동적으로 함수가 실행되지 않는 특성 이용
		}
	}	
	```

#### 3) Ealrt Exit
- nil이 들어오면 아예 함수 자체를 돌리지 말고 차단(guard) 하자는 의미
- Guard 문: if문의 반대 (false면 실행, true면 건너 뜀) 
	- guard 문의 조건에 거짓이면 실행, 참이면 그냥 else 없이 건너뜀
	- optional unwrapping과 같은데, 가드만 통과하면 그 후 함수 내부 전체를 쓸 수 있다는 것 (말그대로 방어막 같은 느낌)
	- 전체적으로 code를 보기에 간결하다는 이점이 있다.

	```swift
	//상기와 같은 checkFuc 함수를 Early Exit(Guard문) 해보자
	func checkFuc(inputStr:String?) {
	
		guard let unwrapStr:String = inputStr {
		return
		}
			//inputStr이 String type의 unwrapStr이 아니라면 (거짓이라면), 함수 전체 return
	
		print(unwrapStr)
	}
	```

	
## B. 실습 : 친구리스트 만들기

> [실습한 친구리스트 proj Xcode 바로가기](https://github.com/fimuxd/iOS_Campus/blob/master/A_LectureSummary/170517/Optional/OptionalPractice/OptionalPractice/ViewController.swift)



