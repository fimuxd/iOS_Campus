## 조교님 Tip

### UICatalog

- 인터넷에 [UIKitCatalog](https://developer.apple.com/library/content/samplecode/UICatalog/Introduction/Intro.html)라고 치면 나와여 

- UIKit 속에 있는 놈들이 어떤 것인지 시각적으로 보여줄 수 있도록 Apple이 App으로 만듬


## 강사님 CodeReview

- 하나의 class 내에서만 쓰일 func 인게 확실하다면, func 앞에  `fileprivate` 를 입력한다.
	- 이렇게 해놓으면 추후에 확인하기 편리하다.

- 이미지 삽입할 경우 Asset을 많이 이용해 볼 것


# UIAlertController

- 이 아이도 Controller
- Present Modally로 Alert을 띄워준다
- Segue로 할 수 없고 무조건 code로 해야 한다.
- Alert 과 Action Sheet 두가지가 있다
- 만드는 순서: controller > action > action 추가 > present




