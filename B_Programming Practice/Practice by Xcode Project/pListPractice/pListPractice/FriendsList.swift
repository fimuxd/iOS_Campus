//
//  FriendsList.swift
//  pListPractice
//
//  Created by Bo-Young PARK on 19/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

class FriendsData {
    
    private let fileName:String = "FriendsList"
    private let fileType:String = "plist"
    private static var instance:FriendsData = FriendsData()
    private var friendsData:[String:Any]?
    
    //Singleton Instance 화
    class var standard:FriendsData {
        return instance     // getter지만 어차피 getter밖에 없으므로 표현을 생략함
    }
    
    func object(forKey defaultName: String) -> Any? {
        guard let data = friendsData else {
            return nil
        }
        return data[defaultName]
    }
    
    func set(_ value: Any?, forKey defaultName: String) {
        guard let _ = friendsData, let realValue = value else {
            return      //return이 없는데 왜 return 을 입력해야 하는지? : guard문의 목적자체가 구문 실행 조건에 부적합할 때 다음 구문을 실행시키지 말아야 하는 것이므로, return을 입력해주어야 하는 것이다. 하지만 전체 함수가 return을 받지 않으므로 return 뒤에 아무런 명령을 입력하지 않는 것이다.
        }
        friendsData![defaultName] = realValue
    }
    
    open func removeObject(forKey defaultName: String) {
        guard let _ = friendsData else {
            return      //여기도 마찬가지
        }
        friendsData?.removeValue(forKey: defaultName)
    }
    
    func friendsDataSave() {
        save()
    }
    
    init() {
        load()
    }
    
    deinit {
        save()
    }
    
    
    //load
    private func load() {
         //1. Document File의 Path 설정
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let realPath = path[0] + "/" + self.fileName + "." + self.fileType
        
        friendsData = NSDictionary(contentsOfFile: realPath) as? [String:Any]
    
    }
    
    //save
    private func save() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let realPath = path[0] + "/" + self.fileName + "." + self.fileType
        
        //2. FileManger Singleton을 이용. Document 폴더에 파일이 있는지 확인
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: realPath) {
            if let bundlePath = Bundle.main.path(forResource: "FriendsList", ofType: "plist") {
                do {
                    try fileManager.copyItem(atPath: bundlePath, toPath: realPath)
                } catch {
                    return
                }
            } else {
                return
            }
            
            
        }
        
        guard let _ = friendsData else {
            return
        }
        
        let nsDic = NSDictionary(dictionary: friendsData!)
        nsDic.write(toFile: realPath, atomically: true)
    }
    
}


/* UserDefaults 참고할 것
 
 open func object(forKey defaultName: String) -> Any?
 open func set(_ value: Any?, forKey defaultName: String)
 open func removeObject(forKey defaultName: String)
 
 */


/* Document Folder 만들었던 것 참고할 것
 
 func writeFile() {
 //1. Document File의 Path 설정
 let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
 let realPath = path[0] + "/FriendsList.plist"
 
 //2. FileManger Singleton을 이용. Document 폴더에 파일이 있는지 확인
 let fileManager = FileManager.default
 
 if !fileManager.fileExists(atPath: realPath) {
 if let bundlePath = Bundle.main.path(forResource: "FriendsList", ofType: "plist") {
 do {
 try fileManager.copyItem(atPath: bundlePath, toPath: realPath)
 } catch {
 return
 }
 } else {
 return
 }
 }
 
 //3. Document Instance (Bundle과 동일하게 NSDictionary 이용)
 let dic = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject]
 
 
 //4. Saving 작업하는 것
 let nsDic = NSDictionary(dictionary: dic!)
 nsDic.write(toFile: realPath, atomically: true)
 }
 
 */
