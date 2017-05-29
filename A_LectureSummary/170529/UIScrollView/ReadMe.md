# UIScrollView


- ScrollView는 delegate를 사용한다.
- 하지만 더 큰 문제는, AutoLayout의 룰을 이해하지 못하면 구현이 어렵다.

## A. 기본 구조

- 가장 눈여겨 볼 부분: *다른 view와 달리* Contents View 가 존재한다.
- contents view(내부동작에서 작동하는 전체 view)는 실화면보다 항상 커야 한다.
- story board에서는 contents view의 사이즈를 지정할 수 없기 때문에, contents view위에 또다른 view를 올린 후, 그 view를 contents view라 여기고 작업을 해야 한다.
- bounce는 컨텐츠뷰와 스크롤뷰의 사이즈 차이에 따라 자동적으로 들어간다.


## B. UIScrollView 기능 보기

- command + click
- *추가로 계속 공부할 것*

	```swift
	//여기서 self. 는 생략할 수 있지만 있단 개념 이해를 위해 써두기로 한다.
	        let scrollView:UIScrollView = UIScrollView(frame: self.view.bounds)
	        
	        //viewControl
	        scrollView.contentSize = CGSize(width: self.view.bounds.width * 3, 
	        height: self.view.bounds.height)
	        self.view.addSubview(scrollView)
	        
	        //페이지 단위별로 끊어지게 하는 명령 (50% 이하로 넘어가면 원래 페이지, 50% 이상 넘어가면 다음 페이지로 보여주는 것)
	        scrollView.isPagingEnabled = true
	        
	        //시작하는 포인트
	        scrollView.contentOffset = .init(x: 0, y: 0)
	        
	        //위,아래,좌,우에 여백을 두는 것
	        scrollView.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
	        
	        //스크롤뷰 외 여백을 아예 차단하는 명령
	        //scrollView.bounces = false
	        
	        //가로로 움직일 때마다 스크롤뷰 인디케이터를 표시해주는 명령
	        scrollView.showsHorizontalScrollIndicator = true
	        
	        //인디케이터의 색상을 변경하는 것
	        scrollView.indicatorStyle = .black
	        
	        
	        
	        
	        //상기에 만든 ScrollView를 확인하기 위한 View를 만들어보자. 하단의 UIColor도 타입 추론을 통해 생략할 수 있다.
	        let view1:UIView = UIView(frame: CGRect(x: 0, y: 0, width: scrollView.bounds.size.width, 
	        height: scrollView.bounds.size.height))
	        view1.backgroundColor = UIColor.yellow
	        //contentsView에 추가해야 하는데, contentsView는 선택할 수 없다. 따라서 상위에 있는 scrollview에 바로 addSubview를 한다.
	        scrollView.addSubview(view1)
	        
	        
	        let view2:UIView = UIView(frame: CGRect(x: self.view.bounds.size.width, y: 0, width: scrollView.bounds.size.width, 
	        height: scrollView.bounds.size.height))
	        view2.backgroundColor = UIColor.red
	        scrollView.addSubview(view2)
	        
	        let view3:UIView = UIView(frame: CGRect(x: self.view.bounds.size.width * 2, y: 0, width: scrollView.bounds.size.width, 
	        height: scrollView.bounds.size.height))
	        view3.backgroundColor = UIColor.blue
	        scrollView.addSubview(view3)
	```

실행하면, 다음과 같다.

![실행이미지](https://github.com/fimuxd/iOS_Campus/blob/master/A_LectureSummary/170529/UIScrollView/UIScrollView.gif?raw=true)

