//
//  ContactModel.swift
//  RealmCarthagePractice
//
//  Created by 박종찬 on 2017. 7. 1..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class Contact: Object {
    
    ///'dynamic var'로 프로퍼티를 설정해 줍니다.
    dynamic var personID: Int = 0
    dynamic var name: String = ""
    dynamic var phoneNumeber: String = ""
    dynamic var birthDay: Date?
    
    ///새로운 PrimaryKey를 만들어 할당해 줍니다.
    func createNewPrimaryKey() {
        self.personID = UserDefaults.standard.integer(forKey: "primary_key") + 1
        UserDefaults.standard.set(self.personID, forKey: "primary_key")
    }
    
    ///Primary Key를 등록해 줍니다.
    override static func primaryKey() -> String? {
        return "personID"
    }
}

let realm: Realm = try! Realm() //전역상수 Realm

func addToRealm<T: Object>(_ item: T) {
    let realm: Realm = try! Realm() //다른 스레드 작동을 염두에 두고 새로 생성
    try! realm.write {
        realm.add(item)
    }
}

func removeFromRealm<T:Object>(_ item: T) {
    let realm: Realm = try! Realm() //다른 스레드 작동을 염두에 두고 새로 생성
    try! realm.write {
        realm.delete(item)
    }
}
