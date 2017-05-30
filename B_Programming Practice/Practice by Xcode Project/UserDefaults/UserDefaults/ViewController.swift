//
//  ViewController.swift
//  UserDefaults
//
//  Created by Bo-Young PARK on 30/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

let ageKey = "AGE"

class ViewController: UIViewController {

    @IBOutlet weak var nameResultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
//        UserDefaults.standard.set("Bo-Young", forKey: "First Name")
//        UserDefaults.standard.set("Park", forKey: "Last Name")
//        UserDefaults.standard.set(31, forKey: "Age")
        
        let firstName:String = UserDefaults.standard.string(forKey: "First Name")!
        let lastName:String = UserDefaults.standard.string(forKey: "Last Name")!
        let age:Int = UserDefaults.standard.object(forKey: "Age") as! Int
  
        nameResultLabel.text = "이름 : \(lastName)" + "\( firstName)" + ". 나이는 \(age) 입니다."
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

