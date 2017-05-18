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

- 상속(Inheritance)이란, 두 class가 있을 때 한 class가 다른 class의 property나 method를 물려받는 것을 의미한다. 
	- [예전 객체지향형 프로그래밍(Object Oriented Programming에서의 상속성 특징 참고](https://github.com/fimuxd/iOS_Campus/tree/master/A_LectureSummary/170510/ObjectOrientedProgramming)

## A. Overload & Override

### 1. Overload
 
- Overload는 부모Class(super)의 것을 가져오는것. 
- 또는 현재 class(self)한테 method A가 있고, 이름이 똑같은 method A를 또 만든 뒤 parameter type만 다르게 했다고 생각해보자. 두개의 method가 이름이 같지만 parameter의 type 다를 것이다. 이 것을 overloading이라고 한다. -> 똑같은 method(func)를 여러개 만드는 것. 

```swift

```

- override는 그냥 덮어쓰기 하는 것. 예를 들어서 부모에게 A라는 메소드가 있는데 자식클래스에서 또 똑같은 A라는 메소드를 만든 후 A를 호출한다면, 자기 자신의 메소드를 호출하게 된다. 부모의 것을 가져와서 내 것으로 재정의 하는 것

- 상속은 class 간에만 가능 (structure - class는 되지 않는다)

