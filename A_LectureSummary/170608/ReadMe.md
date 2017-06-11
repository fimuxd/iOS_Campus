## 강사님 Review

- 객체지향을 배움
- class와 변수, 함수를 배움
	- class를 가지고 객체라는 것을 만둠 (메모리안에 존재)
- 그리고 UI로 넘어감
	- VC는 View들을 가지고 있고
	- 각종 View 들은 UIView라는 Class를 상속받은 아이들
	- 인스턴스형태로 만든다음에 > 얘네들의 속성(프로퍼티)값을 조정하면서 > UI들을 만들어서 > 화면에 표시한다. 화면에 표시할 때 AutoLayout을 썼다
- Class를 가지고 만든 인스턴스인 UI들을 AutoLayout을 통해 화면에 표시하는 것
- 이러한 인스턴스들을 VC가 관리
	- VC도 class고 상속받은 아이들(UIResponder)
	- VC는 데이터도 가지고 있고 이를 control한다
- UI와 controler간의 관계를 배웠고 이들의 관계를 delegate라는 pattern을 통해 구현한것
- 이러한 VC간의 화면 전환에 대한 것을 배웠다. (Navigation, preent modally)
- 화면과 화면 전환, Segue, VC, View 모두 인스턴스다. 결국 이 들이 다 객체이며 그렇기 때문에 이것을 객체지향이라고 한다.
- 자기가 모르는 부분을 되돌아보고 부족한 점을 채워나갈 것.
	- 함수를 구성하는 조건문 반복문 등 알고리즘에 대한 내용들은 스킬에 대한 것. 이 것이 약하다면 알고리즘 문제를 많이 풀어볼 것
	- 또는 프레임 워크 부분에 약하다면 사용법에 대한 숙지를 위해 문서를 많이 읽어볼 것
	- 툴에 대한 사용약하다면 그 사용법, xCode 및 AutoLayout에 대한 것을 공부할 것

> 전체적인 흐름을 이해한 후, 스킬로 들어가는 것

- `NSObject` 의 NS는 NextStep 이라는 회사명의 줄임말. NSObject는 모든 Object를 일컫는다. 모든 Object는 NSObject를 상속받는다. 


# UICustomView

# UICustomView

- 모든 View는 UIView를 상속 받는다.
- 조교님이 잘 만드시는 동그란 버튼을 custom하게 만든다고 가정해보면,

	```swift
	//1. xCode에서 cocoa touch frame work를 통해, UIButton 속성을 갖는 class를 하나 만들어준다.
	//2. storyBoard...(init 안해도 되는 이유)
	//3. 대신 viewDidLoad와 비슷한 역하을 하는, awakeFromNib을 걸어준다
	
		override func awakeFromNib() {
			super.awakeFromLib()
		
			self.layer.cornerRadius = 10
			self.layer.borderColor = UIcolor.lightGray.cgColor
			self.layer.borderwidth = 1
	```
