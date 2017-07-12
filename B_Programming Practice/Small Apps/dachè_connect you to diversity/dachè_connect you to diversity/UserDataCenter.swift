//
//  UserDataCenter.swift
//  dachè
//
//  Created by Bo-Young PARK on 10/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

class UserDataCenter {
    
    static let shared:UserDataCenter = UserDataCenter()
    
    private var userDataArray:[User]!
    
    var userDataList:[User] {
        get{
            return userDataArray
        }
    }

    private let fileManager:FileManager = FileManager()
    private let docPath:String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! + "/UserDatas.plist"
    
    private init() {
        if fileManager.fileExists(atPath: docPath) {
            loadFromDoc()
        }else{
            loadFromBundle()
        }
    }
    
    private func loadFromBundle() {
        let bundlePath:String = Bundle.main.path(forResource: Authentification.userDatasFileName, ofType: Authentification.fileType)!
        if let loadedArray = NSArray.init(contentsOfFile: bundlePath) as? [[String:Any]] {
            parseUsers(loadedArray)
        }
        try? fileManager.copyItem(atPath: bundlePath, toPath: docPath)
    }
    
    private func loadFromDoc() {
        if let loadedArray = NSArray.init(contentsOfFile: docPath) as? [[String:Any]] {
            parseUsers(loadedArray)
        }
    }
    
    private func parseUsers(_ array:[[String:Any]]) {
        self.userDataArray = array.map({ (dictionary:[String:Any]) -> User in
            return User.init(with: dictionary)
        })
    }
    
    private func saveToDoc() {
        let nsArray:NSArray = NSArray.init(array:self.userDataArray.map({ (user:User) -> [String:Any] in
            return user.dictionary
        }))
        nsArray.write(toFile: docPath, atomically: true)
    }
    
    func addUserData(_ dic:[String:Any]) {
        self.userDataArray.append(User.init(with: dic))
        self.saveToDoc()
    }
    
    func modifyUserData(id:Int, keyOfDatas:String, to:String) {
        var user = self.userDataArray[id]
        
        switch keyOfDatas {
        case Authentification.phoneNumber:
            user.phoneNumber = to
        case Authentification.email:
            user.email = to
        case Authentification.password:
            user.password = to
        default:
            print("존재하지 않는 key 값 또는 바꿀 수 없는 값")
        }

        self.userDataArray[id] = user
        self.saveToDoc()
    }
    

    
    
    
    
    
    
    
    
    
}
