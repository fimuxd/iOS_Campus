//
//  ScoreManager.swift
//  ScoreCalculator
//
//  Created by Bo-Young PARK on 17/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

class ScoreManager {
    
    //학생을 받아 그 학생의 점수의 평균을 내주는 함수
    func average(forStudent student:Student) -> Double {
        
        var returnAverage:Double = 0.0
        
        if let subjects = student.subjects {
            
            var total:Int = 0
            
            for subject in subjects {
                total += subject.score
            }
        
            returnAverage = Double(total) / Double(subjects.count)
        }
        
        return returnAverage
    }
}
