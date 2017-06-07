# NavigationBar

- NavigationBar를 쓰더라도, NB전체 또는 들어가는 item을 custom 하게 설정하는 편이다.

# UITableView

###### TableView를 View의 꽃이라고 한다.
###### 이유는 DataSource와 Delegate를 너무나 잘 썼기 때문에

## A. 종류

### 1. Plain Table View

- list의 한 부분을 row라고 하고, row들의 모음이 section이다.
- ㄱ-ㅎ/A-Z -> index list라고 한다

### 2. Grouped Table Views
 
- 대표적인 것이 `setting` 앱

## B. DataSource

- `UITableViewDataSource` 연결해주어야 함

## C. Reusable

- UIView와 ID값이 같은 cell들을 queue의 형태로 재사용하는 것
	
	```swift
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) 
		\\여기서 dequeue: queue에서 꺼낸다는 것
		\\ReusableCell: 같은 UI형태의 cell을 재사용
		        
		cell.textLabel?.text = "\(indexPath.section+1) - \(indexPath.row+1)" 
		        
		return cell
	}
	```

	여기서 만약, storyboard 상에서 cell이 없는 상태라면, 아래와 같이 코드를 통해 생성할 수 있다. 


	```swift
	\\상기 코드에서 
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	
		var cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") \\여기까지 하면 cell의 값은 nil이다.
		
		if cell == nil {
			cell = UITableViewCell(style: .default, reuseIdentifier: "TableCell")
		
		\\만약 해당 cell에 필요한 UIView가 있다면(instance), if문 안에 넣어줘야 계속 반복되어서 생성되지 않는다. 
		}
		
		\\if문 바깥에서는 다음과 같이 cell의 data값만 변화시키는 함수들을 사용해야 한다.
		cell.textLabel?.text = "\(indexPath.section+1) - \(indexPath.row+1)"
	
	}
	```

- cellForRowAt 내에서는 instance를 생성하면 안된다. 끊임없이 재 생성되므로
	- 필요시, `if` 문을 통해서 제한을 두어야 한다.

