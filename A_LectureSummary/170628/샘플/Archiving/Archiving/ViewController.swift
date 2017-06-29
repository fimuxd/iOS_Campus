//
//  ViewController.swift
//  Archiving
//
//  Created by Giftbot on 2017. 6. 26..
//  Copyright © 2017년 Giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    saveCustomClassWithoutSerialization()
    saveCustomClassWithSerialization()
    loadCustomClass()
  }
  
  func saveCustomClassWithoutSerialization() {
    let myClass = CustomClass1(name: "giftbot", job: "iOS Developer")
    let data = [myClass] as NSArray
    let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    let result = data.write(toFile: dirPath + "/normalData.dat", atomically: true)
    print(result)
  }
  
  func saveCustomClassWithSerialization() {
    let myClass = CustomClass2(name: "giftbot", job: "iOS Developer")
    let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    let result = NSKeyedArchiver.archiveRootObject(myClass, toFile: dirPath + "/archivedData.dat")
    print(result)
  }
  
  func loadCustomClass() {
    let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    let data = NSKeyedUnarchiver.unarchiveObject(withFile: dirPath + "/archivedData.dat") as! CustomClass2
    print(data.job)
    print(data.name)
  }
}

