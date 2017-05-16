# Collection Type & 반복문

- 컬렉션과 반복문을 배울 것임
- 반복문을 이용한 재미있는 예제가 있을 것 :)

## A. Collection Type

### 개념

- 이론을 정확하게 이해하고 숙지한 뒤, 계속 사용해 나가면서 익숙해지는 것이 중요하다.
- 튜플은 여러개의 type의 조합. collection은 이 자체로 type.
-  Array, Set, Dictionary는 class가 아니다. 

### Mutability of Collections

> 다음 주에 자세히


### 1. Array

- 예. String형 Array를 만들거야라고 한다면, Array내의 모든 값은 String 형태가 된다.
- 데이터의 관리는 Index로 한다.
- Index순서는 정해져 잇다

	#### 1) Array 문법
	
	```swift
	// 기본표현: Array Type 나타내기
	Array<Element>
	// Element란? 배열에 저장할 수 있는 타입을 의미
	// 또는 [Element]로 축약할 수 있다. (리터럴 문법)
	
	//예.
	var someInts:[Int] = [Int]()
	//곧 아래와 같은 의미
	var someInts:Array<Int> = Array<Int>()
	```
	
	- 여기서 리터럴 문법을 다시 이해하자면,

	```swift
	var name:String = "BB"
	// 여기서 "BB"가 리터럴 문법이다. 사실은 저 자리에 아래와 같이 들어가는 것인데, 데이터가 필요하니까 "BB"라는 데이터를 바로 넣은 형태
	
	var name:String = String()
	```	

	- 배열 리터럴 문법은 대괄호를 사용하며, index를 통해 배열의 값을 가져올 수 있다.
	- index의 시작은 0 이다

	```swift
	var someInts:[Int] = [1,2,3,4]
	someInts = []
	
	//숫자 1을 불러오려면, 
	print("\(someInts[0])")
	
	//숫자 4를 불러오려면,
	print("\(someInts[3])")
	```
	
	#### 2) 추가 기능
	- swift에서 `command(⌘)` + `shift(⇪)` + `o`
	
	```swift
	// array 생성
        var list:[Int] = [1,2,3,4,5,6,7,8]
        
   //  element value 추가: '10'이라는 element
        list.append(10)
        
   // element '11'을 index 3(4번째 자리)에 삽입
        list.insert(11, at:3)
        
   // index 0의 값을 삭제
        list.remove(at:0)
        
   // list.index(of: Int) 를 이용해서, 배열에 숫자'4'를 지우라는 명령. 여기서 !를 붙이는 이유는, 리스트에 숫자'4'가 없을 수도 있기 때문
        list.remove(at: list.index(of: 4)!)
        
   //빈 배열 확인 및 현재 배열의 elemenet count (boolean)
        if !list.isEmpty {
            print(list)
            print(list.count)
        }
   
   // 현재 배열의 element count
            
   // 배열 붙이기
        let list2:[Int] = [12,13]
        let list3 = list + list + list2
        print(list3)
   ```

	
### 2. Set

- 순서 없는 데이터들이 널려져 있다.
- 그러한 데이터들을 집합의 형태로 쓸 수 있다.

### 3. Dictionary

- key라는 것이 있어서, Array형의 Index처럼 값을 key와 연결할 수 있다.
- 다만, Index 같은 순서를 가지진 않는다.
- 가장 많이 쓰는 형태. key를 통해 이 값이 어떤 것을 의미하는지 이해할 수 있다. 
	- 특히 networking을 할 때 dictionary를 많이 사용한다. 
- 




