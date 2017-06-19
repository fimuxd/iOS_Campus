//
//  ViewController.swift
//  pListPractice
//
//  Created by Bo-Young PARK on 19/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let realPath = Bundle.main.path(forResource: "FriendsList", ofType: "plist"),
            let dic = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject]
            //추후 swift4에서는 이렇게 되지 않을까 예상합니다. let dic = Dictionary(contextsOfFile: "realPath")
        {
            print(dic["list"])
        }else{
            // 파일이 존재하지 않습니다.
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    func writeFile() {
//        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
//        let realPath = path[0] + "/FriendsList.plist"
//        
//        let fileManager = FileManager.default
//        
//        if fileManager.fileExists(atPath: realPath) {
//            if let bundlePath = Bundle.main.path(forResource: "FriendsList", ofType: "plist") {
//                    do {
//                        try fileManager.copyItem(atPath: bundlePath, toPath: realPath) //copyItem은 throw가 있으므로 do-catch 문을 써줘야 한다.
//                    }catch{
//                        return
//                    }
//                }else{
//                return
//            }
//        }
//        let dic = NSDictionary(contentsOfFile: realPath) as? [String:AnyObject]
//        
//        let nsDic = NSDictionary(dictionary: dic!)
//        nsDic.write(toFile: realPath, atomically: true)
//    }
    
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
    
}

