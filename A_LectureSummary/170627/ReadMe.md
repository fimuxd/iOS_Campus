# ARC

- 	**A**uto **R**eference **C**ounting

> - ARC는 무엇인가
> - ARC를 왜 써야 하는가
> - ARC와 Closure의 접목

## A. ARC란?

***

• 명시적 해제 : 모든것을 개발자가 관리함<p>• 가비지콜렉터 : 가비지 콜렉터가 수시로 확인해서 안쓰는 객체를 해제 시킴 (시스템 부하)<p>• 레퍼런스 카운팅 : **오너쉽 정책**에 의해 객체의 해제 정의

***

- 프로그램마다 메모리 관리 방식은 다르다.
- 가장 보편적인 방법이 `명시적 해제` (C, C++)
- 그 다음에 나온 것이 `가비지콜렉터` . 어떤 메모리에 접근된 애들이 하나도 없으면 돌아다니다가 죽인다. 그리고 계속 돌아다닌다. CPU가 가비지콜렉터를 운영해야 하므로 개발자가 신경쓸 필요는 하나도 없지만 느리다. (Java)
- 명시적해제를 하는데 무조건 하는게 아니라 카운팅이라는 것을 매긴다. 그래서 개발자가 할당을 하면 카운팅이 늘어나고 할당을 해제하면 카운팅이 줄어든다. 할당/해제를 계속 반복해야 하므로 코드는 더럽지만, 카운팅이 0이 되면 저절로 사라진다. 명시적해제와 가비지콜렉터의 중간방식. (Objective-C)

### 1) Reference Counting

- Swift에서는 모두 ARC이므로, 부득이하게 Objective-C 코드를 볼 수 밖에 없다.

	```objectivec
	//NSString 타입의 str1을 할당한다 (rc +1)
	NSString *str1 = [[NSString alloc] init]; 
	
	//str1을 받는 str2를 받는다. 오너쉽과 함께 (rc +1)NSString *str2 = [str1 retain];
	
	//str2를 받는 str3을 받지만 참조할 뿐 오너쉽이 없다NSString *str3 = str2;
	
	//str1을 릴리즈 (해제)한다. (rc -1) str2,3은 영향이 없다[str1 release];
	
	//str2를 릴리즈 한다. (rc -1: 총 rc = 0). str3은 오너쉽이 없었으므로 같이 사라진다. [str2 release];
	```

- 잘못관리했을 때 발생하는 memory leak 사례

	```objectivec
	//str1,2,3 가 각각의 인스턴스를 만들었다 (rc +3)
	NSString *str1 = [[NSString alloc] init];NSString *str2 = [[NSString alloc] init];NSString *str3 = [[NSString alloc] init];	//str2에 또 다른 인스턴스를 만든다. 그럼 기존의 인스턴스와 연결이 끊어진다. (rc +1)str2 = [[NSString alloc] init];	/*str1,2,3 각각을 릴리즈한다. 
	그렇게 해도 str2의 첫번째 rc은 남아있다. 
	이건 앱이 죽을 때 까지 사라지지 않는다. (rc -3: 최종 rc = 1)*/	[str1 release];	[str2 release];	[str3 release];
	```

### 2) Ownership Policy

***

• 인스턴스 객체의 오너만이 해당 인스턴스의 해제에 대해서 책임을 진다.<p>• 오너쉽을 가진 객체만 reference count가 증가 된다.

***

## B. 다시 ARC

### 1) 도입 이유

***

• 앱의 비정상 종료 원인 중 많은 부분이 메모리 문제. 메모리 관리는 애플의 앱 승인 거부(Rejection)의 대다수 원인 중 하나.<p>• 많은 개발자들이 수동적인 (retain/release) 메모리 관리로 힘들어함.<p>• retain/release 로 코드 복잡도가 증가.

***

### 2) 그래서 만들었습니다.

***

• ARC는 Automatic Reference Counting의 약자로 기존에 수동(MRC라고 함)으로 개발자가 직접 retain/release를 통해 reference counting을 관리해야 하는 부분을 자동으로 해준다.

***

### 3) ARC 규칙

***

• retain, release, retainCount, autorelease, dealloc을 직접 호출할 수 없다.<p>• 구조체내의 객체 포인트를 사용할 수 없다.<p>• id나 void * type을 직접 형변환 시킬 수 없다.<p>• NSAutoreleasePool 객체를 사용할수 없다.

***

- 규칙이라지만, 지금까지 너희가 MRC 하기 위해 했던 행동들 할 필요 없다 라는 정도.

### 4) 새로운 지시어

#### Strong

- Swift의 경우 기본이 strong 이다.

	```objectivec
	@property(strong) Person *p1;
	@property(strong) Person *p2;
	```
	
	```swift
	var p1:Person
	var p2:Person
	```

- 두 변수는 strong지시어로 만들었기 때문에 객체에 대한 참조 포인트와 **소유권(Ownership)**을 가지고 있다.- 즉, 할당이 될때마다 reference count가 증가된다.

#### Weak

- Swift의 경우 weak	라는 keyword를 적어준다.

	```objectivec
	@property(strong) Person *p1;
	@property(weak) Person *p2;
	```
	
	```swift
	var p1:Person
	weak var p2:Person
	```
	
- p1은 strong지시어로 만들었기 때문에 객체에 대한 참조 포인트와 소유권(Ownership)을 가지고 있지만 p2는 약한 참조로 **소유권은 없이** 참조를 할수 있는 권한만 있다.- 즉 p2가 참조해도 **reference count는 증가 하지 않는다.**<p>
- weak에는 instance를 넣을 수 없다.

	```swift
	//만약, weak에 할당을 한다면?
	p2 = Person()
	```

- p2는 소유권이 없어 reference count를 증가시킬수 없고, reference count가 0인 객체는 자동으로 해제되기 때문에 …p2는 곧 바로 nil값을 가지게 된다.
- weak는 태생적으로 optional이다.

> - **Q.**그렇다면 weak는 왜 사용하는 것일까?
> - • 순환 참조를 막기위해> - • Autorelease pool을 대신해서 자동 해제가 필요한 경우> - • view의 strong 참조 때문에


## C. Closure 캡쳐

***

• 클로져 안의 모든 상수와 변수에 대한 참조를 캡쳐 해서 관리 한다.<p>• Swift는 캡쳐를 위한 모든 메모리를 관리한다.

***



