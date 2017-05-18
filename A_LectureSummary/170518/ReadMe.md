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

- 부모클래스(super class, parent class)와 자식클래스(sub class, child class)라 명명한다.
- 상속은 class 간에만 가능 (structure - class는 되지 않는다)

## A. Overload & Override

### 1. Overload(중복정의)
 
- 현재 class(self)한테 method A가 있고, 이름이 똑같은 method A를 또 만든 뒤 parameter type만 다르게 했다고 생각해보자. 두개의 method가 이름이 같지만 parameter의 type 다를 것이다. 이 것을 overloading이라고 한다. -> 똑같은 method(func)를 여러개 만드는 것. 


### 2. Override(재정의)

- 덮어쓰기 하는 것. 
	- 예. 부모(super)에게 A라는 method가 있는데 자식 class에서 또 똑같은 A라는 method를 만든 후 A를 호출한다면, 부모(super)가 아닌 자기 자신(self)의 method를 호출하게 된다. 
- 부모의 것을 가져와서 내 것으로 override(재정의) 하는 것

