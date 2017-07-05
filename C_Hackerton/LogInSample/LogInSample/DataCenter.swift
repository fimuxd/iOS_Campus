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
    
    var dataArray:[User] {
        get{
            return userArray
        }
    }
    
    private let fileManager:FileManager = FileManager()
    private let docPath:String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! + "/UserData.plist"
    
    private init() {
        if fileManager.fileExists(atPath: docPath) {
            loadFromDoc()
        }else{
            loadFromBundle()
        }
    }
    
    private func loadFromBundle() {
        let bundlePath:String = Bundle.main.path(forResource: "UserData", ofType: "plist")!
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
        self.userArray = array.map({ (dictionary:[String:Any]) -> User in
            return User.init(with: dictionary)
        })
    }
    
    private func saveToDoc() {
        let nsArray:NSArray = NSArray.init(array: self.userArray.map({ (user:User) -> [String:Any] in
            return user.dictionary
        }))
        nsArray.write(toFile: docPath, atomically: true)
    }
    
    func addUser(_ dict:[String:Any]) {
        self.userArray.append(User.init(with: dict))
        self.saveToDoc()
    }
    
}
