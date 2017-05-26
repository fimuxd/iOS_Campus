# Delegate

- iOS에서 Delegate 라고 부른다. 의미는 Delegate Pattern.
- 어떤 아이를 어떻게 가져오면 좋더라는 디자인 패턴
- 어떻게 가져오느냐? Protocol을 통해 > 그럼 Protocol이 머지?

## A. Protocol

### 1. 개념

- 통신규약
- 대표적인 protocol > `http://`
	- 인터넷 네트워킹에서, 나와 서로 다르나 알지못하는 제3의 컴퓨터가 연결할 때 서로가 이해할 수 있을 규칙
	- 통신을 할 때 쓰이는 통신규약
- 프로토콜은 기대하는 기능을 구현하기 위해서 변수와 함수를 정의하게 되며, 다른 class 등이 이 프로토콜을 *채택* 했다면 반드시 그 프로토콜의 변수와 함수를 사용해야 한다. 

### 2. 문법

- protocol은 보통, 상속했다고 하지 않고 *채택* 했다고 말한다. 하나의 class에서 여러개의 protocol 채택 가능하다.

```swift
//protocol 생성
protocol SomeProtocol{
}

//struct가 protocol 을 채택

//class가 struct를 상속하고, protocol을 채택

```

## B. Delegate Design Pattern

- delegate는 대리인/위임하다는 의미

## C. 참고; UITextField의 Delegates

- 어떠한 class의 delegate 설정을 알고 싶으면, `command` + class명을 `클릭` 한다.

- 그 곳에서 delegate 변수를 찾아, delegate의 타입을 확인한다. 
	- UITextField의 경우: `weak open var delegate: UITextFieldDelegate? `

- 그렇게 하면 UITextField의 경우, 하기와 같은 delegate Protocol을 확인할 수 있다. 
 
```swift
public protocol UITextFieldDelegate : NSObjectProtocol {

    
    @available(iOS 2.0, *)
    optional public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool 
    // return NO to disallow editing.

    @available(iOS 2.0, *)
    optional public func textFieldDidBeginEditing(_ textField: UITextField) 
    // became first responder

    @available(iOS 2.0, *)
    optional public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool 
    // return YES to allow editing to stop and to resign first responder status. 
    // NO to disallow the editing session to end

    @available(iOS 2.0, *)
    optional public func textFieldDidEndEditing(_ textField: UITextField) 
    // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

    @available(iOS 10.0, *)
    optional public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) 
    // if implemented, called in place of textFieldDidEndEditing:

    
    @available(iOS 2.0, *)
    optional public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool 
    // return NO to not change text

    
    @available(iOS 2.0, *)
    optional public func textFieldShouldClear(_ textField: UITextField) -> Bool 
    // called when clear button pressed. return NO to ignore (no notifications)

    @available(iOS 2.0, *)
    optional public func textFieldShouldReturn(_ textField: UITextField) -> Bool 
    // called when 'return' key pressed. return NO to ignore.
}

```