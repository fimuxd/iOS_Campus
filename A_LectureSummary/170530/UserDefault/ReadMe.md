## 조교님 Tip

- 1. 순서: 바로 뭔가를 시도하기 전에 순서를 생각해볼 것
- 2. 추측 X: 이거 외않되? 보다 무서운건 이거 외되?(ㅋㅋ) 무작정 남을 따라해서 결과를 얻는 것은 정말 최악의 solution. 하는 방법을 익히는 것에 집중

# UserDefault

- 데이터의 저장에 관한 것
- 데이터를 영구적으로 저장하는데 있어서 가장 간단한 방법
- 활용도가 크다

## A. 기본 개념

- 데이터의 저장방법은 다양하다
	- 파일저장: 가장 간단한 방법 -> *우리는 **Property List**(a.k.a Plist) 저장 기준으로 배울것. 하지만 약간 애매한 부분이 있다. swift에서는 Plist로 저장할 수 있는 방법이 없고, objective-C로 저장할 수 밖에 없다. 이번 WWDC에서 Swift 4.0이 Plist를 지원한다면 다행이지만 그렇지 않다면 Plist를 쓰는 것은 의미가 퇴색되는 상황*
	- iOS DataBase: 큰 데이터 저장용
	- Network Server: 가장 많이 사용하는 방법

> - Realm `램` : [여기](https://realm.io/kr/) 참조

## B. UserDefaults

### 1. 개념

- Plist의 개념을 가지고 만들어진 개념
- 사용자의 정보를 저장하는 `싱글톤 인스턴스` ~싱글톤 인스턴스 의미 자체에 대해서는 나중에~
- 간단한 사용자 정보를 저장/불러오기가 가능하게 만든 인스턴스
- 단점
	- DB형태에 비해 파일저장형태는 보안에 취약하다.
	- 암호화를 해놓지 않으면 위험성이 있다. (예. 아이폰에 저장된 Plist 파일들을 컴퓨터에 연결해서 iTunes를 통해 확인할 수 있다는 것)
- UserDefault는 class 다.
- property list에 저장하게 되고, Dictionary 형태로 저장된다. ~정확하게 말하면 `Json type` 인데 이건 알아서 찾아볼 것 ;(~

### 2. 사용방법

- Swift Code

	```swift
	open class var standard: UserDefaults { get }//데이터 불러오기open func object(forKey defaultName: String) -> Any?open func string(forKey defaultName: String) -> String?open func array(forKey defaultName: String) -> [Any]?//데이터 저장하기open func set(_ value: Any?, forKey defaultName: String)//데이터 지우기open func removeObject(forKey defaultName: String)
	```

- 한번 만들어진 파일은 지워지지 않는다. 지우려면 app 자체를 지워야 한다.
- //데이터 지우기상의 removeObject method는 파일을 지우는 것이 아니라 key값 등 생성된 파일의 내용을 지우는 것이다. 파일자체는 사라지지 않는다. 

