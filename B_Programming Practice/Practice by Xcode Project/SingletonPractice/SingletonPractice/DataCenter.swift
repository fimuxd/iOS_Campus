//
//  File.swift
//  SingletonPractice
//
//  Created by Bo-Young PARK on 30/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import Foundation

class DataCenter {
    static let shared:DataCenter = DataCenter.init()
    
    //    var dataArray:[Person] = []
    //
    //    private init() {
    //        let bundlePath = Bundle.main.path(forResource: "Person", ofType: "plist")
    //        if let loadedArray = NSArray.init(contentsOfFile: bundlePath!) as? [[String:Any]] {
    //            self.dataArray = loadedArray.map({ (dictionary:[String:Any]) -> Person in
    //                return Person.init(withDicationary: dictionary)
    //            })
    //        }
    //    }
    
    //조교님이라면 상단으로 안쓰고 아래처럼 쓸 것임
    private var rawArray:[Person]!
    
    var dataArray:[Person] {
        get{
            return rawArray
        }
    }
    
    private let fileManager:FileManager = FileManager()
    private let docPath:String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! + "/Person.plist"

    private init() {
        if fileManager.fileExists(atPath: docPath) {
            loadFromDoc()
        }else{
            loadFromBundle()
        }
    } //이 시점에 알 수 있는 건 person directory에 "창호"는 반드시 있다.
    
    private func loadFromBundle() {
        let bundlePath:String = Bundle.main.path(forResource: "Person", ofType: "plist")!
        if let loadedArray = NSArray.init(contentsOfFile: bundlePath) as? [[String:Any]] {
            parsePersons(loadedArray)
        }
        try? fileManager.copyItem(atPath: bundlePath, toPath: docPath)
    }
    
    private func loadFromDoc() {
        if let loadedArray = NSArray.init(contentsOfFile: docPath) as? [[String:Any]] {
            parsePersons(loadedArray)
        }
    }
    
    private func parsePersons(_ array:[[String:Any]]) {
        self.rawArray = array.map({ (dictionary:[String:Any]) -> Person in
            return Person.init(withDicationary: dictionary)
        })
    }
    
    private func saveToDoc() {
        let nsArray:NSArray = NSArray.init(array: self.rawArray.map({ (person:Person) -> [String:Any] in
            return person.dictionary
        }))
        nsArray.write(toFile: docPath, atomically: true)
    }
    
    func addPersion(_ dict:[String:Any]) {
        self.rawArray.append(Person.init(withDicationary: dict))
        self.saveToDoc()
    }
    
    
}
