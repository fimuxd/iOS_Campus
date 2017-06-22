# Notification

## A. Notification Center

```
• 특정 이벤트가 발생 하였음을 알리기 위해 불특정 다수의 객체에게 알리기 위해 사용하는 클래스• 어떤 객체라도 특정 이벤트가 발생했다는 알림을 받을 것이라고 관찰자(Observer)로 등록을 해두면 노티피케이션 센터가 모든 관찰자 객체에게 알림을 준다.
```

- Notification Center(이하 NC)는 Singleton이다.
- NC가 불특정 다수의 instance에게 특정 이벤트를 알려주는 것
	- 인스턴스가 `center.add(observe.self)`  와 같은 방식으로 요청
	- NC는 `center.obsservelist[]` 같은 array에 해당 instance wjwkd
	
> **델리게이트**: 프로토콜을 가지고 있어서, 나를 구현해줄 사람은 이 프로토콜을 써주세요 라고 하는 꼴

> **NC**: 방송국. 나 이 이벤트에 관심있어라고 등록해 놓으면 그 객체에게 해당 이벤트 발생시 알려주는 것

> **property observer**: 이 아이도 비슷

## B. 주요 Method

- NC는 UIKit에 있다.(Apple에서 제공해주는 것)
- 개발자가 만드는 것이 아니라 이미 있는 내용

### 1. Initializing

```swift
open class var `default`: NotificationCenter { get }
```

### 2. Add Observer

```swift
open func addObserver(_ observer: Any, selector aSelector: Selector, name aName: NSNotification.Name?, object anObject: Any?)
```

### 3. Post Notification


```swift
open func post(name aName: NSNotification.Name, object anObject: Any?, userInfo aUserInfo: [AnyHashable : Any]? = nil)
```

### 4. Remove Observer

```swift
open func removeObserver(_ observer: Any)
```

## C. 예제

- selecter: 함수를 등록하는 것
- name: 관심있다고 한 것이 서로 맞는지 key값으로 매칭시켜주는 것

```swift
// Observer 측면
func observerNoti(noti:Notification) {NotificationCenter.default.addObserver(self,selector: #selector(ViewController.trackingPost(noti:)),name: Notification.Name(rawValue: "key"),object: nil)}
func trakingPost(noti:Notification) {//noti 내용}

// Poster 측면
func postNoti() {NotificationCenter.default.post(name:Notification.Name(rawValue: "key"), object: nil)}
```

