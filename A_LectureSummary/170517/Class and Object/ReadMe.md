# Class & Object

## A. 기본개념

### 1. 클래스 (Class)

- 클래스 내부에서 쓰이는 변수는 property(속성)
- 함수 내부에서 쓰이는 변수는 변수
- 클래스는 객체의 속성과 행위를 정의해놓았다
- 클래스에는 property(변수)와 method(함수)가 있다

	```swift
	//Person 이라는 class 생성
	class Person {
		var personName:String = ""
			//Person이라는 클래스는 personName이라는 String 타입의 property를 가진다. 
		
		func moving(status:String) -> String {
			print("(\status) 하고 있습니다")
		}
			//Person이라는 클래스는 moving이라는 method를 가진다.
	```


### 2. 객체 (Object)

- 객체는 속성을 가지고 있다
- 클래스에는 프로퍼티(변수)와 메소드(함수)가 있다

## B. Class의 구조

### 1. Property

- Class에서 명명되는 가장 기본이 되는 변수형태의 명명

	```swift
	//MacBook이라는 class는 screenSize, caseColor, iOSVersion이라는 property를 갖는다.
	class MacBook {
		var screenSize:Int = 13
		var caseColor:String = "Space Grey"
		var iOSVersion:String = "Sierra"
	}
	```

### 2. Object 만들기

- Instance: 초기함수를 통해 실질적인 데이터를 갖게 된다
- Instance를 가지는 Variable을 Object라 한다.

	#### 1) 초기함수: `Class명()` 형태
	
	- init: 가장 기본적인 형태의 초기함수 `init()`
	- Custom Init: init에 parameter를 추가해서 cumstom 화
	
	#### 2) self
	
	- Object에 있는 함수나 속성을 쓰려면 `.`문법을 쓴다.
		- 예. `myHat.color = "흰색"`: myHat이라는 객체가 가진 color라는 속성 값을 불러낸 것
	- self란, Instance 자기자신을 의미한다.
	- Property만 self가 될 수 있다.
	
		
		```swift
		class Ring {
			
			// init으로 초기화할 경우 property 값이 nil이라도 optional이 필요없다.
			
			var material:String
			var thickness:UInt
			var color:String?
			
		
			// 기본적인 형태의 초기화: 나중에 Ring Class를 type으로 하는 객체가 생성되면, 
			// 기본값인 Silver와 15가 자동으로 부여된다
			init() {
				material = "Silver"
				thickness = 15
		
			// Custom Init: 나중에 객체가 생성되면,
			// 기본값으로 color와 size를 객체별로 설정할 수 있다.
			init(material:String, thickness:UInt) {
			self.color = color
			self.size = size
			}
		}
		``` 

## C. 실습: 학점계산기

### 1. 개념

- 학생(Student)이 있고 학생이 각 과목(Subject)에 대해 받은 점수에 대한 계산 값(Calculation)이 나오는 것
- 여기서 세가지 class를 도출할 수 있다.
	- Subject Class: 과목점수(score) 변수가 있다.
	- Student Class: 수업(lecture) 목록(array)가 있다.
	- Calculation Class: Subject와 Student Class를 속성으로 갖는 객체를 이용해 계산하는 함수를 가진다.

### 2. 실습

#### Step1) Subject Class

```Swift
class Subject {
    //Subject(과목)이 가지는 것이 뭘까?
    //1. 과목은 nameOfSubject(과목 이름)이 있어.
    let nameOfSubject:String
    
    //2. scoreOfSubject(과목에 부여되는 점수)가 있어.
    var scoreOfSubject:UInt
    
    //3. 각 값은 이후에 객체별로 custom할 수 있게 초기화하자
    init(nameOfSubject:String, scoreOfSubject:UInt) {
        self.nameOfSubject = nameOfSubject
        self.scoreOfSubject = scoreOfSubject
        
    }
}
```

#### Step2) Student Class

```swift
class Student {
    //Student(학생)가 가질 수 있는건 뭘까?
    //1. 학생은 nameOfStudent(학생이름)이 있어
    var nameOfStudent:String
    
    //2. 학생이 듣는 수업들(lectures)이 있고,
    //   이 수업은 Subject(과목) Class가 갖는 속성을 그대로 가지게 돼.
    //   이러한 Subject Class의 속성을 갖는 Array로 하자
    //   그런데 학생이 수업을 안들었을 수도 있으니까 nil 값이 나올 수 있으니 optional 설정하자
    var lectures:[Subject]?
    
    //3. 학생은 과목에 따르는 점수(score)를 평균(average)한 학점을 가지게 돼
    //   이 것도 역시, 수업을 듣지 않았다면 점수도 없고 nil 값이 나올 수 있으니 optional 설정하자
    var averageOfScore:Double?
    
    //4. optional한 property를 제외한 학생이름에 대해 초기화를 해주자.
    //   나중에 Student Class를 불러오는 객체를 만들 때, 객체별로 학생 name(이름)을 부여할 수 있을거야
    init(nameOfStudent:String) {
        self.nameOfStudent = nameOfStudent
    }
    
    //5. Student Class(학생)이 가지는 수강과목목록(#2 lectures Array)을 만들자.
    //   각 과목들은 score를 부여받은 상태일거야
    //   그런데 수강과목도 점수도 nil이 발생할 수 있었잖아? (아무 수업도 안들은 학생이 있다면)
    //   그러니까 nil을 걸러내는 작업을 한 뒤, Array에 넣어주자
    
    func makeLecture(name:String, score:UInt) {
        if lectures == nil {
            lectures = []
        }
        
        // 6. Subject Class로 이루어진 lectures Array가 nil이 아니라면
        //    lecture라는 상수를 선언하자. lecture는 Subject Class 성격을 가지고
        //    초기값은 Subject Clsss인데, 이름은 makeLecture 함수가 가지는 name 이라는 parameter를 가져오자
        //    점수도 makeLecture 함수가 가지는 score 라는 parameter를 가져오자
        //    결국 이 parameter들과 함수가 의미하는 것 > 나중에 Student Class를 가지는 객체가 생겼을 때
        //    각 학생 개체가 수강한 과목명과 부여받은 점수를 가지는 목록을 각각 가지도록 하는 것
        
        let lecture:Subject = Subject(nameOfSubject: name, scoreOfSubject: score)
        lectures!.append(lecture)
        
    }
}
```

#### Step3) Calculation Class

```swift
class Calculation {
    
    // 각 학생을 받아 그 학생의 점수의 평균을 내주는 함수를 만들어 보자
    // 1. 학생이 과목당 받은 점수를 모두 더해서 평균을 내는 함수를 만들자. 
    //    결과 값이 Double이 될 수 있으므로, 반환값은 Double로 한다
    func calculateAverageForStudent(student:Student) -> Double {
        
        // 2. 반환값으로 나올 평균값 변수를 지정한다.
        var returnAverage:Double = 0.0
        
        // 3. nil값 회피- Optional Unwrapping
        if let lectures:[Subject] = student.lectures {
            
            // 4. 모든 과목당 받은 점수를 더한 값을 의미하는 total 변수 지정
            var total:UInt = 0
            
            // 5. 각 점수를 모두 더하는 for-in 구문
            for lecture in lectures {
                total += lecture.scoreOfSubject
            }
            
            // 6. 반환값인 평균값은 상기의 total / 과목의 개수 인데, 각 값은 UInt이므로 Double로 캐스팅
            returnAverage = Double(total) / Double(lectures.count)
        }
        
        return returnAverage
    }
}
```

#### Step4) ViewController에 구현

```swift
//만들어놓은 각각의 Class의 속성을 가지는 구체화한 객체를 만들어보자.
        //객체(Object) 만들기에 필요한 요소 -> Instance: 초기화를 통한 실질적인 데이터
        //평균을 내려는 주체는 뭐지? -> 특정한 학생 객체
        
        // 1. 박보영 학생을 만들어보자
        let student1:Student = Student(nameOfStudent: "박보영")
        
        // 2. 박보영 학생이 수강한 과목과 그 과목에서 받은 점수에 대한 Instance를 부여하자
        //    How? -> Student Class 안에 있는 method를 호출해서!
        student1.makeLecture(name: "iOS Development", score: 100)
        student1.makeLecture(name: "Android Development", score: 0)
        student1.makeLecture(name: "English", score: 80)
        student1.makeLecture(name: "CV Writing", score: 90)
        
        // 3. 박보영 학생이 받은 점수들에 대해서, 평균값을 계산해보자
        //    How? -> Calculation Class 속성을 갖는 상수를 선언해서!(feat.몬말?)
        let calculator:Calculation = Calculation()
        student1.averageOfScore = calculator.calculateAverageForStudent(student: student1)
        
        print(student1.averageOfScore!)
            //print값: 67.5
        
    }
```

> [학점계산기 proj Xcode 바로가기]()