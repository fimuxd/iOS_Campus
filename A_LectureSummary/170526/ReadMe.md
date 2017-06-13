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
- 두 개의 인스턴스가 있을 때, 인스턴스의 관계를 볼 때, 하나의 인스턴스가 다른 아이를 프로퍼티 형태로 가지고 있는 (소유하고 있는) 형태인 것. 소유된 인스턴스는 자기의 동작을 자기가 알아서 할 것이고, 소유한 인스턴스가 요청한 동작만 소유된 인스턴스가 전달해 줄 것이다.
- B class가 delegate 함수를 가지고 있고, A가 B class의 delegate를 채택했다면, A가 소유한 인스턴스, B가 소유된 인스턴스다. 소유된 B는 누가 날 소유했는지 모른다. 이 때, B 스스로가 뭘 해야할지 모를 때, A가 채택한 행위를 구현할 때 그 것을 가져와서 실행하는 것이다.
- 소유될 B가 행동지침서 같은 것을 만들어서 protocol이라는 도구에 올린다. 그리고 오너인 A가 필요한 지침을 선택해서 명령하면, 실행은 B가 하는 것이다. 
- 델리게이트: B의 입장에서 봐야한다. 난 실행만 할게, 너가 코드 만들어 줘 (나한테 호출해줘).
> **A인스턴스에서 만든 B인스턴스가 B 자신이 해야될 일을, 프로토콜에서 정의된 메소드을 통해서 A가 대신 구현하도록 위임하는 디자인 패턴** 을 델리게이트라고 한다.


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

> - Delegate의 개념이 어렵다. 따라서 사용법에 일단 익숙해져야 한다.
> - 이후에 delegate를 스스로 만들어서 custom한 view를 직접 만들어 볼 것임