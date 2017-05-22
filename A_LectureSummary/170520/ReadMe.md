# UIView

- 앞으로 만드는 UI는 모두 UIVIEW라는 놈을 상속받는다
- UIView 자체는 하얀 사각형 같은 존재. 

```swift
//애니메이션이 어떻게 돌아가는지 속도와 관련해서 설명
public enum UIViewAnimationCurve : Int {

    
    case easeInOut // slow at beginning and end

    case easeIn // slow at beginning

    case easeOut // slow at end

    case linear
}
```

- enum: 열거. 같은 내용에 대해서 분리가 필요한데, 이 걸 가장 쉽게 구분하는 것은 숫자이다. 여기에 대해서 이름을 지어주고 이름에 해당되는 놈들을 enum에 모아둔 것이다. 이름으로 정해둔 여러가지 type들을 enum에 모은 것이다.

- CGSize, CGFlow, LayoutGuide 등 타입으로 되어있는데 내가 이해하지 못하는 것들을 볼 것. 5개 정도의 property에 대해서 찾아보는 시간을 가지게 될 것

- UIImageView, UIButton 등에 대해서 확인하게 될 것임


# UI Base Guide

## A. Pixel과 Point

- UI를 표시하는 단위는 Pixel과 Point 두가지가 있다.
- Pixel은 실제 이미지의 사이즈, Point는 화면 사이즈
	- cf. 안드로이드는 DPI라는 단위를 쓴다. 1인치 안에 몇개의 점을 가지고 있냐는 의미
- 2 pixel = 1 point
- 3GS의 경우 1:1 이었다. Retina의 경우, 두배의 픽셀을 표현할 수 있는 점을 줄여서 4개의 점이 하나의 포인트로 보이게 했고 Plus 모델의 경우, 9개의 점이 하나의 포인트로 보이게 해상도를 높여왔다. -> 해상도가 큰 이미지를 크게 하는 방식으로 Retina의 화소가 높아 보이는 효과
- 디자이너에게 이미지를 받을 땐 Pixel. 우리가 이걸 표현할 때는 Point로 계산해야 한다.
	- 화면사이즈를 받았을 때, 레티나는 2배, Plus는 3배를 한 사이즈

## B. 좌표계

- 포인트 기준. 모든 뷰의 좌측 상단을 0,0으로 해서 x값이 우측으로, y값이 내려갈 수록 값이 증가한다. 
	- 스토리보드로 할땐: Auto layout으로 할 것이다. 하지만 좌표계의 개념은 이해해 야한다.
- 뷰의 위치는 super.view를 기준으로 좌표를 가져오게 된다. -> 상대적


# UI Code

## A. Framework

- 응용 프로그램 표준 구조를 규현하는 class와 library의 모임
- UIKit
	- cf. 지도를 쓰고 싶으면 MapKit, GPS 좌표를 쓰고 싶으면 LocationKit

## B. UI Class Hierarchy

![hierarchy](/Users/B.Park/iOS_Campus/A_LectureSummary/170520/0522-23.tiff)

### 1. UIResponder

- `command` + `shift` + `o`

	```swift
	@available(iOS 2.0, *)
	open class UIResponder : NSObject, UIResponderStandardEditActions {
	
	    
	    open var next: UIResponder? { get }
	
	    
	    open var canBecomeFirstResponder: Bool { get } // default is NO
	
	    
	    // default is NO
	    
	    open func becomeFirstResponder() -> Bool
	
	    
	    open var canResignFirstResponder: Bool { get } // default is YES
	
	    
	    // default is YES
	    
	    open func resignFirstResponder() -> Bool
	
	    
	    open var isFirstResponder: Bool { get }
	
	    
	    // Generally, all responders which do custom touch handling should override all four of these methods.
	    // Your responder will receive either touchesEnded:withEvent: or touchesCancelled:withEvent: for each
	    // touch it is handling (those touches it received in touchesBegan:withEvent:).
	    // *** You must handle cancelled touches to ensure correct behavior in your application.  Failure to
	    // do so is very likely to lead to incorrect behavior or crashes.
	    open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
	
	    open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
	
	    open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
	
	    open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
	
	    @available(iOS 9.1, *)
	    open func touchesEstimatedPropertiesUpdated(_ touches: Set<UITouch>)
	
	    
	    // Generally, all responders which do custom press handling should override all four of these methods.
	    // Your responder will receive either pressesEnded:withEvent or pressesCancelled:withEvent: for each
	    // press it is handling (those presses it received in pressesBegan:withEvent:).
	    // pressesChanged:withEvent: will be invoked for presses that provide an analog value
	    // (like thumbsticks or analog push buttons)
	    // *** You must handle cancelled presses to ensure correct behavior in your application.  Failure to
	    // do so is very likely to lead to incorrect behavior or crashes.
	    @available(iOS 9.0, *)
	    open func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?)
	
	    @available(iOS 9.0, *)
	    open func pressesChanged(_ presses: Set<UIPress>, with event: UIPressesEvent?)
	
	    @available(iOS 9.0, *)
	    open func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?)
	
	    @available(iOS 9.0, *)
	    open func pressesCancelled(_ presses: Set<UIPress>, with event: UIPressesEvent?)
	
	    
	    @available(iOS 3.0, *)
	    open func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?)
	
	    @available(iOS 3.0, *)
	    open func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?)
	
	    @available(iOS 3.0, *)
	    open func motionCancelled(_ motion: UIEventSubtype, with event: UIEvent?)
	
	    
	    @available(iOS 4.0, *)
	    open func remoteControlReceived(with event: UIEvent?)
	
	    
	    @available(iOS 3.0, *)
	    open func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool
	
	    // Allows an action to be forwarded to another target. By default checks -canPerformAction:withSender: to either return self, or go up the responder chain.
	    @available(iOS 7.0, *)
	    open func target(forAction action: Selector, withSender sender: Any?) -> Any?
	
	    
	    @available(iOS 3.0, *)
	    open var undoManager: UndoManager? { get }
	}
	```
	
### 2. UIView

- UIResponder를 그대로 상속 받음

	#### 1) frame & bounds
	
	- frame: (x, y, width, height)
	- bounds: (0, 0, width, height)
	
	#### 2) cliptobounds
	
	- 화면의 frame 기준으로 벗어나는 이미지를 잘라버리는 것
	
	#### 3) backgroundColor & isHidden
	
	- backgroundColor: RGBA에서 A(alpha) 값을 둬서 배경을 투명하게 할 수 있고, 투명하더라도 터치가 가능하다
	- isHidden: 아예 숨겨버리는 것이라서 터치가 되지 않는다
	
	#### 4) addSubview
	
	- 우리가 실습했던 ViewController는 (Root)View가 기본적으로 깔려 있다. 여기에 Label을 올리면, View 아래에 새로운 계층이 생긴다. 이 것을 code로 나타내는 것이 addSubview
	- addSubview를 하지 않으면 ViewController상 View에 올라가지 않는다.

> - code를 이용해서 view 만들기
> 
> ```swift
> //iPhone 7 화면 위에 (15, 15, 345, 100) view 1개 
> // + 같은 사이즈의 view를 화면 하단 15,15에 올릴 것
>        
>        let viewOnSeven:UIView = UIView(frame: CGRect(x: 15, y: 15, width: 345, height: 100))
>        viewOnSeven.backgroundColor = UIColor.black
>        view.addSubview(viewOnSeven)
>        
>        let viewOnSeven2:UIView = UIView(frame: CGRect(x: 15, y: 552, width: 345, height: 100))
>        viewOnSeven2.backgroundColor = UIColor.red
>        view.addSubview(viewOnSeven2)
>        
> ```
> 
> - 결과 이미지
> 
> ![이미지](/Users/B.Park/iOS_Campus/A_LectureSummary/170520/viewByCode.png)

> - 좀 더 응용해 보자
> 
> ```swift
>//iPhone 7 화면 위에 (15, 15, 345, 100) view 1개 + 같은 사이즈의 view를 화면 하단 15,15에 올릴 것
>        //iPhone 7 Point Resolution = 375 x 667 pts
>        
>        //1. 상단의 최초 View (검정색)
>        let viewOnSeven:UIView = UIView(frame: CGRect(x: 15, y: 15, width: 345, height: 100))
>        viewOnSeven.backgroundColor = UIColor.black
>        view.addSubview(viewOnSeven)
>        
>        //2. 하단의 최초 View (빨간색)
>        let viewOnSeven2:UIView = UIView(frame: CGRect(x: 15, y: 552, width: 345, height: 100))
>        viewOnSeven2.backgroundColor = UIColor.red
>        view.addSubview(viewOnSeven2)
>        
>        //3. 1번 View 속에 Label 만들기
>        let labelOnView:UILabel = UILabel(frame: CGRect(x: 15, y: 15, width: 300, height: 50))
>        labelOnView.backgroundColor = UIColor.white
>        labelOnView.text = "this is on Label"
>        labelOnView.textAlignment = NSTextAlignment.center
>        labelOnView.textColor = UIColor.blue
>        viewOnSeven.addSubview(labelOnView)
>        
>        //4. 2번 view 속에 Label 만들기
>        let labelOnView2:UILabel = UILabel(frame: CGRect(x: 20, y: 20, width: 300, height: 50))
>        labelOnView2.backgroundColor = UIColor.cyan
>        labelOnView2.text = "this lable is on Red View"
>        labelOnView2.textColor = .yellow
>        viewOnSeven2.addSubview(labelOnView2)
>        
>        //5. 가운데 부분에 Label 만들기
>        let labelOnCenter:UILabel = UILabel(frame: CGRect(x: 87.5, y: 300, width: 200, height: 30))
>        labelOnCenter.backgroundColor = UIColor.darkGray
>        labelOnCenter.text = " Practice label by CODE #2"
>        labelOnView2.textAlignment = NSTextAlignment.right
>        labelOnCenter.font = UIFont(name: "Menlo", size: 12)
>        labelOnCenter.textColor = UIColor.white
>        self.view.addSubview(labelOnCenter)
> ``` 
> 
> - 결과 이미지
> 
> ![이미지](/Users/B.Park/iOS_Campus/A_LectureSummary/170520/viewAndLabelByCode.png)

### 3. UIImageView

- UIView를 그대로 상속받음
- 삽입할 이미지를 proj 하단에 삽입하고 '이미지명'.'확장자'를 정확히 입력해주면 된다. 
 
> - code로 이미지 삽입하기
> 
> ```swift
> let image1 = UIImageView(frame: CGRect(x: 30, y: 20, width: 315, height: 200))
>        image1.image = UIImage(named: "hardwell.jpg")
>        image1.contentMode = UIViewContentMode.scaleAspectFit
>        self.view.addSubview(image1)
>        
>        let image2 = UIImageView(frame: CGRect(x: 30, y: 220, width: 315, height: 200))
>        image2.image = UIImage(named: "hardwell.jpg")
>        image2.contentMode = UIViewContentMode.scaleToFill
>        self.view.addSubview(image2)
>        
>        let image3 = UIImageView(frame: CGRect(x: 30, y: 440, width: 315, height: 200))
>        image3.image = UIImage(named: "hardwell.jpg")
>        image3.contentMode = UIViewContentMode.scaleAspectFill
>        self.view.addSubview(image3)
> ```
> 
> - 삽입한 원본 ![이미지](/Users/B.Park/iOS_Campus/A_LectureSummary/170520/hardwell.jpg)
> 
> - 결과 이미지
> 
> ![이미지](/Users/B.Park/iOS_Campus/A_LectureSummary/170520/imageByCode.png)

## C. Assets
