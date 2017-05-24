//
//  ViewController.swift
//  OptionalPractice
//
//  Created by Bo-Young PARK on 17/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    //OptionalPractice
        
        var otName:String!
        var name:String = "joo"
        
        func printTest()
        {
            otName = "BB"
            print(otName)
                //optional을 일반 타입으로 선언해주지 않았으므로 
                //print값: Optional("BB")
            
            print(otName!)
                //Optional 타입을 일반 타입으로 변경
                //print값: BB
            
            print(name)
                //원래 일반 타입이므로 문제 없음
            
        }
        
    
    //친구리스트 만들기:Optional
    
        var friendList:[String]?
        
        func addFriend(name:String) {
            if friendList == nil {
            friendList = []
            }
            friendList!.append(name)
        }
        
        print(friendList!)

        func printFriendList() {
            guard let friends:[String] = friendList else {
                return
            }
            
            for friendList in friends {
             print(friendList)
            }
        }
        
        printFriendList()
        
    //친구리스트 만들기: 좀 더 어렵게 딕셔너리를 이용해보쟈
        var friendList1:Array<Dictionary<String,String>>?
            //var friendList:Array<[String:String]>?
            //var friendList:[[String:String]]?
        
        func addFriend(name:String, gender:String) {
            var friend1:[String:String] = [String:String]()
                friend1.updateValue(name, forKey: "name")
                friend1.updateValue(gender, forKey: "gender")
                addFriend(friendData: friend1)
        }
        
        func addFriend(friendData:[String:String]) {
            if friendList == nil {
                friendList = []
            }
            
            friendList1!.append(friendData)
        }
        
        // 친구의 이름 리스트 만들기 함수
        /* 상기 함수를 guard 문을 써서 작성하면
        func friendNames() -> [String] {
            
            guard let friends = friendList else {
                return []
            }
            var returnList:[String] = []
            
            for friend:[String:String] in friends {
                let name:String = friend["name"]!
                returnList.append(name)
            }
            
            return returnList
        } */
        
        //친구의 이름 모두 출력
        func printFriendName() {
            if let friends:[[String:String]] = friendList1 {
                
                for friend in friends {
                    
                    for (key,value) in friend {
                        if key == "name" {
                            print(value)
                        }
                    }
                    
                    let name:String = friend["name"]!
                    //print(name)
                }
            }
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

