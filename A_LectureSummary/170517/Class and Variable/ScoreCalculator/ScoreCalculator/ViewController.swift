//
//  ViewController.swift
//  ScoreCalculator
//
//  Created by Bo-Young PARK on 17/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let s1:Student = Student(name: "박보영")
        s1.add(SubjectName: "iOS", score: 100)
        s1.add(SubjectName: "Android", score: 0)
        s1.add(SubjectName: "Coding", score: 50)
        s1.add(SubjectName: "Typing", score: 60)
        
        
        let s2:Student = Student(name: "조희수")
        s2.add(SubjectName: "iOS", score: 100)
        s2.add(SubjectName: "Android", score: 100)
        s2.add(SubjectName: "Coding", score: 60)
        s2.add(SubjectName: "Typing", score: 90)
    
        let manager:ScoreManager = ScoreManager()
        let s1Average = manager.average(forStudent: s1)
        let s2Average = manager.average(forStudent: s2)
        
        print(s1Average)
        print(s2Average)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

