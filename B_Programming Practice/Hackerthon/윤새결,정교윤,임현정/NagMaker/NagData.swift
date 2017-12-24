//
//  NagData.swift
//  NagMaker
//
//  Created by HyunJomi on 2017. 7. 6..
//  Copyright © 2017년 HyunJung. All rights reserved.
//

import UIKit

struct NagData{
    
    var location: String
    var location_url: String
    var nagList: [Nag]
    
    var dictionary: [String:Any] {
        get {
            return ["location": location, "location_Img_url":location_url, "nagList":nagList]
        }
    }
    
    init(with dictionary:[String: Any]) {

        self.location = dictionary["location"] as! String
        self.location_url = dictionary["location_Img_url"] as! String
        self.nagList = []
            
        if let data = dictionary["nagList"] as? [[String:Any]]{
            for i in data {
             self.nagList.append(Nag.init(with: i))
            }
        }
    }
}

struct Nag{
    
    var nagTitle: String
    var nagAnswerY: String
    var nagAnswerN: String
    var duration: Int
    
    var dictionary: [String:Any] {
        get {
            return ["nag_title": nagTitle, "nag_answer_Y":nagAnswerY, "nag_answer_N":nagAnswerN, "duration":duration]
        }
    }
    
    init(with dictionary:[String:Any]) {
        self.nagTitle = dictionary["nag_title"] as! String
        self.nagAnswerY = dictionary["nag_answer_Y"] as! String
        self.nagAnswerN = dictionary["nag_answer_N"] as! String
        self.duration = dictionary["duration"] as! Int
    }
    
}
