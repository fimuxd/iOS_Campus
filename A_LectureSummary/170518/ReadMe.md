## 조교님 수업

- `type(of: 변수명)`: 변수의 타입을 확인할 수 있는 명령어

	```swift
	var optionalStr:String? = ""
	type(of: optionalStr)
		//print 값: optional(String) type
	
	var optionalStr:String! = ""
	type(of: optionalStr)
		//print 값: String type
	```


## Remind

- instance의 개념을 이해하자. instance는 메모리에 값을 할당할 공간을 만드는 것. 값을 할당할 공간을 만든 후, 값을 집어넣어야지만 객체화가 되는 것이다. 공간을 만든 그 자체만으로 어떠한 성격이나 타입을 가지게 되는 것은 아니다.



# Inheritance

- overload와 override의 차이점: overload는 부모클래스의 것을 가져오는것. 또는 나한테 메소드가 있고, 이름이 똑같은 메소드를 또 만든 뒤 파라미터 값만 다르게 했다고 생각해보자. 두개의 메소드가 이름이 같지만 파라미터가 다를 것이다. 이 것을 overloading이라고 한다. 똑같은 함수를 여러개 만드는 것. 

- override는 그냥 덮어쓰기 하는 것. 예를 들어서 부모에게 A라는 메소드가 있는데 자식클래스에서 또 똑같은 A라는 메소드를 만든 후 A를 호출한다면, 자기 자신의 메소드를 호출하게 된다. 부모의 것을 가져와서 내 것으로 재정의 하는 것

- 상속은 class 간에만 가능 (structure - class는 되지 않는다)

