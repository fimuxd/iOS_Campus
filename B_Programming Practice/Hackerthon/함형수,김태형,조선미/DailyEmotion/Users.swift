//
//  Users.swift
//  Hackerthon
//
//  Created by Hyoungsu Ham on 2017. 7. 6..
//  Copyright © 2017년 Hyoungsu Ham. All rights reserved.
//

import Foundation

struct User {
    
    let userNumber: Int
    let userId: String
    let userPassword: String
    var userData: [TimeLineEmotion]
    var friendList: [User]
    
    var dictionary: [String: Any] {
        get {
            
            var tempData: [[String: Any]] = []
            
            let container: [TimeLineEmotion] = userData
            
            for emotion in container {
                tempData.append(emotion.dictionary)
            }
            
            var tempData2: [[String: Any]] = []
            
            let container2: [User] = friendList
            
            for user in container2 {
                tempData2.append(user.dictionary)
            }
            
            return ["user_number": userNumber, "user_id": userId, "user_password": userPassword, "user_data": tempData, "friend_data": tempData2]
        }
    }
    
    init(dictionary: [String: Any]) {
        self.userNumber = dictionary["user_number"] as! Int
        self.userId = dictionary["user_id"] as! String
        self.userPassword = dictionary["user_password"] as! String
        
        userData = []
        
        if let container: [[String: Any]] = dictionary["user_data"] as? [[String: Any]] {
            
            for user in container {
                userData.append(TimeLineEmotion.init(dictionary: user))
            }
            
        }
        
        friendList = []
        
        if let container: [[String: Any]] = dictionary["friend_data"] as? [[String: Any]] {
            
            for friend in container {
                friendList.append(User.init(dictionary: friend))
            }
        }
    }
}


struct TimeLineEmotion {
    let cellType: String
    let date: String
    var emotion: Emotion
    var comment: String
    var property1: String
    
    var dictionary: [String: Any] {
        return ["cellType": cellType, "date": date, "emotion": emotion.rawValue, "comment": comment, "property1": property1]
    }
    
    init(dictionary: [String: Any]) {
        self.cellType = dictionary["cellType"] as! String
        self.date = dictionary["date"] as! String
        self.emotion = Emotion.init(rawValue: dictionary["emotion"] as! String)!
        self.comment = dictionary["comment"] as! String
        self.property1 = dictionary["property1"] as! String
    }
}


enum Emotion: String {
    
    case happy
    case joy
//    case smile
    case glad
    case breathigh
    case displeasure
    case anger
//    case annoyance
    case melancholy
    case sad
    
}


