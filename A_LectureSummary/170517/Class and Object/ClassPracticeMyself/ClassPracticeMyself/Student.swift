//
//  Student.swift
//  ClassPracticeMyself
//
//  Created by Bo-Young PARK on 17/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

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
