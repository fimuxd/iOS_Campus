//
//  DataCenter.swift
//  LogInSample
//
//  Created by Bo-Young PARK on 5/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

class DataCenter {
    
    static let shared:DataCenter = DataCenter.init()
    
    private var userArray:[User]!
    private var user:[Capsule]!
    private var userId:[[String:Any]] = [[:]]
    
    var dataArray:[User] {
        get{
            return userArray
        }
    }
    
    private let fileManager:FileManager = FileManager()
    private let docPath:String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! + "/Capslets.plist"
    
    private init() {
        if fileManager.fileExists(atPath: docPath) {
            loadFromDoc()
            print("도큐멘터 파일 있음")
        }else{
            loadFromBundle()
        }
    }
    
    private func loadFromBundle() {
        let bundlePath:String = Bundle.main.path(forResource: Authentification.plistFileName, ofType: Authentification.plistFileType)!
        if let loadedArray = NSArray.init(contentsOfFile: bundlePath) as? [[String:Any]] {
            parseUsers(loadedArray)
        }
        try? fileManager.copyItem(atPath: bundlePath, toPath: docPath)
    }
    
    private func loadFromDoc() {
        
        if let loadedArray = NSArray.init(contentsOfFile: docPath) as? [[String:Any]] {
            parseUsers(loadedArray)
        print("loadFromDoc \(loadedArray)")
        }
    }
    
    private func parseUsers(_ array:[[String:Any]]) {
        self.userArray = array.map({ (dictionary:[String:Any]) -> User in
            return User.init(dictionary: dictionary)
            
        })
        
    }

    //보영
    private func parseCapsules(_ array:[[String:Any]]) {
        self.user = array.map({ (dictionary:[String:Any]) -> Capsule in
            return Capsule.init(data: dictionary)
            
        })
        
    }

    private func saveToDoc() {
        print("savaDo\(userArray)")
        let nsArray:NSArray = NSArray.init(array: self.userArray.map({ (user:User) -> [String:Any] in
            return user.dictionary
            
        }))
        nsArray.write(toFile: docPath, atomically: true)
        print(nsArray)
    }
    
    func addUser(_ dict:[String:Any]) {
        
        self.userArray.append(User.init(dictionary: dict))
        self.saveToDoc()
        
    }
    
    func loadUser(){
        userId = UserDefaults.standard.array(forKey: "User_List") as! [[String : Any]]
    }
    
    func addData(_ dict:[String:Any]){
        
//               self.user.append(Capsule.init(data: dict))
        self.saveToDoc()
    }
    
}
