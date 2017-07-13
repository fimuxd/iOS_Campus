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

dispatchQueue