//
//  Constants.swift
//  LogInCoverPractice
//
//  Created by Bo-Young PARK on 20/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

/************************************************************************/
//  오타로 인해 오류가 나는 것을 방지하기 위해 key 값 등을 다로 설정해 놓은 struct 입니다  //
/************************************************************************/

import Foundation

struct Authentification {
    //-----UserDatas.plist
    static let id:String = "userData_identification"
    static let name:String = "userData_name"
    static let birthday:String = "userData_birthday"
    static let gender:String = "userData_gender"
    static let phoneNumber:String = "userData_phoneNumber"
    static let email:String = "userData_email"
    static let password:String = "userData_password"
    
    //-----plists
    static let userDatasFileName:String = "UserDatas"
    static let settingsFileName:String = "Settings"
    static let fileType:String = "plist"
    
    //-----Storyboard ID
    static let logInStoryboardID:String = "LogInStoryboard"
    static let signUpStoryboardID:String = "SignUpStoryboard"
    static let mainStoryboardID:String = "MainStoryboard"
    static let mainSettingStoryboardID:String = "MainSettingStoryboard"
    static let detailSettingStroyboardID:String = "DetailSettingStoryboard"
    static let findPasswordStoryboardID:String = "FindPasswordStoryboard"
    static let ResetPasswordStoryboardID:String = "ResetPasswordViewController"
    
    //-----Segue ID
    
    

    
}

