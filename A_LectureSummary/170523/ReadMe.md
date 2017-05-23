# Application Life Cycle

## The Structure of an App

- MVC Pattern을 갖는다. (Apple의 권고사항이기도 하다)
	- Model <> Controller <> View

- Main Run Loop: 하나의 실행순서(thread)에 따라 계속적으로 반복 진행 하는 것
- 모든 UI는 main thread에서 돌아간다. 따라서 UI는 한 thread 에서 중복될 수 없다.

## Event에 대한 처리

이미지

## Step of After Launch

- App Delegate: application이라는 객체가 만들어지고 이 것은 OS가 관리한다. core. 가장 먼저 만들어지는 객체. app이라는 객체가 app delegate의 method 를 통해 움직이고 작동한다.


- Main Interface: Main.storyboard