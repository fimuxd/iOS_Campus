# JSON

## A. 간략한 설명

### 1. 개요

- name(swift에서는 key)/value 형태
- 용도는 데이터 전달
- 서로 다른 언어상에서도 데이터 주고받기 가능하게 하는 폼
- 결국 데이터는 다 string이다.
- iOS에서는 dictionary 형태로 받을 수 있다.

### 2. 문법

- 딕셔너리는 {"name":value}로 표시된다.
- 어레이는 []로 표시된다.

> **차이점** : 딕셔너리는 타입자체가 딕셔너리 자체. JSON은 딕셔너리에 있는 것들은 String으로 쭉 나열해서 적은 폼

## B. 자습; 추가적으로 이해해보기

### 1. 개념

***

**위키피디아**

 JSON(제이슨[1], JavaScript Object Notation)은 **속성-값 쌍으로 이루어진 데이터 오브젝트**를 전달하기 위해 인간이 읽을 수 있는 텍스트를 사용하는 개방형 표준 포맷이다. 
 
 비동기 브라우저/서버 통신 (AJAX)을 위해, 넓게는 XML(AJAX가 사용)을 대체하는 주요 데이터 포맷이다. 특히, **인터넷에서 자료를 주고 받을 때 그 자료를 표현하는 방법**으로 알려져 있다. 자료의 종류에 큰 제한은 없으며, 특히 컴퓨터 프로그램의 변수값을 표현하는 데 적합하다. 
 
 본래는 자바스크립트 언어로부터 파생되어 자바스크립트의 구문 형식을 따르지만 **언어 독립형 데이터 포맷**이다. 즉, 프로그래밍 언어나 플랫폼에 독립적이므로, 구문 분석 및 JSON 데이터 생성을 위한 코드는 C, C++, C#, 자바, 자바스크립트, 펄, 파이썬 등 수많은 프로그래밍 언어에서 쉽게 이용할 수 있다. JSON 포맷은 본래 더글라스 크록포드가 규정하였다. RFC 7159와 ECMA-404라는 두 개의 경쟁 표준에 의해 기술되고 있다. ECMA 표준은 문법만 정의할 정도로 최소한으로만 정의되어 있는 반면 RFC는 시맨틱, 보안적 고려 사항을 일부 제공하기도 한다. [2] JSON의 공식 인터넷 미디어 타입은 **application/json**이며, JSON의 파일 확장자는 **.json**이다.

***

- Swift의 Dictionary 형태와 유사하다.
- Swift에서는 `JSONSerialization` Class를 통해 JSON을 `Dictionary`, `Array`, `String`, `Number`, `Bool` 로 변환할 수 있다.

### 2. Swift with JSON

> 해당 내용은 Apple의 Developer 페이지를 참조하였음. [원문은 여기](https://developer.apple.com/swift/blog/?id=37)

#### 1) JSON 파일로부터 값 추출하기
- `JSONSerialization` 클래스에는 `Any` 를 리턴값으로 갖는  `jsonObject(with:options:)` 메소드가 있다.

	```swift
	import Foundation
	
	let data: Data //예를 들어 네트워크를 통해 Data를 받는다고 가정
	let json = try? JSONSerialization.jsonObject(with: data, options: [])
	```

- 유효한 JSON가 하나의 값만 가지더라도, 일반적으로 웹 어플리케이션은 최상위 객체를 객체 또는` Array` 형태로 인코딩한다. 
- `if` 나 `guard`문을 통한 옵셔널 바인딩이나 `as?` 같은 타입 캐스팅 연산자를 사용해서, 알고 있는 유형의 값을 상수로 추출할 수 있다.
- JSON 객체 유형에서 Dictionary 값을 가져오려면 `[String:Any]` 로 조건부 형변환을 한다. 
- JSON 객체 유형에서 Array 타입을 가져오려면, `[Any]` 로 조건부 형변환을 할 수 있지만, 일반적으로 Any보다는 `[String]` 같이 특정 element의 타입을 적는다.
- 이렇게 하면, 옵셔널 바인딩 또는 enum의 패턴 매칭 등을 이용해 얻은 Dictionary의 key나 Array의 index값을 이용해서 값을 추출할 수 있다. 

	```swift
	// Example JSON with object root:
	/*
		{
			"someKey": 42.0,
			"anotherKey": {
				"someNestedKey": true
			}
		}
	*/
	if let dictionary = jsonWithObjectRoot as? [String: Any] {
		if let number = dictionary["someKey"] as? Double {
			// access individual value in dictionary
		}
	
		for (key, value) in dictionary {
			// access all key / value pairs in dictionary
		}
	
		if let nestedDictionary = dictionary["anotherKey"] as? [String: Any] {
			// access nested dictionary values by key
		}
	}
	
	// Example JSON with array root:
	/*
		[
			"hello", 3, true
		]
	*/
	if let array = jsonWithArrayRoot as? [Any] {
		if let firstObject = array.first {
			// access individual object in array
		}
	
		for object in array {
			// access all objects in array
		}
	
		for case let string as String in array {
			// access only string values in array
		}
	}
	```

- Swift는 별도의 외부 라이브러리나 프레임 워크 없이도, 내장 언어 기능과 Foundation API을 이용해 디코딩된 JSON 데이터를 안전하게 추출하여 작업할 수 있다.

#### 2) JSON에서 추출한 값으로 모델 객체 만들기

- 대부분의 Swift앱은 MVC 디자인 패턴을 따르므로, 모델 정의에서 JSON 데이터를 앱의 도메인과 관련된 객체로 변환하기 유용하다.
- 예를 들어, 지역 레스토랑의 검색 결과를 제공하는 앱을 작성하는 경우, JSON 객체를 허용하는 초기화 도구와 서버/검색 endpoint에 HTTP 요청을 한 다음 비동기적으로 배열을 반환하는 형식 메소드를 구현하는 레스토랑 모델을 구현할 수 있다. 

	```swift
	import Foundation
	
	struct Restaurant {
		enum Meal: String {
			case breakfast, lunch, dinner
		}
	
		let name: String
		let location: (latitude: Double, longitude: Double)
		let meals: Set<Meal>
	}
	```

	- 여기서 `Restaurant` 는 `String` 타입의  `name` 과 좌표 쌍으로 표시된 `location` 그리고 중첩형 enum으로 정의된  `Meal` 을 `Set` 으로 가지는 `meals` 를 가지고 있다. 다음은 서버응답에서 단일 레스토랑을 나타내는 방법의 예시다.

	```swift
	{
		"name": "Caffè Macs",
		"coordinates": {
			"lat": 37.330576,
			"lng": -122.029739
		},
		"meals": ["breakfast", "lunch", "dinner"]
	}
	```

#### 3) Optional JSON 초기화 프로그램 작성하기

- 상기에 JSON 타입으로 전달된 데이터를 `Restaurant` 객체로 변환하려면, JSON 데이터를 추출하여 Any argument를 취하는 initializer를 작성해야 한다.

	```swift
	extension Restaurant {
		init?(json: [String: Any]) {
			guard let name = json["name"] as? String,
				let coordinatesJSON = json["coordinates"] as? [String: Double],
				let latitude = coordinatesJSON["lat"],
				let longitude = coordinatesJSON["lng"],
				let mealsJSON = json["meals"] as? [String]
			else {
				return nil
			}
	
			var meals: Set<Meal> = []
			for string in mealsJSON {
				guard let meal = Meal(rawValue: string) else {
					return nil
				}
	
				meals.insert(meal)
			}
	
			self.name = name
			self.coordinates = (latitude, longitude)
			self.meals = meals
		}
	}
	```

- 만약, 개발자의 앱이 하나 또는 그 이상의 웹서버와 통신하고 이들이 일관되게 단일화된 표현을 반환하지 않는 경우를 대비하여, 가능한 각각의 표현을 처리하기 위한 몇 개의 초기화 프로그램을 구현해야 한다.
- 위의 예제에서, JSON 은  옵셔널 바인딩, `as?` 형태의 타입 캐스팅을 이용해 상수로 추출된다. `name` 속성의 경우 추출된 값은 있는 그대로 할당된다. 좌표의 경우 추출된 위도와 경도 값이 하나의 튜플로 결합된다. `meal` 속성의 경우 추출된 문자열 값을 반복하여 `Set of Meal` enum을 만든다.

#### 4) 에러 처리로 JSON 초기화 프로그램 작성하기

- 앞의 예제에서는 deserialization이 실패할 경우 `nil`을 반환하는 옵셔널 initializer를 구현한 것이다.
- 또 다른 방법으로는 `Error` 프로토콜을 준수하는 유형을 정의하고, 초기화가 실패 할 때마다 해당 유형의 오류를 발생시키는 initializer를 구현할 수 있다.

	```swift
	enum SerializationError: Error {
		case missing(String)
		case invalid(String, Any)
	}
	
	extension Restaurant {
		init(json: [String: Any]) throws {
			// Extract name
			guard let name = json["name"] as? String else {
				throw SerializationError.missing("name")
			}
	
			// Extract and validate coordinates
			guard let coordinatesJSON = json["coordinates"] as? [String: Double],
				let latitude = coordinatesJSON["lat"],
				let longitude = coordinatesJSON["lng"]
			else {
				throw SerializationError.missing("coordinates")
			}
	
			let coordinates = (latitude, longitude)
			guard case (-90...90, -180...180) = coordinates else {
				throw SerializationError.invalid("coordinates", coordinates)
			}
	
			// Extract and validate meals
			guard let mealsJSON = json["meals"] as? [String] else {
				throw SerializationError.missing("meals")
			}
	
			var meals: Set<Meal> = []
			for string in mealsJSON {
				guard let meal = Meal(rawValue: string) else {
					throw SerializationError.invalid("meals", string)
				}
	
				meals.insert(meal)
			}
	
			// Initialize properties
			self.name = name
			self.coordinates = coordinates
			self.meals = meals
		}
	}
	```
	
- 여기서 `Restaurant` 유형은 중첩된 `SerializationError` 유형을 선언한다. 이 유형은 누락되었거나 유효하지 않은 특성과 연관된 값과 함께 enum case를 정의한다.
- JSON initializer 프로그램을 throw하는 경우, `nil`을 반환하는 것이 아니라, 특정 실패를 알리는 Error가 발생한다.
- 또한 좌표가 유효한 지리적 좌표를 나타내는지, JSON에 지정된 `meal`의 각 이름이 `Meal`의 enum case에 해당하는지 확인하기 위해 입력 데이터의 유효성 검사를 수행하게 된다.

#### 5) 결과 도출을 위한 타입 메서드 작성

- 웹 어플리케이션 endpoint는 종종 단일 JSON 응답으로 여러개의 리소스를 반환한다.
- 예를 들어, `/search` endpoint는 요청된 `query` 매개변수와 일치하는 0개 이상의 레스토랑을 반환하고, 다른 메타 데이터와 함께 표현될 수 있다.

	```swift
	{
		"query": "sandwich",
		"results_count": 12,
		"page": 1,
		"results": [
			{
				"name": "Caffè Macs",
				"coordinates": {
					"lat": 37.330576,
					"lng": -122.029739
				},
				"meals": ["breakfast", "lunch", "dinner"]
			},
			...
		]
	}
	```
	
- `query` 메서드 매개 변수를 해당 요청 개체로 변환하고, 웹 서비스에 HTTP 요청을 보내는 `Restaurant` 구조에서 타입 메서드를 만들 수 있다. 
- 또한 이 코드는 응답처리, JSON 데이터의 deserializing, 추출된 `"results"` Array의  dictionary에서 `Restaurant` 객체 생성, 비동기적으로 이들을 completion handler에서 반환하는 작업을 한다.

	```swift
	extension Restaurant {
		private let urlComponents: URLComponents // base URL components of the web service
		private let session: URLSession // shared session for interacting with the web service
	
		static func restaurants(matching query: String, completion: ([Restaurant]) -> Void) {
			var searchURLComponents = urlComponents
			searchURLComponents.path = "/search"
			searchURLComponents.queryItems = [URLQueryItem(name: "q", value: query)]
			let searchURL = searchURLComponents.url!
	
			session.dataTask(url: searchURL, completion: { (_, _, data, _)
				var restaurants: [Restaurant] = []
	
				if let data = data,
					let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
					for case let result in json["results"] {
						if let restaurant = Restaurant(json: result) {
							restaurants.append(restaurant)
						}
					}
				}
	
				completion(restaurants)
			}).resume()
		}
	}
	```

- 사용자가 검색 창에 텍스트를 입력하면 일치하는 레스토랑이 있는 TableView를 채울 때, ViewController가 아래와 같이 해당 메소드를 호출할 수 있다. 

	```swift
	import UIKit
	
	extension ViewController: UISearchResultsUpdating {
		func updateSearchResultsForSearchController(_ searchController: UISearchController) {
			if let query = searchController.searchBar.text, !query.isEmpty {
				Restaurant.restaurants(matching: query) { restaurants in
					self.restaurants = restaurants
					self.tableView.reloadData()
				}
			}
		}
	}
	```

- 이러한 방식으로 관심사를 구분하면 웹 서비스에 대한 구현 세부 사항이 변경되는 경우에도 ViewController에서 레스토랑 리소스에 액세스 하기 위한 일관된 인터페이스가 제공된다.

### 3. 권고사항

***

Converting between representations of the same data in order to communicate between different systems is a tedious, albeit necessary, task for writing software.
Because the structure of these representations can be quite similar, it may be tempting to create a higher-level abstraction to automatically map between these different representations. For instance, a type might define a mapping between snake_case JSON keys and camelCase property names in order to automatically initialize a model from JSON using the Swift reflection APIs, such as Mirror.
However, we’ve found that these kinds of abstractions tend not to offer significant benefits over conventional usage of Swift language features, and instead make it more difficult to debug problems or handle edge cases. In the example above, the initializer not only extracts and maps values from JSON, but also initializes complex data types and performs domain-specific input validation. A reflection-based approach would have to go to great lengths in order to accomplish all of these tasks. Keep this in mind when evaluating the available strategies for your own app. The cost of small amounts of duplication may be significantly less than picking the incorrect abstraction.

***






