# 재귀함수

## A. 개념

- 무한 액자같이 생김
- 반복문을 쓰지 않고 자기자신 자체가 하나의 함수가 되어 내가 나를 계속 호출하는 것. 
- 언제까지? -> end point 가 나타날 때까지 
- 단점: 메모리를 많이 잡아 먹는다. 
- 장점: 연산을 많이 하지 않는다. 따라서 빠르다.

	> [Wikipedia 설명 참조](https://ko.wikipedia.org/wiki/재귀함수)


## B. 예시

### 1. 팩토리얼구하기

- 일반적으로 배운 내용에서는 (반복문)
	
	```swift
	func factorial(n:Int) -> Int {
		var fac:Int = 1
		
		for i in 1...n {
		fac *= i
		}
	
	return fac
	}
	```
		
- 재귀함수로 한다면(recursion)

	```swift
	func recFactorial(n:Int) -> Int {
		if n <= 1 {
		return 1
		}
		else {
		return n * recFactorial(n:n-1)
		}
	}
	```
		
### 2. 콜라츠 추측

- 아침에 한 Collatz Conjecture를 재귀함수로 풀어본다면

	```swift
	func recCollatz(n:Int) -> Int {
	
		// 재귀함수의 end poin
		if n == 1 {
		return 1
		}
		
		else {
			if n%2 == 0 {
			                          return 1 + recCollatz(n: n/2)
			}
			else {
			return 1 + collatz(n: (n*3)+1)
			}
		}
	}	
	```

### 3. 피보나치 수열

#### 1) 피보나치의 마지막 수 구하기 (n번째 피보나치 수)

```swift
func recFibonacci(n:Int) -> Int {
    if n == 0 {
        return 0
    }
    else if n == 1 {
        return 1
    }
    else {
        return recFibonacci(n: n-1) + recFibonacci(n: n-2)
    }      
}
```

#### 2) 피보나치 수열 구하기

```swift
func fibonacci(n:recFibonacci) -> array {
   let lastIndex = inputNumber - 1
    
	    if lastIndex == 1 {
	        return [1,1]
	    }
        else {
            var resultArray = fibonacci(n: lastIndex)
            
            let result: Int = resultArray[lastIndex - 1] + resultArray[lastIndex - 2]
            resultArray.append(result)
            return resultArray
        }
}
```

> [하노이의 탑](https://github.com/fimuxd/iOS_Campus/blob/master/B_Programming%20Practice/Practice%20by%20Xcode%20Project/SelfStudy(Loops)/SelfStudy(Loops)/ViewController.swift) (2^n - 1)에 대해 생각해보자