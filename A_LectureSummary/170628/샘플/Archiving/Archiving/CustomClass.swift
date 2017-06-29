//
//  CustomClass.swift
//  Archiving
//
//  Created by Giftbot on 2017. 6. 26..
//  Copyright © 2017년 Giftbot. All rights reserved.
//

import Foundation

final class CustomClass1 {
  let name: String
  let job: String
  
  init(name: String, job: String) {
    self.name = name
    self.job = job
  }
}

final class CustomClass2: NSObject, NSCoding {
  let name: String
  let job: String
  
  init(name: String, job: String) {
    self.name = name
    self.job = job
  }
  
  convenience init(coder aDecoder: NSCoder) {
    let name = aDecoder.decodeObject(forKey: "name") as! String
    let job = aDecoder.decodeObject(forKey: "job") as! String
    self.init(name: name, job: job)
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: "name")
    aCoder.encode(job, forKey: "job")
  }
}
