//
//  Subject.swift
//  ClassPracticeMyself
//
//  Created by Bo-Young PARK on 17/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

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
