//
//  DataCenter.swift
//  NagMaker
//
//  Created by HyunJomi on 2017. 7. 6..
//  Copyright © 2017년 HyunJung. All rights reserved.
//

import UIKit

class DataCenter{
    
    static let standard = DataCenter()
    
    var nagArray: [NagData] = []
    var nagArr: [Nag] = []
    
    private let fileManager:FileManager = FileManager()
    private let docPath: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! + "/NagData.plist"
    
    private init() {
        
        if fileManager.fileExists(atPath: docPath) {
            self.loadFromDoc()
        } else {
            self.loadFromBundle()
        }
        
    }
    
    private func loadFromBundle() {
        let bundlePath: String = Bundle.main.path(forResource: "NagData", ofType: "plist")!
        if let loadedArray = NSArray(contentsOfFile: bundlePath) as? [[String:Any]] {
            for i in loadedArray{
                nagArray.append(NagData(with: i))
            }
        
        }
        try? fileManager.copyItem(atPath: bundlePath, toPath: docPath)
    }
    
    private func loadFromDoc() {
        if let loadedArray = NSArray(contentsOfFile: docPath) as? [[String:Any]] {
            for i in loadedArray{
                
                nagArray.append(NagData(with: i))
            }
        }
    }
    
    func saveToDoc() {
        let nsArray: NSArray = NSArray(array: self.nagArr.map({ (data: Nag) -> [String:Any] in
            return data.dictionary
        }))
        nsArray.write(toFile: docPath, atomically: true)
    }
    
    func addNag(_ dict:[String:Any]) {
        self.nagArr.append(Nag(with: dict))
        self.saveToDoc()
    }
    
    func editNag(_ dict:[String:Any], editNagTitle:String, editAfterNagY:String, editAfterNagN:String, editDuration: Int) {
        
        var index:Int = 0
        print(editNag)
        print(self.nagArr)
        for nag in self.nagArr {
            
            if editNagTitle == nag.nagTitle {
                print("exist")
                break
            }
            if editAfterNagY == nag.nagAnswerY {
                break
            }
            if editAfterNagN == nag.nagAnswerN {
                break
            }
            if editDuration == nag.duration {
                break
            }
    
            index += 1
        }
        print("Index: \(index)")
        
        self.nagArr[index] = Nag(with: dict)
        
        self.saveToDoc()
        
    }
    
    func removeNag(_ dict:[String:Any], removeNag:String, removeAfterNagY:String, removeAfterNagN:String, removeDuration: Int) {
        var index:Int = 0
        for nag in self.nagArr {
            if removeNag == nag.nagTitle {
                print("exist")
                break
            }
            if removeAfterNagY == nag.nagAnswerY {
                print("exist")
                break
            }
            if removeAfterNagN == nag.nagAnswerN {
                print("exist")
                break
            }
            if removeDuration == nag.duration {
                print("exist")
                break
            }
            index += 1
        }
        
        print("Index: \(index)")
        
        self.nagArr.remove(at: index)
        
        self.saveToDoc()
    }

    
}
