# Thread

## 1. 개념

• 스레드(thread)는 어떠한 프로그램 내에서, 특히 프로세스 내에서 실행되는 흐름의 단위를 말한다. 일반적으로 한 프로그램은하나의 스레드를 가지고 있지만, 프로그램 환경에 따라 둘 이상의 스레드를 동시에 실행할 수 있다. 이러한 실행 방식을 멀티스레드(multithread)라고 한다.

## 2. iOS Thread

• 모든 app은 기본적으로 main thread를 가지고 있다.
• use UIKit classes only from your app’s main thread.
• 기본적인 UI 및 모든 행동은 main thread에서 실행된다.

# 3. When is use

• 동시에 작업이 필요한 경우
• Multi core process를 사용하기 위해• 중요한 작업에 방해를 받지 않기 위해• 상태를 계속 감시 해야 할 경우가 필요할때

## 4. Multi thread 사용 예

• Network request/response• time control• image download/upload• long time actions


***

**< 선행해서 이해하면 좋은 내용 >**

• 비동기 (Asynchronous: 동시에 일어나지 않는, 非同期: 같은 시기가 아닌)
• 동기 (synchronous: 동시에 일어나는, 同期: 같은 시기)• 디자인패턴에 의한 비동기처리는 다음과 같은 것들이 있다.- 델리게이트(delegate), 셀렉터(@selector),블록(block), 노티피케이션(Notification)• 큐를 이용한 비동기처리 방법은 GCD로 가능하다.

• 교착 상태(膠着狀態, 영어: deadlock)란 두 개 이상의 작업이 서로 상대방의 작업이 끝나기 만을 기다리고 있기 때문에 결과적으로 아무것도 완료되지 못하는 상태를 가리킨다

***

# Multithread

## GCD; Grand Central Dispatch

- 비동기로 여러작업을 수행시키는 강력하고 쉬운 방법이다.
- System에서 Thread관리를 알아서 해준다.
- dispatch queue를 이용해 작업들을 컨트롤 한다.
	- queue가 여러개: 작업을 여러게 할 수 있다는 뜻- work item : Closure를 활용해서 구현되어 있으며 queue를 생성할때 꼭 같이 만들어야 한다.

### 1. Dispatch Queue

- Dispatch Queue는 GCD의 핵심으로 GCD로 실행한 작업들을 관리하는 queue이다.- 모든 dispatch queue는 first-in, first-out 데이터 구조이다.- Serial Queue와 Concurrent Queue 2종류로 나눌수 있다.
	- Seiral Queue: 직렬_ 작업이 들어오면 하나씩 쌓인다. 선행된 작업이 끝나면 다음 작업이 실행되는 방식
	- Concurrent Queue: 병렬_ 실행은 0,1,2,3 으로 했더라도 작업은 동시에 실행되기 때문에, 작업량에 따라서 종료되는 시점은 실행 순서와 다를 수 있다.

#### A. init

```swift
public convenience init(label: String,								qos: DispatchQoS = default,								attributes: DispatchQueue.Attributes = default,								autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency = default,								target: DispatchQueue? = default)
								
								let queue = DispatchQueue(label: “com.wing.queue")let queueOption = DispatchQueue(label: "com.wing.queue1", qos: .userInitiated)let queueAttri = DispatchQueue(label: "com.wing.queue2",										attributes: [.concurrent, .initiallyInactive])
```

- 보통 queue label의 이름은 `come` . `ID` . `queue` 로 지정한다. queue	의 중복을 막기 위한 것으로 특별한 규칙은 아니다.

#### B. async

```swift
let queue = DispatchQueue(label: "come.wing.async")
queue.async {
}
```

- 예를 들어보면,

	```swift
	let queueFirst = DispatchQueue(label: "com.fimuxd.q1")
	        //얘가 실행 된 후에
	        queueFirst.async {
	            for i in 1..<100 {
	                print("Q1_task1: \(i)")
	            }
	        }
	        
	        //얘가 실행된다.
	        queueFirst.async {
	            for i in 100...200 {
	                print("Q2_task2: \(i)")
	            }
	        }
	    }
	```
	
#### C. Queue 생성

```swift
 let queueThird = DispatchQueue(label: <#T##String#>, qos: <#T##DispatchQoS#>, attributes: <#T##DispatchQueue.Attributes#>, autoreleaseFrequency: <#T##DispatchQueue.AutoreleaseFrequency#>, target: <#T##DispatchQueue?#>)
```

##### 1. Label

queue의 이름

##### 2. qos (중요도)

userInteractive > userInitiated > default > utility > background > unspecified

##### 3. attribute (작업방식)

- Default = 직렬- concurrent = 병렬- initiallyInactive = 태스크 수동 실행(activate() 메소드)
	- 사용방법
	
		```swift
		let queueThird = DispatchQueue(label: "com.fimuxd.q3", qos: .userInteractive, attributes: .initiallyInactive)
		
		// 이렇게 attribues를 initiallyInactive를 설정하면, 바로 queue가 실행되지 않고, 버튼 또는 어떤 액션 부분에 
		
		queueThird.activate()
		
		// 이렇게 activate() 해줘야 queue가 실행된다.
		```
	- 만약, `initallyInactive` 이면서 동시에 `concurrent` 를 하고 싶다면, 

		```swift
		let queueThird = DispatchQueue(label: "com.fimuxd.q3", qos: .userInteractive, attributes: [.initiallyInactive, .concurrent])
		// 이와 같이 set의 형태로 입력할 수 있다. (optionalSet이므로)
		```

##### 4. autoreleaseFrequency

##### 5. target


### 2. Main Dispatch Queue

GCD는 Thread라는 용어를 쓰지 않고 Queue라고 한다. 여기에는 `DispatchQueue` 가 있고, `DispatchQueue` 는 `Main` 과 `Global` 이 있다. 

### 3. Global Dispatch Queue

### 4. Timer (추가기능)

작업을 실행하는 시간이 몇 초 후 인 것. ~끝나는 시간이 아님~

```swift
let delayQueue = DispatchQueue(label: "com.wing.delayqueue", qos: .userInitiated)print(Date())let additionalTime: DispatchTimeInterval = .seconds(2)delayQueue.asyncAfter(deadline: .now() + additionalTime) {print(Date())}
delayQueue.asyncAfter(deadline: .now() + 0.75) {print(Date())}
``` 