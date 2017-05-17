//
//  Student.swift
//  ScoreCalculator
//
//  Created by Bo-Young PARK on 17/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

class Student {
    
    var name:String
    var subjects:[Subject]?
    var average:Double?
    
    init(name:String) {
        self.name = name
    }
    
    func add(SubjectName:String, score:Int) {
        if subjects == nil {
            subjects = []
        }
        
        let sj:Subject = Subject(name: name, score: score)
        subjects?.append(sj)
        
    }
}
