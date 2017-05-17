//
//  Calculation.swift
//  ClassPracticeMyself
//
//  Created by Bo-Young PARK on 17/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

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
