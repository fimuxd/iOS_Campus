//
//  ViewController.swift
//  CocoaPodsPractice
//
//  Created by Bo-Young PARK on 28/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit
import Kingfisher //Cocoapod에서 가져온 Kingfisher를 가져온다.
import Realm //Carthage에서 가져온 Realm을 가져온다.

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label1:UILabel = {
            let label1 = UILabel()
            label1.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
            label1.backgroundColor = .white
            return label1
        }()
        
        let label2 = UILabel()
        label2.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        label2.backgroundColor = .black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

