# AutoLayOut

> ###### feat.너의 미적감각을 보여줘

- 레이아웃이라는 개념을 자동적으로 잡아주는 기능

## A. 개념

### 1. Frame-Based

- [과거 UI 수업자료](https://github.com/fimuxd/iOS_Campus/tree/master/A_LectureSummary/170522)
	- AutoLayout을 이해하려면, frame-based를 이해해야 한다.
	- 이렇게 만들었을 때, 위치가 고정되어 있으니, 디바이스의 화면크기가 바뀌었을 때 문제가 생겨버렸다.
	- AutoLayout은 iPhone5가 나오면서 같이 나왔다.

### 2. Auto LayOut

- 기존, 포인트를 기준으로 위치를 지정해주었던 방식에서, 기준의 시점(사고의 방식)을 다르게 한 것
- 가장자리에서 얼만큼 떨어져 있는지, 두 view 사이가 얼마나 떨어져 있는지를 설정하여 알려준다

## B. Constrait

### 1. 기본 구성

- 각 View의 거리, 길이, 위치 등을 표현하기 위한 제약

***
반드시 외워야할 공식(~이라기보단 개념~)

Item1.Attribute1 = multiplier * Item2.Attribute2 + constant	
***

- 공식의 각 부분을 아래와 같이 하나하나 뜯어보자


### 2. Attribute

#### 1) Size Attribute

- width: 실질적인 너비값
- height: 실질적인 높이값

#### 2) Location Attribute

- Leading/left: view의 x좌표 시작 위치
- Trailing/right: view의 좌표 종료 위치 
- Top: view의 y좌표 시작 위치
- Bottom: view의 y좌표 종료 위치
- Vertical: 수직선
- Horizontal: 수평선

### 3. Multiplier

- 각 view의 attribute 값들의 비율(ratio)을 설정하는 값
- 예. `SuperView.height = 1.5 * ImageView.height` -> ImageView의 높이는 SuperView의 1/3값을 갖는다.

### 4. Constant

- View간 간격을 유지하기 위한 속성

> **Note**
> 
> - Frame Based 를 생각해보자. 당시의 필요한 속성 값은 총 4개. (x좌표, y좌표, width, height)
> - AutoLayout이라고 다르지 않다. 저 값 중 하나라도 만족하지 않으면 컴퓨터는 해당 View를 구현할 수 없다. 입력한 값을 이해하지 못한다는 뜻
> AutoLayout에 익숙해 지려면, 직접 많이 해보는 수밖에 없다. 연습하고 또 연습하자!

###### 나머지 부분은 Xcode를 직접 구동해보면서 각 기능을 익히는 내용이므로, [강의 자료](https://github.com/fimuxd/iOS_Campus/blob/master/A_LectureSummary/170525/0525-26.pdf) 및 [실습 파일](https://github.com/fimuxd/iOS_Campus/tree/master/B_Programming%20Practice/Practice%20by%20Xcode%20Project/AutoLayout)을 참고 하자.
