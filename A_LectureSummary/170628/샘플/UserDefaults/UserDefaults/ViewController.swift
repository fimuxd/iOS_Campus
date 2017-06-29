//
//  ViewController.swift
//  UserDefaults
//
//  Created by Giftbot on 2017. 6. 26..
//  Copyright © 2017년 Giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    UserDefaults.standard.set(100, forKey: "example1")
    UserDefaults.standard.set(200, forKey: "example2")
    
    print(UserDefaults.standard.dictionaryRepresentation())
    print("\n########################", terminator: "\n\n")
    
    print(Array(UserDefaults.standard.dictionaryRepresentation().keys))
    print("\n########################", terminator: "\n\n")
    
    print(Array(UserDefaults.standard.dictionaryRepresentation().values))
    print("\n########################", terminator: "\n\n")
    
    for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
      print(key, value)
    }
    print("\n#######", "#######", "######", separator: " / ", terminator: "\n\n")
    
    // Deprecated. Remove!
//    UserDefaults.standard.synchronize()
    
    print(UserDefaults.standard.object(forKey: "example1") ?? "None")
    print(UserDefaults.standard.object(forKey: "example2") ?? "None")
  }

}

