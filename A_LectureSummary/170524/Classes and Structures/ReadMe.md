# Classes & Structures

- Objective-C와 달리 Swift에서는 이 둘의 문법적 차이가 없다
- 하지만 엄청난 차이가 있다. 정확히 차이점을 인지해서 적재적소에 사용할 수 있어야 한다.

## A. 개념

- Class와 Structure는 **exactly same syntax**

	```swift
	class ClassName {
	}
	
	struct StructName {
	}
	// 똑같다. 
	```

	- 각자의 property를 가진다.
	- 닷(.) 문법을 통해 접근한다.
	
- internal 접근제한자를 가지므로 서로 다른 코드에서 자동으로 사용 가능
- 프로토콜을 채택해(받아서) 사용할 수 있다.
	- 상속이라 적혀있지만, 채택이 좀 더 의미상 어울린다.
	- class는 상속을 하나밖에 받을 수 없다. 따라서 상속이란 표현을 쓰기 애매하지만, 상속과 같은 개념이라서 채택이라는 표현을 이용했다.
- **중요한 차이**: class는 struct를 타입으로 넣을 수 있으나 struct는 class로 할 수 없다.

## B. Initialization

- class, struct 등을 이용하기 위해 instance 생성/설정 하도록 하는 작업
- 적절한 초기값이 없을 땐 optional을 통해 초기화 해야한다
- *struct만* Memberwise Initializers를 가진다. -> ~몬말?~ 아래를 보면,

```swift
//structer를 만들자.
struct Book {
    var name:String
    var cost:Int
    var isbn:UInt

//분명히 init을 하지 않았다. 하지만 저절로 불러옴    
}

//class를 만들자.
class BookStore {
    var computerBooks:[Book]
    var name:String
    var address:String
    
    //여기는 class. 즉 아래 init을 하지 않으면 오류가 난다. 이 것이 struct엔 있지만 class에는 없는 memberwise initializers 기능(?)
    init(computerBooks:[Book], name:String, address:String) {
        self.computerBooks = computerBooks
        self.name = name
        self.address = address
    }
    
        func addBook(name:String, cost:Int) {
           // 이렇게 저절로 struct의 property들을 가져온다.
            let book:Book = Book(name: "스위프트 마스터", cost: 50000, isbn: UInt(computerBooks.count + 1))
            self.computerBooks.append(book)
        }
}
```

- 그렇다고 struct에 init을 못한다는 것이 아니다. 만약 개발자가 init을 하여 초기값을 주면, 그 것이 우선하기 때문에 memberwise initializer가 되지 않는다.

## C. 둘의 차이점

| 비교 | Class | Struct |
| :---: | :---: | :---: |
| 타입 | 참조타입 | 값타입 |
| 상속 | 상속가능 | 상속불가능 |
| 타입 캐스팅(다운 캐스팅) | 가능 | 불가능 |
| 프로퍼티 instance 수정 | var/let 가능 | var 일때만 가능 |
| Instance 해제 계산 | Reference Couting ||
| Deinitializer | 사용 가능 | 불가능 |

- 여기서 문화컬쳐 하나. 지금까지 알고 있었던 캐스팅은 사실 타입 캐스팅이 아니다. 오히려 instance 초기화에 가깝다. 
	- 예. 
	
	```swift
	let numStr:String = "3"
	Int(numStr) // -> 이게 현재까지 알고 있던 캐스팅 
	
	/* 
	하지만 사실 이건 Int.init(numStr).
	Int()라는 struct의 instance를 
	numStr 이라는 값으로 initializer 해준 것에 가깝다는 의미
	*/
	```
	
- 여기서 첫번째, 타입만 이해하면 나머지는 자동으로 이해할 수 있다고 한다. -> 그래서!

### 1. 값타입과 참조타입

을 배우기 전에 일단,
	
#### 1) Memory의 구조
	
![이미지](https://github.com/fimuxd/iOS_Campus/blob/master/A_LectureSummary/170523/Memory.png?raw=true)
	
#### 2) 각 영역별 사용범위
	
> class와 struct는 구조상 Stack과 Heap에서 차이가 난다.
	
- **Stack**: 지역변수나 매개변수가 저장되는 영역
	- 지역변수: 함수에서 쓰이는 함수, 클래스 안에서 쓰이는 변수(property)
	- 매개변수
	
- **Heap**: Instance. class가 타입으로 선언되었을 때 class의 instance는 Heap영역으로 가게되고, 그 주소값(참조값; reference)은 Stack영역으로 가게 된다. 이 것이 곧 `pointer`의 개념 
	
	![이미지](https://github.com/fimuxd/iOS_Campus/blob/master/A_LectureSummary/170523/Pointer.png?raw=true)
	
- **Data**: static이라는 키워드를 쓰면 인스턴스를 만들지 않아도 바로 프로그램에서 쓸 수 있음. static 키워드를 썼을 때 Data 영역에 저장
	
- **Code**: 입력한 code 그 자체
	
#### 3) 정리
	
- struct는 함수를 쓸 수 없고, 그냥 값(var)들의 집합체다. Stack 영역에 값들이 저장된다.
	- 정말 함수를 써야하면 `mutating` 이라는 명령어를 `func` 앞에 입력하면 쓸 수 있다. 
	
- class는 method를 가지며 Heap영역에 존재하며, 이 값은 Stack에 Pointer의 형태로 저장된다.

### 2. Deinit

- instance가 메모리에서 사라지기 직전에 실행될 내용을 입력

### 3. Reference Counting

> ~상당히 어려운 내용인 듯?~ 

- reference counting은 프로그램 실행과정에서 계속 증감을 반복한다. 그러다가 reference counting이 0이 되면 instance가 사라진다는 개념
- ARC(Auto Reference Counting): 어떨 땐 counting 되고, 어떨 땐 감소하고 어떨 땐 counting을 증가하지 않으면서 참조만 하고. 이런 것들을 자동으로 관리해주는 것
	- 예전 ARC가 없었을 땐 이 RC을 개발자가 일일히 관리해주어야 했다. 최종적으로 RC가 0이 되도록. 그렇지 않으면 앱이 실행되지 않는데도 계속 메모리를 잡아먹다가 fuc이 나는 좀비같은 상황이 벌어진다고 한다.
		- 별도로 수업을 할 것

## D. Class 와 Structure; 용도의 차이

>  그렇다면, 언제 Class와 Struct를 써야하는지?

### 1. Apple Guideline

- 이럴 때 Structure를 쓰세요.
	- **간단한 값의 집합**을 캡슐화하는 것만이 목표일 때
	- 값이 참조보다 **복사** 되는 것이 합당할 떄
	- property가 값타입의 집합이며 **복사** 되는 것이 합당할 때
	- **상속이 불가** 하므로 상속이 필요 없을 때

### 2. 개발자의 판단

- 현업에서 Data 관련은 모두 Struct
	- Data Module 등
- 왜냐하면 속도나 효율면에서 Struct가 우수한 면이 있다. 
	- 사실 값타입이면 모든 값을 복사해야 하므로 원래는 느리다고 한다. 하지만 애플은 그렇게 다 복사하지 않고 컴파일러가 알아서 하기 때문에 값타입이지만 느리지 않다고 얘기한다고 합니당..게다가 인간이 느낄만한 속도 차이가 아니라고 한다...그렇다고 한다........
- 단순한 값의 나열의 경우일 때는 Struct를 쓰는 것이 적절하다.
