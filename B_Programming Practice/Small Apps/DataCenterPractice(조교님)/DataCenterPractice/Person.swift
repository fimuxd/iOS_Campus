//
//  Person.swift
//  DataCenterPractice
//
//  Created by 박종찬 on 2017. 6. 30..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import Foundation

struct Person {
    let id: Int
    let name: String
    let gender: Gender
    var age: Int
    var phoneNumber: String
    
    var dictionary: [String:Any] {
        get {
            return ["person_id":id, "name":name, "gender":gender.rawValue, "age":age, "phone_number":phoneNumber]
        }
    }
    
    init(with dictionary:[String:Any]) {
        self.id = dictionary["person_id"] as! Int
        self.name = dictionary["name"] as! String
        self.gender = Gender.init(rawValue: dictionary["gender"] as! Int)!
        self.age = dictionary["age"] as! Int
        self.phoneNumber = dictionary["phone_number"] as! String
    }
    
}


enum Gender: Int {
    case woman = 0
    case man = 1
}
