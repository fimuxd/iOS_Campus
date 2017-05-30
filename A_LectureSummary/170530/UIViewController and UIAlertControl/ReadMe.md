#UIViewController

## A. 기본 개념

![image](MVC Model.tiff)

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


### 2. Container View

