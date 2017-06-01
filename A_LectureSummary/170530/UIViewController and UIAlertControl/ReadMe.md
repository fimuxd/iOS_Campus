# UIViewController

## A. 기본 개념

![image](https://github.com/fimuxd/iOS_Campus/blob/master/A_LectureSummary/170530/UIViewController%20and%20UIAlertControl/MVC%20Model.png?raw=true)

- Apple의 App은 MVC Pattern을 사용한다.
- ViewController는 View를 관리하며, View와 Model 사이에서 중추적인 역할을 한다.
	- 우리가 보는 모든 UI는 View이며, 이들이 행하는 모든 action들은 ViewController가 관리하여 다시 View로 뿌려주는 역할

## B. 특징

### 1. Child UIViewController

- iPhone Plus ver.의 가로버전 & IPad 에서 사용할 수 있는 Split View
- Splite(Container) View가 내부에 자식 VC를 만들 수 있고, 자식 VC의 View들이 addSubView가 되어서 올라간다.

### 2. UserInteraction

- 이벤트 관련한 것들은 UIViewController가 받게된다. 
- 이 것이 가능한 이유는 UIViewController는 UIResponder를 상속받는 class 이므로

### 3. Data Marshaling

- VC는 자신이 관리하는 View와 App내부 data들간의 중계자 역할을 한다. 
- 상단 기본개념의 ***[우리가 보는 모든 UI는 View이며, 이들이 행하는 모든 action들은 ViewController가 관리하여 다시 View로 뿌려주는 역할]*** 과 같은 말

### 4. Resource Management

- 메모리 부족시, UI 그이후 다시 ViewApear가 되어야 하면 ViewDidLoad를 부른다음에 다시 View를 띄운다. > 일단 화면에 보이는 것을 최적화 시키는 것

## C. 종류

### 1. General ViewController

- 일반적인 VC를 가지고 있다.
- 각 VC가 Root View를 가지고 있다.
- Root View가 뭐냐에 따라서 바뀌는 것일 뿐


## D. 활용

### 1. Instance Load
	 
- 구조를 이해하기 위해서 다음과 같은 상황을 가정해서 풀어보자
	- 가정. storyboard상, initial view가 없는 상태에서, AppDelegate를 통해 View를 불러오자
	
		```swift
		// ViewController를 Code로 불러와서 띄운다. 왜냐하면 AppDelegate의 didFinishLaunchingWithOptions가 App이 런칭만 되면 실행되는 놈이기 때문에
		        
		        // 1. window를 하나 만들어준다
		            self.window = UIWindow(frame: UIScreen.main.bounds)
		
		        // 2-1. storyboard를 만들어 연결시켜준다. 여기서 withIdentifier에 입력해준 값이 storyboard의 ID값이 되므로, 해당 값(여기서는 ViewController)를 Main.storyboard로 가서 동일한 ID값을 입력시켜 주어야 한다.
		        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
		        let viewController:ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
		        
		          // 2-2. 새로 만든 MainViewController라는 놈을 첫 화면으로 띄우려면?
		        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
		        let mainViewController:MainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! ViewController
		
		        
		        // 3-1. 2번에서 생성한 viewController라는 VC를 창의 rootView로 설정한다.
		        self.window?.rootViewController = viewController
		        self.window?.makeKeyAndVisible()
		        
		        // 3-2. MainViewController 를 rootView로 설정한다
		        self.window?.rootViewController = mainViewController
		        self.window?.makeKeyAndVisible()
		```
	
### 2. Present Modally
	
- VC와 VC간의 전환
	- cf) View와 ViewController를 구분하자. View간의 전환(Navigation 또는 ScrollView와는 다르다)
	
	#### Segue: Present Modally를 위해 필요한 개념
		
	##### i. Segue도 인스턴스
		
	![segue](https://github.com/fimuxd/iOS_Campus/blob/master/A_LectureSummary/170530/UIViewController%20and%20UIAlertControl/Segue.png?raw=true)
		
	##### ii. Segue를 ctrl 하려면, Segue의 Runtime내, 두개의 함수를 이해하고 써야 한다.
	
	- `shouldPerformSegueWithIdentifier:sender:` : 다른 VC(Segue)로 전환할지 하지 않을지 설정 (default = yes)
		-  `prepareForSegue:sender:` : 새로운 VC가 생성된 다음, 전달할 data에 대한 control이 필요할 때
	
	##### iii. Unwind Segue
		
	- 방법1: 되돌아갈 VC에 `@IBAction func a(b:UIStoryboardSegue) {}` 를 코딩 -> storyboard에서 되돌아갈 버튼과 해당 View의 Exit을 연결 -> 되돌아갈 함수 선택
	
	- 방법2: Manual 
	
		> unwind는 말 그대로 *되돌아가는* 개념이기 때문에 A에서부터 온 B가 사라진 후(exit하며) A를 다시 부르는 것이다. 따라서 A로 부터 온 B가 C를 호출한다고 해도 무시당한다(아무런 반응없음)
		
### 2. Container ViewController

- RootView를 가지고 있지 않다.
- VC를 Sub VC로 가지고 있다

#### 1) NavigationController

- Stack 구조를 가진다.
	- 스택: 가장 나중에 입력한 데이터를 맨 먼저 찾을 수 있도록 한 데이터 구조. *편의점 우유현상* (cf.큐: 선입선출)
- present modally에서는, 이동하거나 dismiss되는 주체가 나자신(self) 였지만, navigation controller는 **부모가 주체**가 되어 부모(navigation controller)에 부탁하는 형태이다. 따라서 navigation controller에 연결되어 있지 않은 놈이 이것을 부른다면 당연히 값은 nil 이 된다.

	