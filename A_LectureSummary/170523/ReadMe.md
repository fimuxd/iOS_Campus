# Application Life Cycle

## The Structure of an App

- MVC Pattern을 갖는다. (Apple의 권고사항이기도 하다)
	- Model <> Controller <> View

- Main Run Loop: 하나의 실행순서(thread)에 따라 계속적으로 반복 진행 하는 것
- 모든 UI는 main thread에서 돌아간다. 따라서 UI는 한 thread 에서 중복될 수 없다.

## Event에 대한 처리

![이미지](https://raw.githubusercontent.com/fimuxd/iOS_Campus/master/A_LectureSummary/170523/Event.tiff)

## Step of After Launch

- App Delegate: application이라는 객체가 만들어지고 이 것은 OS가 관리한다. core. 가장 먼저 만들어지는 객체. app이라는 객체가 app delegate의 method 를 통해 움직이고 작동한다.


# 접근 제어

## A. 기초 개념
- 각 클래스, 위치 별로 접근을 허용할 범위를 설정하는 것
- 목적은 객체지향적 프로그래밍의 특성인 캡슐화와 은닉화를 위해

## B. 용어

- 모듈: 프로젝트 하나. 일관성있는 하나의 큰 덩어리.
- 소스파일: Swift 파일 하나

## C. 접근제어

- 총 5가지의 제어수준이 있다.

	### 1. Open
	
	- Open으로 만들어지면 상속이 된다. (Public과 차이점)
		- 예. UIView
	
	### 2. Public
	
	- 상속은 불가능하지만 외부에서 가져다 쓰는 것(접근)은 가능하다
	
	
	### 3. Internal
	
	- 대부분은 internal 수준에서 접근하게 된다.
	- 접근제어를 별도로 입력하지 않으면 default 값은 internal이다.
	
	### 4. fileprive
	
	- 소스파일 수준의 접근 제어
	
	
	### 5. prive
	
	- class 또는 structure 수준의 접근제어




