# Enumeration

- class와 struct와 같은 레벨에 있는 아이

## A. 개념

```
열거형(enumeration)• 그룹에 대한 연관된 값을 정의하고 사용가능한 타입• 다른 언어와 달리 항목 그자체가 고유의 값으로 해당 항목에 값을 매칭 시킬 필요가 없다.(C계열 언어는 Int타입의 값이 매칭됨• 원시값(rawValue)이라는 형태로 실제 값(정수, 실수, 문자등)을 부여 할수 있다.• 열거형의 이니셜라이즈를 정의 할수 있으며, 프로토콜 준수, 연산프로퍼티, 메소드등을 만들수 있습니다.
```

## B. 문법

```swift
enum CompassPoint {	case north	case south	case east	case west}
enum Planet {	case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune}
// 표현법의 차이
```

- 항목 자체를 값으로 가진다. 
- 항목을 정의하는 아이

	```swift
	var directionToHead = CompassPoint.west
	//여기서 directionToHead의 타입은 CompassPoint 다.
	```

- 대표적인 열거형: Optional, UILabel 정렬(왼,오,가운데)
- switch와 enum은 한 쌍이다.

	```swift
	switch directionToHead {	case .north:		print("Lots of planets have a north")	case .south:		print("Watch out for penguins")	case .east:		print("Where the sun rises")	case .west:		print("Where the skies are blue")}
		//열거형의 모든 case가 제공될때 default값은 제공될 필요가 없다.
	```

## C. Alert Title에 enum을 적용해보자

```swift
enum AlertType{
	case LoginFail
	case Success
	case SignupFail
}

func showAlert(type:AlertType) {
	let aleart = UIAlertController(title: titleMsg(for: type), message: titleMsg(for: type), preferredStyle: . alert)
	let action = UIAlertAction(title: "확인", style: .default, handler: nil)
	alert.addAction(action)
	self.present(alert, animated: true, comletion:nil)
}

func titleMsg(for type:AlertType) -> String {
	var title = ""
	switch type {
	case .LoginFail:
		title = "로그인을 실패 했습니다"
	case .SignupFail:
		title = "회원가입을 실패 했습니다"
	case .Success:
		title = "성공"
	}
	return title
}

//실행할 땐,
showAlert(type:.LoginFail)
```

## D. Associated Values

- class나 struct로 하면, 내부의 변수들을 세트로 instnace화 해주어야 하기 때문에 적절하지 않다.
- struct의 변수를 static 설정 해주면, 하나의 공간에 값을 덮어쓰기 하는 꼴이므로, 같은 타입의 여러가지 객체를 관리하는데 적절하지 않다.

```swift
// 바코드 관리에서

//1. enum 설정
enum Barcode {	case upc(Int, Int, Int, Int)	case qrCode(String)}

//2. Associated Values 값 설정
var productBarcode = Barcode.upc(8, 85909, 51226, 3)productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

//3. 값 불러오기
switch productBarcode {	case .upc(let numberSystem, let manufacturer, let product, let check):		print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).”)	case .qrCode(let productCode):		print("QR code: \(productCode).")}

//4. 패턴 매칭
let productBarcode = Barcode.upc(8, 85909, 51226, 3)if case let Barcode.upc(8, companyCode, productCode, 3) = productBarcode{	//정상 바코드	print(companyCode)	print(productCode)}
```

## E. Raw Values

```swift
enum Planet: Int{	case mercury=1, venus, earth, mars, jupiter, saturn, uranus, neptune}

let possiblePlanet:Planet? = Planet(rawValue: 1) //Planet에 ?가 붙는 이유는, raw value 값이 없을 수도 있기 때문이다. 
let possiblePlanet:Planet = Planet.mercury
//이 두개는 같은 의미이다.

```

- mercury에 1을 넣었기 때문에 그 뒤의 case 명은 자동으로 2,3,4 등이 부여된다.
- mars에 아무것도 적지 않으면 3이 부여되겠지만, 여기에 100을 넣으면 100 그리고 jupiter는 101이 될 것이다.
- 모든 case명에 아무값도 적지 않으면 0부터 시작한다.

## F. Recursive Enumerations

- enum 안에서 가지는 case가 자기 자신을 가지려고 할 때, case 앞에 `indirect` 를 붙여주어야 한다.

> **Summary**
> 
> 중요도를 생각해볼 때,
> 
> 1. enum의 형태
> 2. 타입 자체로 쓰는 것
> 3. Raw Value를 넣는 것
> 4. Associated Value를 넣는 것
> 5. enum에 함수나 연산 프로퍼티를 넣는 것이 가능
> 6. Recursive Enumerations
