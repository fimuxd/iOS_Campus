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
- Index순서는 정해져 있다.

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
	/* 여기서 "BB"가 리터럴 문법이다. 사실은 저 자리에 아래와 같이 들어가는 것인데, 
	데이터가 필요하니까 "BB"라는 데이터를 바로 넣은 형태
	*/
	
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
        
   /* list.index(of: Int) 를 이용해서, 배열에 숫자'4'를 지우라는 명령. 
   여기서 !를 붙이는 이유는, 리스트에 숫자'4'가 없을 수도 있기 때문
   */
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
	
	>  혼자 해보는 Array 연습
	
	> ```swift
   >     var mammals:[String] = ["🐶", "🐯", "🐷", "🐰", "🐵"]
   >     print(mammals) //print ["🐶", "🐯", "🐷", "🐰", "🐵"]
   >     
   >     print(mammals.contains("🐶")) // print값: true
   >     mammals.append("🐸")
   >     print(mammals) //print ["🐶", "🐯", "🐷", "🐰", "🐵", "🐸"]
   >     
   >     mammals.remove(at: 2)
   >     print(mammals) // print ["🐶", "🐯", "🐰", "🐵", "🐸"]
   >     
   >     print(mammals.count) // print 5
   >     
   >     if !mammals.isEmpty {
   >         print("이 Array의 Element 수는 \(mammals.count)개 입니다.")
   >     }
   >     else{
   >         print("이 Array는 비어있습니다")
   >     }
	> ``` 
	
### 2. Set

#### 1) Set 문법

- 순서 없는 데이터들이 널려져 있다.
- 그러한 데이터들을 집합의 형태로 쓸 수 있다.
- swift는 타입 추론을 하므로, set이라 명시하지 않으면 array로 인식하기 때문에 반드시 set이라 명기해주어야 한다.
- 순서가 없으므로 *for-in* 구문을 통해서 데이터를 가져와야 한다.
- 중복을 허용하지 않는다. (Array는 허용함)
- set을 쓰는 이유
	- 순서가 중요치 않거나 한번만 표시해야 하는 경우
	- 집합의 성질을 띄고 있으므로, 집합 단위의 연산이 필요한 경우 set을 쓸 수 있다.

	```swift
	var someInts:set<Int> = [1,2,3,4]
	someInts = []

	//아래와 같이 set이라 명기해주어야 타입추론(array) 방지할 수 있다.
	var someStrings:Set = ["joo","young"]
	```

#### 2) 추가 기능
- 집합의 개념들을 이해할 것
	
	```swift
	 // 홀수의 모임
        var oddDigits:Set = [1,3,5,7,9]
        
    // 짝수의 모임
        let evenDigits:Set = [2,4,6,8]
        
    // 소수의 모임
        let primeDigits:Set = [2,3,5,7]
        
    //홀수와 짝수의 교집합(Intersection) 만들기
        print(oddDigits.intersection(evenDigits))
        
	//홀수와 소수의 교집합을 제외한 수(symmetricDifference)
        print(oddDigits.symmetricDifference(primeDigits))
        
    //홀수와 짝수의 합집합(union)
        print(oddDigits.union(evenDigits).sorted())
        
    //홀수이면서 소수가 아닌 집합(subtracting) > 단 리턴값이 없어서 아무것도 출력되지 않음
        oddDigits.subtract(primeDigits)
        
    //여기까지 적용하고 oddDigits를 확인하면 [9,1] set가 나온다
        print(oddDigits)
        
    //이것을 sorted() 하면, Array의 형태로 정렬해서 [1,9] 출력된다
        print(oddDigits.sorted())
	```
 
	> 혼자 해보는 복습
	>
	> ```swift
	> var haveWings:Set = ["bird", "butterfly", "bet"]
	> var mammal:Set = ["bet", "tiger", "pig"]
	> var bugs:Set = ["butterfly", "ant", "spider"]
	> 
	> print(haveWings.intersection(mammal))
	> 
	> // 순서 없이 나열      
	> print(mammal.union(bugs))
	> 
	> // sorted()를 이용해서 abc순으로 정렬      
	> print(mammal.union(bugs).sorted()) 
	> 
	> // 순서 없이 나열      
	> print(bugs.symmetricDifference(haveWings))
	>
	> // sorted()를 이용해서 abc순으로 정렬
	> print(bugs.symmetricDifference(haveWings).sorted())
	> 
	> // subtract는 리턴 값이 없음      
	> print(bugs.subtract(mammal)) 
	> ```     

### 3. Dictionary

#### 1) Dictionary 문법

- key라는 것이 있어서, Array형의 Index처럼 값을 key와 연결할 수 있다.
- 다만, Index 같은 순서를 가지진 않는다.
- 가장 많이 쓰는 형태. key를 통해 이 값이 어떤 것을 의미하는지 이해할 수 있다. 
	- 특히 networking을 할 때 dictionary를 많이 사용한다. 
- key와 value는 1:1 매칭 된다.
- key는 중복될 수 없다.
- 축약문법: `[key:value]`
- 리터널 분법: `[:]`
	
	```swift
	//기본형태
	var someInts:[String:Int] = [String:Int]()
	var someInts:Dictionary<String,Int> = [:]

	//dictionary의 리터널 문법의 예
	var airports:[String:String] = ["ICH': "인천공항", "CJU": "제주공항"]
	```
	
- Array가 index를 통해 값을 가져오듯, Dictionary는 key값을 통해 값을 가져온다.

	```swift
	//상기 Dicationary 문법에서, "인천공항"을 가져오려면, 
	print("\(airports["ICH"])")
	```

#### 2) 추가 기능

- swift에서 `command(⌘)` + `shift(⇪)` + `o`
	
	```swift
	// Dictionary 만들기
        var iOSStudent:Dictionary<String,String> = ["박보영":"남성", "박종훈":"남성"]
    // 불러오기
        print("\(iOSStudent["박보영"])")
        
    // 몇 개의 elements를 가지고 있는지
        print(iOSStudent.count)
        
    // 새로운 elements 추가
        iOSStudent["조선미"] = "여성"
        
    // 기존 elements의 값 추가
        iOSStudent["박보영"] = "여성"
        print(iOSStudent)
        
    // 기존의 key:value 쌍을 dictionary에서 삭제
        iOSStudent.removeValue(forKey: "박종훈")
        print(iOSStudent)
   ```

	> 혼자 해보는 복습
	
	> ```swift
	> var worldMap:Dictionary<String,String> = ["Korea":"Asia", "USA":"America", "Spain":"Europe"]
	> 	// 같은 의미, var worldmap:[String:String] = ["Korea":"Asia", "USA":"America", "Spain":"Europe"]
	>        
	> print(worldMap.count) // print값: 3
	>        
	> worldMap["Korea"] = "EastAsia"
	> print(worldMap) 
	> // print값: ["Korea":"EastAsia", "USA":"America", "Spain":"Europe"]
	>        
	> print(worldMap["USA"])
	> // print값: "America"
	>        
	> worldMap["Egypt"] = "Africa"
	> print(worldMap)
	> // print값: ["Korea":"Asia", "Egypt":"Africa", "Spain":"Europe", "USA":"America"]       
	> ```
	
## B. 반복문

### 개념

- 반복해야 할 코드가 있으면, 반복하도록 설정하는 것
- `while` `for-in` `repeatWhile`이 있다.
	- `while`은 시작점부터 `repeatWhile` 은 특정점부터 반복하게 하는 것인데 우리는 `while`만

### 종류

#### 1. While 문

- 조건이 참일 경우 반복 실행
- 횟수에 상관없이 내가 원하는 결과를 얻을 때까지 쓰는 것

```swift
//기본 형태
while 조건
{
//구문 실행
}

//10번 반복하는 while문 예제
var index = 0

while index < 10
{
print("현재 횟수는 \(index)입니다.")
index += 1
}

//여기서 index += 1 라는 조건을 넣지 않으면 무한 loop의 늪에 빠진다...
```

- 구구단 만들어보기

	```swift
	func multipicationTable(level:Int) {
        
            // 2. 곱(step)을 의미하는 변수 설정
            var step:Int = 1
            
            // 3. 곱이 1...9 반복할 while문 설정
            while step <= 9 {
                print("\(level) * \(step) = \(level*step)")
            
                // 4. 무한 loop 되지 않도록 반복할 때마다 곱이 증가하도록 설정
                step += 1
            }
        }
        
    multipicationTable(level: 26)
        /* print값:
             26 * 1 = 26
             26 * 2 = 52
             26 * 3 = 78
             26 * 4 = 104
             26 * 5 = 130
             26 * 6 = 156
             26 * 7 = 182
             26 * 8 = 208
             26 * 9 = 234
        */
	```

#### 2. for-in 문

- 우리가 배운 collection;Array, Set, Dictionary 에 대해서 값을 가져오는 역할을 한다.
- 가져온 collection 내의 값을 다 소진할 때까지 반복하고, 소진한 후에는 끝난다.
- 별도의 변수 선언이 필요없다. collection에서 이미 타입선정이나 선언이 끝났으므로
- for-in 문에서 일정 범위를 설정하고 싶으면 범위연산자를 이용하면 된다. (예. `1...5` 는 곧 `[1,2,3,4,5]`)
- 또는 숫자의 범위에 상관없이, 횟수만 설정하고 싶으면 index 부분에 와일드카드(_)를 사용한다.

- 그럼 다시 한번 for-in문 이용하여 구구단 만들어보기

	```swift
	func forInMultipicationTable(level:Int) {
	            
	            // 2. for-in의 경우, 별도의 변수타입 설정을 해주지 않아도 되므로 
	            //    step을 그대로 사용함
	            for step in 1...9 {
	                print("\(level) * \(step) = \(level*step)")
	            }
	        }
	        
	forInMultipicationTable(level: 19)
	        /* print값:
	             19 * 1 = 19
	             19 * 2 = 38
	             19 * 3 = 57
	             19 * 4 = 76
	             19 * 5 = 95
	             19 * 6 = 114
	             19 * 7 = 133
	             19 * 8 = 152
	             19 * 9 = 171
	         */
	```

### 연습예제

#### 1. 로또 숫자 출력하기 (elements 값 중복 허용)

	```swift
	func tellMeLotto() -> [Int] {
	            
	            // 2. 로또번호 6개의 Array 값 명명
	            var lottoNumber:[Int] = [] // or = [Int]()
	            
	            // 3. arc4random을 이용. unifrom(n) = 0 ~ n-1 사이의 값 랜덤으로 출력
	            let randomNumber:UInt32 = arc4random_uniform(46)
	            
	            // 4. 6번 반복하는 for-in 문 생성
	            for _ in 1...6 {
	                
	                // 5. arc4random이 0을 포함하는데 로또번호에는 0이 없으므로, 0을 제외하고 array에 넣어주는 if 문 생성
	                if randomNumber != 0 {
	                    lottoNumber.append(Int(randomNumber))
	                }
	            }
	            return lottoNumber
	        }
	        
	        tellMeLotto()
	```

#### 2. 로또 숫자 출력하기 (elements 값 중복 불가)

	```swift
	func tellMeLotto1() -> [Int] {
	            var lottoNumber:[Int] = []
	            
	            while lottoNumber.count < 6 {
	                let randomNumber:UInt32 = arc4random_uniform(46)
	
	                if randomNumber != 0 && !lottoNumber.contains(Int(randomNumber)) {
	                    lottoNumber.append(Int(randomNumber))
	                }
	            }
	            return lottoNumber
	        }
	        
	        // 로또 넘버가 123 순서로 출력된다.
	        print(tellMeLotto1().sorted)
	```


