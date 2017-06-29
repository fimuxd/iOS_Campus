# 코드리뷰
1. 이름이 너무 간단함: 예(이벤트이름 + 이름: touchUpInsideAtAddBtn)
2. 이름이 이상한 segCtrl
3. segCtrl: enum을 쓰는게 좋다. 왜냐하면 0, 1이 뭘 의미하는게 뭔지 모른다.
4. mainViewWillAppear 
5. tableView 데이터 넘기는 것(Person instance를 만드는 것)
6. 다음 뷰컨트롤러의 뷰가 할일을 그 이전 뷰컨트롤러가 하는 것은 좋지 않다. 데이터를 넘겨주고 그걸 가지고 수정하는 게 좋다
7. 왠만하면 tag(숫자만) 들어가는 것을 방지하고 enum을 쓰도록 한다.
8. 역할을 잘 바운더리 하는 것이 중요하다. 편하다고 편한쪽에 넣는 것이 아니라, 그 역할을 정말 해야하는 쪽에 넣고 관리하도록 해야 한다.
9. Alert 간단하게: Alert을 실행하는 함수를 만든다. OK와 cancle만 있고 ok눌렀을 때 액션이 있는 alert모양의 경우

```swift
func showNormalAlert(aleartTitle:String, message:String, okAction:() -> Void) {}

//만약 handler와 똑같이 하고 싶다면,
func showNormalAlert(aleartTitle:String, message:String, okAction:((UIAlertAction)->Void? = nil) {}
```

```swift
//현정이 추천 코드 (segmentIndex에 Filter 먹인 것)

  @IBAction func genderSegmentValueChanged(_ sender: UISegmentedControl) {
        
        friendList = DataFile.shared.getList()

        if sender.selectedSegmentIndex-1 >= 0{
            
            let list = friendList?.filter({ (person: Person) -> Bool in
                return person.gender.rawValue == sender.selectedSegmentIndex-1
            })
            
            self.friendList = list
        }
    
        //self.tableView.reloadData()

    }
```

***
재성 이
@i.boyoung.park 보영님, 나중에 이거 한번 봐봐여.
[https://github.com/pikachu987/PKCAlertView](https://github.com/pikachu987/PKCAlertView)

스위프트코리아에 어느 분이 Alert 띄우는거 만들어서 올렸다고 가져가 쓰라고 하셨던 프로젝트예요.
***


# UIGestureRecognizer

## A. 개념

***

• 사용자의 입력을 전달받을 수 있는 방법을 제공<p>• Tap, Pinch, Rotation, Swipe, Pan(drag), Edge Pan, Long Press 등을 인지하는 각각의 서브클래스 존재<p>• View 위에 얹어 액션을 핸들링

***

- Tap: 하나씩 누르는 거 (count를 먹음)
- Pinch: 두 손가락으로 확대/축소
- Rotation: 두 손가락으로 회전
- Swipe: 가속도를 주면서 휙휙 넘기는 것
- Pan: 드래그
- Screen Edge Pan: 화면 끝단에서 끌어내기
- Long Press: 길게 누르는 것

## B. Code

```swift
let tapGesture = UITapGestureRecognizer(target: self,				action: #selector(ViewController.tapAction(_:)))self.view.addGestureRecognizer(tapGesture)//ViewController내 존재 하는 함수func tapAction(_ sender:UITapGestureRecognizer) {}
```

- Gesture는 View에 먹이는 것

# Animation

• UIView Animation<p>• UIImageView Animation<p>• UIViewController Animation<p>- 특정 시간 동안 View의 속성값을 변화시키는 작업
	- 예 )move, fade, Size Change,repeat 등

## A. Anumation 가능한 properties

- frame- bounds- center- transform : Modify this property to scale, rotate, or translate theview relative to its center point.- alpha- backgroundColor- contentStretch

## B. Code

```swift
//기능의 복잡성 차이이지 모두 같은 아이들이다.

@available(iOS 4.0, *)open class func animate(withDuration duration: TimeInterval, delay: TimeInterval,options: UIViewAnimationOptions = [], animations: @escaping () -> Swift.Void,completion: ((Bool) -> Swift.Void)? = nil)@available(iOS 4.0, *)open class func animate(withDuration duration: TimeInterval, animations: @escaping() -> Swift.Void, completion: ((Bool) -> Swift.Void)? = nil) // delay = 0.0,options = 0@available(iOS 4.0, *)open class func animate(withDuration duration: TimeInterval, animations: @escaping() -> Swift.Void) // delay = 0.0, options = 0, completion = NULL
```

## C. 속성

***

• Duration : Animation 진행 시간<p>• Delay : 대기 시간<p>• Options : Animation 옵션<p>• Animations : 애니메이션 동작 Block 함수<p>• Completions : 애니메이션 완료 후 동작 Block함수
***

### 1) Options

```swift
public static var `repeat`: UIViewAnimationOptions { get }// repeat animation indefinitelypublic static var autoreverse: UIViewAnimationOptions { get }// if repeat, run animation back andpublic static var curveEaseInOut: UIViewAnimationOptions { get }// defaultpublic static var curveEaseIn: UIViewAnimationOptions { get }public static var curveEaseOut: UIViewAnimationOptions { get }public static var curveLinear: UIViewAnimationOptions { get }
```

### 2) 속도

- Linear: 일정하게 쭉
- CurveEaseIn: 점점 빠르게
- CurveEaseOut: 점점 느리게
- CurveEaseInOut: 빨랐다가 느려지게

