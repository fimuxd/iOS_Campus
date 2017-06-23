# Notification

## A. Notification Center

```
• 특정 이벤트가 발생 하였음을 알리기 위해 불특정 다수의 객체에게 알리기 위해 사용하는 클래스• 어떤 객체라도 특정 이벤트가 발생했다는 알림을 받을 것이라고 관찰자(Observer)로 등록을 해두면 노티피케이션 센터가 모든 관찰자 객체에게 알림을 준다.
```

- Notification Center(이하 NC)는 Singleton이다.
- NC가 불특정 다수의 instance에게 특정 이벤트를 알려주는 것
	- 인스턴스가 `center.add(observe.self)`  와 같은 방식으로 요청
	- NC는 `center.obsservelist[]` 같은 array에 해당 instance wjwkd
	
> **델리게이트**: 프로토콜을 가지고 있어서, 나를 구현해줄 사람은 이 프로토콜을 써주세요 라고 하는 꼴

> **NC**: 방송국. 나 이 이벤트에 관심있어라고 등록해 놓으면 그 객체에게 해당 이벤트 발생시 알려주는 것

> **property observer**: 이 아이도 비슷

## B. 주요 Method

- NC는 UIKit에 있다.(Apple에서 제공해주는 것)
- 개발자가 만드는 것이 아니라 이미 있는 내용

### 1. Initializing

```swift
open class var `default`: NotificationCenter { get }
```

### 2. Add Observer

```swift
open func addObserver(_ observer: Any, selector aSelector: Selector, name aName: NSNotification.Name?, object anObject: Any?)
```

### 3. Post Notification


```swift
open func post(name aName: NSNotification.Name, object anObject: Any?, userInfo aUserInfo: [AnyHashable : Any]? = nil)
```

### 4. Remove Observer

```swift
open func removeObserver(_ observer: Any)
```

## C. System Notification

```swift
//Observer
func observerNoti(noti:Notification) {	NotificationCenter.default.addObserver(self,
		selector: #selector(ViewController.ob(noti:)),
		name: Notification.Name.UIKeyboardWillShow,object: nil)}
func trakingPost(noti:Notification) {	//noti 내용}

//Poster
//키보드가 올라올 때 시스템에서 자동으로 Noti를 post 해준다.
```

## D. 예제

- selecter: 함수를 등록하는 것
- name: 관심있다고 한 것이 서로 맞는지 key값으로 매칭시켜주는 것

```swift
// Observer 측면
func observerNoti(noti:Notification) {NotificationCenter.default.addObserver(self,selector: #selector(ViewController.trackingPost(noti:)),name: Notification.Name(rawValue: "key"),object: nil)}
func trakingPost(noti:Notification) {//noti 내용}

// Poster 측면
func postNoti() {NotificationCenter.default.post(name:Notification.Name(rawValue: "key"), object: nil)}
```

### UserDefault와 UISwitch, Button, SegmentControl을 이용한 Notification 이해

- 개념
	- 1. mainVC와 secondVC가 있다.
	- 2. mainVC에는 Label만 있다.
	- 3. secondVC에 있는 Switch, Button, SegmentControl 동작에 따라 mainVC Label의 Text를 바꿔보자
	- 4. UserDefault를 이용해, secondVC > mainVC > secondVC로 돌아오더라도 설정이 유지되도록 해보자

- mainVC

```swift
//mainVC부분: Notification Observer 역할
class ViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var tellMeLabel: UILabel!
    @IBOutlet weak var whichSegueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 해당 ViewController가 Observer가 된다는 것
        // Observer 인 VC상의 label에게 그 것을 알려주기 위해서 addObserver에서 해당 함수(callNoti)내부에 실행할 액션을 더한다.
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.callNoti(_:)), name: Notification.Name("changeSwitcher"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.tellMeNoti(_:)), name: Notification.Name("TellMeBtn"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.whichSegueNumber(_:)), name: Notification.Name("SegueNumber"), object: nil)
    }   
    
    func callNoti(_ sender:Notification) {
        statusLabel.text = sender.object as? String
    }
    
    func tellMeNoti(_ sender:Notification) {
        tellMeLabel.text = sender.object as? String
    }
    
    func whichSegueNumber(_ sender:Notification) {
        whichSegueLabel.text = sender.object as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        //최초의 ViewController는 보통 한번만 불리지만, 메모리 워닝이 나면 한번 더 불릴 수가 있다.
        //그럴때를 대비해서 생성된 Observer들을 지워주는 것이 좋다.
        
        NotificationCenter.default.removeObserver(self)
    }

}
```

- secondVC

```swift
//secondVC 부분
class SecondViewController: UIViewController {
    
    
    /**************************************************/
    //                IBOutlet | 전역변수               //
    /**************************************************/
    @IBOutlet weak var testSwitch: UISwitch!
    @IBOutlet weak var testSegCtrlOutlet: UISegmentedControl!
    
    
    /**************************************************/
    //                IBAction | Methods               //
    /**************************************************/
    
    //-----스위치 액션
    @IBAction func changeSwitcher(_ sender: UISwitch) {
        
        if sender.isOn{
            NotificationCenter.default.post(name: Notification.Name(rawValue: "changeSwitcher"), object: "불켜져있어")
            UserDefaults.standard.set(true, forKey: "스위치불")
            
        } else {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "changeSwitcher"), object: "불껐당")
            UserDefaults.standard.set(false, forKey: "스위치불")
        }
   
    }
    
    //-----버튼
    @IBAction func tellMeTheFactBtn(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("TellMeBtn"), object: "내가 아는건 내가 멍청하다는 사실뿐입니당")
    }
    
    //-----SegmentedControl
    @IBAction func segControl(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "SegueNumber"), object: "첫번째 눌렀구낭")
            UserDefaults.standard.set(1, forKey: "세그컨트롤")
        } else {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "SegueNumber"), object: "두번째 눌렀넹ㅋ")
            UserDefaults.standard.set(2, forKey: "세그컨트롤")
        }
    }
    
    //-----스위치 온오프 상태 기억
    func switcherAction() {
        let switcherStatus:Bool = UserDefaults.standard.bool(forKey: "스위치불")
        
        if switcherStatus == false {
            self.testSwitch.setOn(false, animated: true)
        }else{
            self.testSwitch.setOn(true, animated: true)
        }
    }
    
    //-----SegmentControl 상태 기억
    func segControlStatus() {
        let segCtrlStatus = UserDefaults.standard.double(forKey: "세그컨트롤")
        
        if segCtrlStatus == 2 {
            self.testSegCtrlOutlet.selectedSegmentIndex = 1
        }else{
            self.testSegCtrlOutlet.selectedSegmentIndex = 0
        }
        
    }
    
    /**************************************************/
    //                 View Life Cycle                //
    /**************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()

        switcherAction()
        segControlStatus()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    //-----나갈 때 Noti 지우고 나가 ^^
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
```

