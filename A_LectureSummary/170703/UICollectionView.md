## 조교님 tip

- TableView와 CollectionView는 사촌지간
- TableView에서 cell만 nib 파일로 빼서 사용하는 방식이 있다.
- 참고할 것 -> [여기서](https://github.com/fimuxd/iOS_Campus/tree/master/B_Programming%20Practice/Practice%20by%20Xcode%20Project/TableViewNibPractice)

# UICollectionView

## A. 구성

***

- Cell
- Decoration View
- Supplementary View

***

- 칸 하나하나를 Cell
- Decoration View: 그냥 View. 데코하는 아이 ~강사님도 쓰임이 정확히 뭔지 모르심~
- Supplementary View: Header와 Footer를 가지는 View (TableView에서 Section같은)

## B. 개념
***

- 데이터 항목의 정렬 된 컬렉션을 관리하고 사용자 정의 레이아웃을 사용하여 데이터 항목을 제공하는 객체입니다.

- The classes and protocols for implementing collection views
	- Manager
		-	UICollectionView
		-	UICollectionViewController
	- Protocol
		- UICollectionViewDataSource		- UICollectionViewDelegate	- Presentation		- UICollectionReusableView		- UICollectionViewCell
	- **Layout** : 가장 특징적이다.		- UICollectionViewLayout		- UICollectionViewLayoutAttributes		- UICollectionViewUpdateItem	- Flow Layout: 기본 Layout		- UICollectionViewFlowLayout		- UICollectionViewDelegateFlowLayout

***

- 기본적으로 Flow Layout 형태로 배치는 해준다.

### 1. SectionLayout

- Section Header / Cells / SectionFooter 로 구성
- Cell Spacing, Line Spacing, Section Inset을 설정할 수 있다.

### 2. FlowLayout	

- Vertical과 Horizon이라는 방향성을 가진다.
	- Vertical: 왼쪽에서 오른쪽으로 쌓이다가 꽉차면 왼쪽아래로 와서 다시 오른쪽으로 쌓인다
	- Horizon: 위에서 아래로 쌓이다가 꽉차면 오른쪽위로 와서 다시 아래로 쌓인다

#### Flow Layout Attributes 정의

- UICollectionViewDelegateFlowLayout protocol 이용- UICollectionViewDelegate가 정의된 인스턴스에서 작성
- UICollectionViewDelegate를 상속받았기 때문에, UICollectionViewDeleage를 받으면 확장개념으로 쓸 수 있다.

	```swift
	func collectionView(_ collectionView: UICollectionView, layoutcollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize	func collectionView(_ collectionView: UICollectionView, layoutcollectionViewLayout: UICollectionViewLayout,minimumInteritemSpacingForSectionAt section: Int) -> CGFloat 
		func collectionView(_ collectionView: UICollectionView, layoutcollectionViewLayout: UICollectionViewLayout,minimumLineSpacingForSectionAt section: Int) -> CGFloat	func collectionView(_ collectionView: UICollectionView, layoutcollectionViewLayout: UICollectionViewLayout, insetForSectionAtsection: Int) -> UIEdgeInsets
	```

- 물론 Storyboard에서 설정 가능하다. 
- ItemSize: indextPath에 따라서 각각 다른 Size를 설정할 수 있고, 기준은 가장 큰 size다.
- MinimumSpacing: 실제 간격과 최소 간격이 있다. 최소간격만 두면, 최소 간격만 보장한다면 그 이상의 간격이 되어도 괜찮은 것. *이것보단 넓어야 한다* 라는 의미

## C. Protocol

### 1. UICollectionViewDataSource

```swift

public func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Intpublic func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCelloptional public func numberOfSections(in collectionView: UICollectionView)-> Int

```

### 2. UICollectionViewDelegate

```swift
optional public func collectionView(_ collectionView: UICollectionView,shouldHighlightItemAt indexPath: IndexPath) -> Booloptional public func collectionView(_ collectionView: UICollectionView,didHighlightItemAt indexPath: IndexPath)optional public func collectionView(_ collectionView: UICollectionView,didUnhighlightItemAt indexPath: IndexPath)optional public func collectionView(_ collectionView: UICollectionView,shouldSelectItemAt indexPath: IndexPath) -> Booloptional public func collectionView(_ collectionView: UICollectionView,shouldDeselectItemAt indexPath: IndexPath) -> Bool // called when the usertaps on an already-selected item in multi-select modeoptional public func collectionView(_ collectionView: UICollectionView,didSelectItemAt indexPath: IndexPath)optional public func collectionView(_ collectionView: UICollectionView,didDeselectItemAt indexPath: IndexPath)
```

- Select View의 Cell을 눌렀을 때, 눌러졌다는(selected) 느낌이 없다. 따라서 그 부분에 대해 설정을 해줘야 한다.


## D. 예제

### 1. Multy-Selection

```swift
override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
// 이 아이가 실행되게 하려면, viewDidLoad()에서 하기를 true로 반드시 줘야 부를 수 있다.
self.collectionView?.allowsMultipleSelection = true

```

### 2. 삽입, 삭제, 이동

```swift
func performBatchUpdates(_ updates: (() -> Swift.Void)?, completion: ((Bool) ->Swift.Void)? = nil)
```

- performBatchUpdates메소드의 update클로져를 사용해서 Section이나 Item의 업데이트 행동을 실행.- 두가지 스텝을 필수로 진행해야한다.	1. 데이터를 업데이트	2. CollectionView의 해당 메소드를 호출하여 UI업데이트

### 3. Delete 예제

```swift
func deleteSelectedItem() {	self.collectionView?.performBatchUpdates({		if let selectedItem = self.collectionView?.indexPathsForSelectedItems		{			//데이터 소스에서 항목 삭제			//뷰에서 제거			self.collectionView?.deleteItems(at: selectedItem!)		}	}, completion: { (isSuccess) in		//완료후 행동	})}
```
