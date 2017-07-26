//
//  DataCenter.swift
//  firebasePractice_Instagram
//
//  Created by Bo-Young PARK on 26/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation
import Firebase

class DataCenter {
    static let sharedData = DataCenter()
    
    var isLogin:Bool = false
    var userData:User?
    
    func requestIsLogin() -> Bool {
        if Auth.auth().currentUser == nil {
            isLogin = false
            return false
        }else{
            isLogin = true
            return true
            
        }
    }
    
    func requestUserData(completion:@escaping (_ info:User) -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        Database.database().reference().child(uid).observeSingleEvent(of: .value, with: { (snapShot) in
        
            let dic = snapShot.value as! [String:Any]
//            self.userData = User(data: dic)
            
            completion(User(data:dic))
        })
        
    }
    
}



struct User {
    var userName:String?
    var userProfileImgUrl:String?
    var email:String?
    
    //["email":self.emailTextField.text!, "userName":self.userNameTextField.text!, "profileImage":urlStr]
    init(data:[String:Any]) {
        userName = data["userName"] as! String ?? ""
        userProfileImgUrl = data["profileImage"] as! String ?? ""
        email = Auth.auth().currentUser?.email
    }
}
