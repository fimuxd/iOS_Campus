//
//  ViewController.swift
//  ClassPracticeMyself
//
//  Created by Bo-Young PARK on 17/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

