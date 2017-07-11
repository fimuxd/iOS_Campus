# Extension

## Subscript

### 1. 개념

***

• 클래스, 구조체, 열거형의 collection, list, sequence의 멤버에 접근 가능한 단축문법인 Subscript를 정의 할수 있다.
• Subscript는 별도의 setter/getter없이 index를 통해서 데이터를 설정하거나 값을 가져오는 기능을 할 수 있다.
• `Array[index]` / `Dictionary[“Key”]` 등의 표현이 Subscript이다.

***

### 2. 문법

```swift
subscript(index: Type) -> Type {	get {		// return an appropriate subscript value here	}	set(newValue) {
		// 연산프로퍼티와 문법이 같아서, set의 default parameter는 'newValue' 다.		// perform a suitable setting action here	}}

subscript(index: Type) -> Type {// return an appropriate subscript value here}
```

### 3. 예제

```swift
class Friends {	private var friendNames:[String] = []	subscript(index:Int) -> String	{  		get	 {			return friendNames[index]		}			set {			friendNames[index] = newValue		}	}}
let fList = Friends()fList[0] = "joo"
```

```swift
struct TimesTable {	let multiplier: Int	subscript(index: Int) -> Int {		return multiplier * index	}}let threeTimesTable = TimesTable(multiplier: 3)print("six times three is \(threeTimesTable[6])")
```

```swift
struct Matrix {	let rows: Int, columns: Int	var grid: [Double]	init(rows: Int, columns: Int) {		self.rows = rows		self.columns = columns		grid = Array(repeating: 0.0, count: rows * columns)	}	subscript(row: Int, column: Int) -> Double {		get {			return grid[(row * columns) + column]		}		set {			grid[(row * columns) + column] = newValue		}	}}
var metrix = Matrix(rows: 2, columns: 2)metrix[0,0] = 1metrix[0,1] = 2.5
```

## Extension

### 1. 개념

***

• Extensions 기능은 기존 클래스, 구조, 열거 형 또는 프로토콜 유형에 로운 기능을 추가합니다• Extensions으로 할수 있는것은…1. Add computed instance properties and computed type properties2. Define instance methods and type methods3. Provide new initializers4. Define subscripts5. Define and use new nested types6. Make an existing type conform to a protocol

***

### 2. 문법

```swift
extension SomeType {	// new functionality to add to SomeType goes here}
extension SomeType: SomeProtocol, AnotherProtocol {	// implementation of protocol requirements goes here}
```

### 3. 예제

#### A. Compute Properties

```swift
extension Double {	var km: Double { return self * 1_000.0 }	var m: Double { return self }	var cm: Double { return self / 100.0 }	var mm: Double { return self / 1_000.0 }	var ft: Double { return self / 3.28084 }}
let oneInch = 25.4.mmprint("One inch is \(oneInch) meters")// Prints "One inch is 0.0254 meters"let threeFeet = 3.ftprint("Three feet is \(threeFeet) meters")// Prints "Three feet is 0.914399970739201 meters"
```

#### B. init

```swift
extension Rect {	init(center: Point, size: Size) {		let originX = center.x - (size.width / 2)		let originY = center.y - (size.height / 2)		self.init(origin: Point(x: originX, y: originY), size:size)	}}
```

#### C. method

```swift
extension Int {	func repetitions(task: () -> Void) {		for _ in 0..<self {			task()		}	}}
3.repetitions {	print("Hello!")}. // Hello!. // Hello!. // Hello!
```	

#### d. mutating method

```swift
extension Int {	mutating func square() {		self = self * self	} //struct 속의 property가 바뀌는 경우 mutating func}
var someInt = 3someInt.square()
```

#### e. Subscript

```swift
extension Int {	subscript(digitIndex: Int) -> Int {		var decimalBase = 1		for _ in 0..<digitIndex {			decimalBase *= 10		}		return (self / decimalBase) % 10	}}
746381295[0] // returns 5746381295[1] // returns 9746381295[2] // returns 2746381295[8] // returns 7
```

#### f. Nested Types

```swift
extension Int {	enum Kind {	case negative, zero, positive	}	var kind: Kind {		switch self {		case 0:			return .zero		case let x where x > 0:			return .positive		default:			return .negative		}	}}
```

## Generic

### 1. 개념

• 어떤 타입에도 유연한 코드를 구현하기 위해 사용되는 기능
• 코드의 중복을 줄이고, 깔끔하고 추상적인 표현이 가능하다.

```swift
func swapTwoInts(_ a: inout Int, _ b: inout Int) {let temporaryA = aa = bb = temporaryA}
```
두 Int를 받아 서로 바꿔주는 스왑함수가 있다.우리는 Int 외에도 Double, String 등 다양한 타입의 데이터를 스왑하고 싶다면 어떻게 해야될까?

> Any와는 다른 점: Any라는 타입을 지정하면 추후에 특정 타입으로 재지정해주어야 한다.

### 2. Generic을 사용한 swap 함수

```swift
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {	let temporaryA = a	a = b	b = temporaryA}var someInt = 3var anotherInt = 107swapTwoValues(&someInt, &anotherInt)// someInt is now 107, and anotherInt is now 3var someString = "hello"var anotherString = "world"swapTwoValues(&someString, &anotherString)// someString is now "world", and anotherString is now "hello"
```

### 3. Type Parameters

• 제네릭에 사용된 “T”는 타입의 이름으로 사용되었다기 보다는placeholder 역할로 사용되었다.
• 타입은 꺾쇠<> 로 감싸 표시한다.• 타입의 이름은 보통 사용되는 속성에 맞게 네이밍 할수 있으나아무런 연관이 없는 타입의 경우에는 T,U,V 같은 알파벳으로 사용된다.

### 4. 연습: Stack

- Stack에는 push/pull 이 있다.

```swift
struct IntStack {
    var items = [Int]()
    
    mutating func push(_ item:Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

// 이 것을 Generic 으로 바꿔보자
struct GenericStack<T> {
    var items = [T]()
    
    mutating func push(_ item:T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}

/* 테스트 해보자 */
var array = ["1","2"]

var test = GenericStack(items: array) //array가 String을 갖는다는 것을 자동으로 인식하게 된다.

test.push("3") //String만 입력할 수 있다. 
print(test.items) //["1", "2", "3"]

test.pop()
print(test.items) //["1", "2"]
```