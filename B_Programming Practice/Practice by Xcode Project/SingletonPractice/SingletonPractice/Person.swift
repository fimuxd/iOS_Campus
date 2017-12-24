//
//  Person.swift
//  SingletonPractice
//
//  Created by Bo-Young PARK on 30/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

struct Person {
    let id:Int
    let email:String
    let password:String
    let name:String
    let gender:Gender
    var age:Int
    var phoneNumber:String
    
    var dictionary:[String:Any] {
        get {
            return ["person_id":id, "email":email, "password":password, "name":name, "gender":gender.rawValue, "age":age, "phone_number":phoneNumber]
        }
    }
    
    
    //Struct는 Class와 달리 init을 해주지 않아도 자동적으로 생성된다.
    //하지만 이렇게 custom init을 할 경우, 반드시 memberwise init을 해주어야 한다.
    init(withDicationary dictionary:[String:Any]) {
        self.id = dictionary["person_id"] as! Int
        self.email = dictionary["email"] as! String
        self.password = dictionary["password"] as! String
        self.name = dictionary["name"] as! String
        self.gender = Gender.init(rawValue: dictionary["gender"] as! Int)!
        self.age = dictionary["age"] as! Int
        self.phoneNumber = dictionary["phone_number"] as! String
    }
}

//struct DataKey {
//    static let personIDKey:String = "person_id"
//    static let nameKey:String = "name"
//    static let genderKey:String = "gender"
//    static let ageKey:String = "age"
//    static let phoneNumberKey:String = "phone_number"
//    
//}

enum Gender:Int {
    case woman = 0
    case man = 1
}
