# Data Saving

 - pList
 - notification
 
## 1. pList | Property List
 
### A. 기본 구성
 
```
* 심플한 "파일" 저장 방법 중 하나
* Key, Value 구조로 데이터 저장
* File 형태로 저장되다 보니 외부에서 Access가능(보안에 취약)
```
 
 - key, type, value 세가지로 구성되어 있다.
 - dictionary 안에 array가 있다.
 - userDefault를 사용하면 기본적으로 pList가 생성된다.

### B. 파일 위치

- Bundle 과 Documents 라는 두 폴더 가 있다.
	
	#### 1) Bundle
	
	- 프로젝트에 추가된 모든 Resource가 모인 곳.
	- Bundle의 내용은 project를 통해 확인할 수 있다. 
	- 프로젝트 처음 셋팅할 때 이미지들이 저장되는 장소. 
	- 파일을 집어넣는 것은 번들에 저장 
	- project 처음 설정할 때
	- 처음 앱의 용량에 관련된건 bundle에 저장
	
	#### 2) Documents
	
	- Documents: 앱이 만들어지고 생성이 되면 만들어지는 폴더. 
	- xCode내에서 확인이 불가하다. 
	- 코드를 통해서 구현에 대한 내용을 입력할 뿐이지, 직접적으로 xCode를 통해 쉽게 접근할 수는 없다. 
	- 앱을 구동하면서 나오는 데이터를 저장하고 write/read를 해야하는 건 documents에 저장된다.
	- 앱 running 중 
	- 앱을 사용하면서 용량이 늘어나는 건 documents

> Summary: plist파일의 데이터만 불러오는 역할은 Bundle을 통해서, plist파일에 데이터를 쓰고 불러오는 역할은 Documents폴더에 저장된 파일로!
###### **-> 무슨 뜻이냐**: pList를 만드는 것을 이해해야 한다. pList를 만드는데는 두가지 방법이 있다. XML코드로 만드는 어려운 방법과 xCode를 활용해서 newfile로 Property List를 만드는 방법. 여기서, 파일을 직접 만드는건 (어려운건)Documets에서 하는 것이고 쉬운건 Bundle에서 하는 것. 문제는, Bundel에 있는 데이터는 쓰기를 할 수 없다. default 형태인 것 (읽기전용) Documents는 계속 앱을 사용하면서 쓰고 읽고를 반복하는 것이다. 파일을 직접 만드는 것은 어렵기 때문에, 편의상, Bundle처럼 빈 파일을 만들고 복사해서 쓰는 방법을 많이 쓴다.

### C. Bundle

#### 1) 기본 개념

```
실행코드, 이미지, 사운드, nib 파일, 프레임 워크,설정파일 등 
코드와 리소스가 모여있는 file system내의 Directory
```

#### 2) Bundle Instance

- Bundle은 Singleton 이다.

	```swift
	//1. 메인번들 가져오기
	let mainBundle = Bundle.main 
	
	//2. 해당 리소스의 위치와 타입을 적으면 Bundle이라는 instance가 path를 지정해준다.
	
	let filePath = mainBundle.path(forResource: "rName", ofType: "rType") 
	
	//3. path는 위치다. 그 위치의 데이터를 가지고 인스턴스를 만들어야지만, 그 인스턴스를 가지고 앱에서 사용할 수가 있다. 여기서 filePath는 파일이 없으면 nil값이므로 옵셔널 바인딩을 통해서 확인해준다. 
	if let path = filePath {
		let image = UIImage(contentsOfFile: filePath!)
	} //그런데 array나 dictionary에는 contentsOfFile이 없다. 따라서 해결 방법은 다음과 같다. 
	
	// NSDictionary를 이용한 뒤 다운캐스팅하는 방법
	if let filePaht = mainBundle.path(forResource: "rName", ofType: "rType"),let dict = NSDictionary(contentsOfFile: filePaht) as? [String: AnyObject] {	// use swift dictionary as normal}
	```

- `FrendsList` 라는 pList를 만들었다고 가정하고 이 리스트를 불러오려면,

	```swift
	 override func viewDidLoad() {
	 	super.viewDidLoad()
	        
		if let realPath = Bundle.main.path(forResource: "FriendsList", ofType: "plist"),
			let dic = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject]
			//추후 swift4에서는 이렇게 되지 않을까 예상합니다. let dic = Dictionary(contextsOfFile: "realPath")
		{
			print(dic["list"])
		}else{
	       // 파일이 존재하지 않습니다.
	   }
	        
	}
	```
	
- AnyObject와 Any의 차이: Class를 통해 만들어진 Instance가 Object(객체)다.
	- Any: Object 또는 Struct를 통한 Instance등 모든 Instance
	- AnyObject: Instance 중 Object만 

### D. Document

#### 1) Document에서 파일 가져오기

```
1. Document folder Path 찾기2. Document folder에 plist 파일이 있는지 확인	• 만약 없다면 : bundle에 있는 파일 Document에 복사3. Path를 통해 객체로 변환, 데이터 불러오기4. writeToFile 메소드로 파일 저장
```

- Document는 읽기/쓰기가 가능해야 한다. path를 가져오고 path를 통해서 읽는데, 쓸 때 파일이 없다면 Bundle에서 파일을 복사해서 가져온 뒤, 그 곳에 써야한다.
- 쓰기를 할 때 NSDictionary로 써서 보내야 한다.

#### 2) Document Instance

- Bundle과 거의 유사하다

	```swift
	//1. 이 건 외울 것. NSSearchPath 자동완성을 이용할 것
	let path:[String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,true)	let basePath = path[0] + "/fileName.plist"
	
	//2. Document 폴더에 파일이 있는지 확인
	//FileManager 도 Singleton 이다.
	if !FileManager.default.fileExists(atPath: basePath) {
		//여기는 파일이 없을 때 실행할 공간
		//3. 만약에 파일이 없다면, Bundle에 있는 파일을 복사
		if let fileUrl = Bundle.main.path(forResource: "fileName", ofType: "plist") {			do {				try FileManager.default.copyItem(atPath: fileUrl, toPath: basePath)			} catch {				print("fail")			}		}	}

	//만약 Bundle에도 파일이 없다면 어떠한 행동을 하라는 error 처리를 해주어야 할 것
		//4. Dictionary Instance 불러오기
		if let dict = NSDictionary(contentsOfFile: basePath) as? [String: AnyObject] {	// use swift dictionary as normal	}
	
	//5. write(쓰기) 작업을 하려면,
	if let dict = NSDictionary(contentsOfFile: basePath) as? [String: Any] {		var loadData = dict		loadData.updateValue("addData", forKey: "key")		let nsDic:NSDictionary = NSDictionary(dictionary: loadData)	nsDic.write(toFile: basePath, atomically: true)	}
			```

- 상단 Bundle에서 만든 `FriendsList`를 이용하여 응용해보면,

	```swift
	
	func writeFile() {
		//1. Document File의 Path 설정
		let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
		let realPath = path[0] + "/FriendsList.plist"
	        
		//2. FileManger Singleton을 이용. Document 폴더에 파일이 있는지 확인
		let fileManager = FileManager.default
	        
		if !fileManager.fileExists(atPath: realPath) {
			if let bundlePath = Bundle.main.path(forResource: "FriendsList", ofType: "plist") {
				do {
					try fileManager.copyItem(atPath: bundlePath, toPath: realPath)
					} catch {
						return
					}
			} else {
				return
			}
		}
	        
		//3. Document Instance (Bundle과 동일하게 NSDictionary 이용)
		let dic = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject]
	        
	        
		//4. Saving 작업하는 것
		let nsDic = NSDictionary(dictionary: dic!)
		nsDic.write(toFile: realPath, atomically: true)
	}
		
	```
	
### E. Singleton 접목시키기

- 매번 이렇게 긴 코드를 만들어야 할까? 너무나 불편한 일
- Singleton으로 해결해보자
- 실제 파일에서 불러오고 저장하는 것을 매번 할 것이냐 또는 필요할 때만 할 것이냐 (load/save 시점 문제)

- 만들기 전 참고할 사항

	```swift
	/* UserDefaults 참고할 것
	 
	 open func object(forKey defaultName: String) -> Any?
	 open func set(_ value: Any?, forKey defaultName: String)
	 open func removeObject(forKey defaultName: String)
	 
	 */
	
	
	/* Document Folder 만들었던 것 참고할 것
	 
	 func writeFile() {
	 //1. Document File의 Path 설정
	 let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
	 let realPath = path[0] + "/FriendsList.plist"
	 
	 //2. FileManger Singleton을 이용. Document 폴더에 파일이 있는지 확인
	 let fileManager = FileManager.default
	 
	 if !fileManager.fileExists(atPath: realPath) {
	 if let bundlePath = Bundle.main.path(forResource: "FriendsList", ofType: "plist") {
	 do {
	 try fileManager.copyItem(atPath: bundlePath, toPath: realPath)
	 } catch {
	 return
	 }
	 } else {
	 return
	 }
	 }
	 
	 //3. Document Instance (Bundle과 동일하게 NSDictionary 이용)
	 let dic = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject]
	 
	 
	 //4. Saving 작업하는 것
	 let nsDic = NSDictionary(dictionary: dic!)
	 nsDic.write(toFile: realPath, atomically: true)
	 }
	 
	 */
	```
	
	```swift
	class FriendsData {
	    
	    private let fileName:String = "FriendsList"
	    private let fileType:String = "plist"
	    private static var instance:FriendsData = FriendsData()
	    private var friendsData:[String:Any]?
	    
	    //Singleton Instance 화
	    class var standard:FriendsData {
	        return instance     // getter지만 어차피 getter밖에 없으므로 표현을 생략함
	    }
	    
	    func object(forKey defaultName: String) -> Any? {
	        guard let data = friendsData else {
	            return nil
	        }
	        return data[defaultName]
	    }
	    
	    func set(_ value: Any?, forKey defaultName: String) {
	        guard let _ = friendsData, let realValue = value else {
	            return      //return이 없는데 왜 return 을 입력해야 하는지? : guard문의 목적자체가 구문 실행 조건에 부적합할 때 다음 구문을 실행시키지 말아야 하는 것이므로, return을 입력해주어야 하는 것이다. 하지만 전체 함수가 return을 받지 않으므로 return 뒤에 아무런 명령을 입력하지 않는 것이다.
	        }
	        friendsData![defaultName] = realValue
	    }
	    
	    open func removeObject(forKey defaultName: String) {
	        guard let _ = friendsData else {
	            return      //여기도 마찬가지
	        }
	        friendsData?.removeValue(forKey: defaultName)
	    }
	    
	    func friendsDataSave() {
	        save()
	    }
	    
	    init() {
	        load()
	    }
	    
	    deinit {
	        save()
	    }
	    
	    
	    //load
	    private func load() {
	         //1. Document File의 Path 설정
	        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
	        let realPath = path[0] + "/" + self.fileName + "." + self.fileType
	        
	        friendsData = NSDictionary(contentsOfFile: realPath) as? [String:Any]
	    
	    }
	    
	    //save
	    private func save() {
	        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
	        let realPath = path[0] + "/" + self.fileName + "." + self.fileType
	        
	        //2. FileManger Singleton을 이용. Document 폴더에 파일이 있는지 확인
	        let fileManager = FileManager.default
	        
	        if !fileManager.fileExists(atPath: realPath) {
	            if let bundlePath = Bundle.main.path(forResource: "FriendsList", ofType: "plist") {
	                do {
	                    try fileManager.copyItem(atPath: bundlePath, toPath: realPath)
	                } catch {
	                    return
	                }
	            } else {
	                return
	            }
	            
	            
	        }
	        
	        guard let _ = friendsData else {
	            return
	        }
	        
	        let nsDic = NSDictionary(dictionary: friendsData!)
	        nsDic.write(toFile: realPath, atomically: true)
	    }
	    
	}
	
	```