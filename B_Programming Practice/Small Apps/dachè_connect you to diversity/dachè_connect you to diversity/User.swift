//
//  User.swift
//  dachè
//
//  Created by Bo-Young PARK on 10/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

struct User {
    
    let id:Int
    let name:String
    let birthday:Date
    let gender:Gender
    var phoneNumber:String
    var email:String
    var password:String
    
    var dictionary:[String:Any] {
        get{
            return [Authentification.id:id, Authentification.name:name, Authentification.birthday:birthday, Authentification.gender:gender, Authentification.phoneNumber:phoneNumber, Authentification.email:email, Authentification.password:password]
        }
    }
    
    init(with dictionary:[String:Any]) {
        self.id = dictionary[Authentification.id] as! Int
        self.name = dictionary[Authentification.name] as! String
        self.birthday = dictionary[Authentification.birthday] as! Date
        self.gender = Gender.init(rawValue: dictionary[Authentification.gender] as! String)!
        self.phoneNumber = dictionary[Authentification.phoneNumber] as! String
        self.email = dictionary[Authentification.email] as! String
        self.password = dictionary[Authentification.password] as! String
    }
}


enum Gender:String {
    case male = "Male"
    case female = "Female"
}
