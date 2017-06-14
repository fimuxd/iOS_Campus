//
//  Constants.swift
//  LogInAndSignUpPractice
//
//  Created by Bo-Young PARK on 31/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//


/************************************************************************/
//  오타로 인해 오류가 나는 것을 방지하기 위해 key 값 등을 다로 설정해 놓은 struct 입니다  //
/************************************************************************/

import Foundation

struct Authentification {
    static let email = "Email"
    static let password = "Password"
    static let name = "Name"
    static let authentificationBool = "Authentification"
}


/************************************************************************/
//          상황에 따른 Alert 메세지를 enum을 응용하여 설정해놓았습니다.              //
/************************************************************************/

enum AlertSetting {
    case logOutAtMainVC
    case logInAtLogInVC
    case signUnAtSignUpVC
}

