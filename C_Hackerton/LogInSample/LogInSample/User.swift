//
//  User.swift
//  LogInSample
//
//  Created by Bo-Young PARK on 5/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

struct User {
    let id:Int
    let email:String
    let name:String
    let password:String
    let phoneNumber:String
    
    var dictionary:[String:Any] {
        get{
            return ["user_ID":id,
                    "user_email":email,
                    "user_name":name,
                    "user_password":password,
                    "user_phoneNumber":phoneNumber]
        }
    }
    
    init(with dictionary:[String:Any]) {
        self.id = dictionary["user_ID"] as! Int
        self.email = dictionary["user_email"] as! String
        self.name = dictionary["user_name"] as! String
        self.password = dictionary["user_password"] as! String
        self.phoneNumber = dictionary["user_phoneNumber"] as! String
    }
    
}
