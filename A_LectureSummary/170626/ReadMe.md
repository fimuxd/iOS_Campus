## 조교님 예제

### 1. Closure를 이용한 간단한 알고리즘

1. `let starPrint:(Int) -> Void` 형태로, 
2. *<p> **<p> ***<p> ****<p> 같은 형태로 출력해보기

	
	```swift
	//먼저 익숙한 형태의 함수를 통해 알고리즘을 생각해보자
	func starPrint(line:Int) {
	    var resultStar:String = ""
	    
	    for i in 1...line {
	        resultStar += "*"
	        print(resultStar)
	    }
	}
	
	//이 것을 Closure 형태로 넣어보자.
	let starPrint:(Int) -> Void = {(line) in
	
	    var resultStar:String = ""
	    
	    for i in 1...line {
	        resultStar += "*"
	        print(resultStar)
	    }
	
	}
	```

### 2. Timer의 동작 이해


> KVO(**K**ey **V**alue **O**bserver): key로 정해놓은 value가 값이 변할 때, observing 하는 것.