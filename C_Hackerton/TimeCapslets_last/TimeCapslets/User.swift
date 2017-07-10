
//
//  User.swift
//  TimeCapslets
//
//  Created by 샤인 on 2017. 7. 6..
//  Copyright © 2017년 IosCamp. All rights reserved.
//

import Foundation


struct User {
    let userEmail:String
    let userPassword:String
    let userId:Int
    var userData:[Capsule]
    
    
    var dictionary:[String:Any]{
        get{
            
            var tempData:[[String:Any]] = []
            
            
            for capsule in userData{
                tempData.append(capsule.dictionary)
            }
            
            
            return[Authentification.plistEmail:userEmail,Authentification.plistPassword:userPassword,Authentification.plistId:userId,Authentification.plistUserData:tempData]
        }
    }
    
    
    init(dictionary:[String:Any]) {
        self.userEmail = dictionary[Authentification.plistEmail] as! String
        self.userPassword = dictionary[Authentification.plistPassword] as! String
        self.userId = dictionary[Authentification.plistId] as! Int
        self.userData = [] //펄슨데이터가 하나씩 채워진다?
    
    
        
        if let container:[[String:Any]] = dictionary[Authentification.plistUserData] as? [[String:Any]] {
            for personData in container{
                userData.append(Capsule.init(data: personData))
            }
        }
    }
    
    
    
}

struct Capsule {
    let capsuleMemo:String
    let capsuleImg:String
    let capslueDate:Int
    
    var dictionary: [String:Any]{
        return [Authentification.plistCapsuleMemo:capsuleMemo,Authentification.plistCapsuleImg:capsuleImg,Authentification.plistCapsuleDate:capslueDate]
    }
    
    init(data:[String:Any]){
        self.capsuleMemo = data[Authentification.plistCapsuleMemo] as! String
        self.capsuleImg = data[Authentification.plistCapsuleImg] as! String
        self.capslueDate = data[Authentification.plistCapsuleDate] as! Int
        
    }
}
