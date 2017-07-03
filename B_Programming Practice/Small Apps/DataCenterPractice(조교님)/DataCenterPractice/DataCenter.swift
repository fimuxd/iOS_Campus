//
//  DataCenter.swift
//  DataCenterPractice
//
//  Created by 박종찬 on 2017. 6. 30..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class DataCenter {
    
    static let shared: DataCenter = DataCenter.init()

    private var rawArray: [Person]!
    
    var dataArray: [Person] {
        get {
            return rawArray
        }
    }
    
    private let fileManager:FileManager = FileManager()
    private let docPath: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! + "/Person.plist"
    
    
    private init() {
        if fileManager.fileExists(atPath: docPath) {
            loadFromDoc()
        } else {
            loadFromBundle()
        }
        
    }
    
    private func loadFromBundle() {
        let bundlePath: String = Bundle.main.path(forResource: "Person", ofType: "plist")!
        if let loadedArray = NSArray.init(contentsOfFile: bundlePath) as? [[String:Any]] {
            parsePersons(loadedArray)
        }
        try? fileManager.copyItem(atPath: bundlePath, toPath: docPath)
        print(self.rawArray)
    }
    
    private func loadFromDoc() {
        if let loadedArray = NSArray.init(contentsOfFile: docPath) as? [[String:Any]] {
            parsePersons(loadedArray)
        }
    }
    
    private func parsePersons(_ array: [[String:Any]]) {
        self.rawArray = array.map({ (dictionary: [String:Any]) -> Person in
            return Person.init(with: dictionary)
        })
    }
    
    private func saveToDoc() {
        let nsArray: NSArray = NSArray.init(array: self.rawArray.map({ (person: Person) -> [String:Any] in
            return person.dictionary
        }))
        nsArray.write(toFile: docPath, atomically: true)
    }
    
    func addPerson(_ dict:[String:Any]) {
        self.rawArray.append(Person.init(with: dict))
        self.saveToDoc()
    }
    
    
}
