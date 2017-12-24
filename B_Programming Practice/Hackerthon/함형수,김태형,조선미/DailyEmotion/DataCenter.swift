//
//  DataCenter.swift
//  Hackerthon
//
//  Created by Hyoungsu Ham on 2017. 7. 6..
//  Copyright © 2017년 Hyoungsu Ham. All rights reserved.
//

import Foundation

class DataCenter {
    
    static var standard: DataCenter = DataCenter()
    
    var rawArray: [User] = []
    
    var user: User?    
    
    private let fileManager: FileManager = FileManager()
    private let docPath: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! + "/Users.plist"
    
    
    private init() {
        
        if UserDefaults.standard.bool(forKey: "logInStatus") {
            setUser()
        }
        
        if fileManager.fileExists(atPath: docPath) {
            loadFromDoc()
        } else {
            loadFromBundle()
        }
    }
    
    func loadFromBundle() {
        if let bundlePath: String = Bundle.main.path(forResource: "Users", ofType: "plist"), let loadedArray = NSArray.init(contentsOfFile: bundlePath) as? [[String: Any]] {
            
            self.rawArray = loadedArray.map({ (dictionary: [String: Any]) -> User in
                return User.init(dictionary: dictionary)
            })
            
            try? fileManager.copyItem(atPath: bundlePath, toPath: docPath)
        }
    }
    
    func loadFromDoc() {
        
        if let loadedArray = NSArray.init(contentsOfFile: docPath) as? [[String: Any]] {
            
            self.rawArray = loadedArray.map({ (dictionary: [String: Any]) -> User in
                return User.init(dictionary: dictionary)
            })
        }
    }
    
    func saveToDoc() {
        
        editUser()
        
        var tempArray: [[String: Any]] = [[:]]
        
        for i in rawArray {
            
            if i.userNumber == 0 {
                tempArray[0] = i.dictionary
            } else {
                tempArray.append(i.dictionary)
            }
        }
        
        let nsArray: NSArray = NSArray(array: tempArray)
        
        nsArray.write(toFile: docPath, atomically: true)
        
        print(nsArray)
        print("다음 데이터를 세이브 하였음 \(self.rawArray)")
    }
    
    func saveToDoc2() {
        
        var tempArray: [[String: Any]] = [[:]]
        
        for i in rawArray {
            tempArray.append(i.dictionary)
        }
        
        let nsArray: NSArray = NSArray(array: tempArray)
        
        nsArray.write(toFile: docPath, atomically: true)
        
        print(nsArray)
        print("다음 데이터를 세이브 하였음 \(self.rawArray)")
    }
    
    func addUser(_ dict: [String: Any]) {
        self.rawArray.append(User.init(dictionary: dict))
    }
    
    func editUser() {
        self.rawArray[(user?.userNumber)!] = user!
    }
    
    func addEmotionData(_ dict: [String: Any]) {
        user?.userData.insert(TimeLineEmotion(dictionary: dict), at: 0)
    }
    
    func setUser() {
        
        let currentUser: String = UserDefaults.standard.object(forKey: "currentUser") as? String ?? ""
        
        for index in rawArray {
            if index.userId == currentUser {
                user = index
            }
        }
    }
    
    func logOut() {
        
        UserDefaults.standard.set(false, forKey: "logInStatus")
    }
    
    
}
