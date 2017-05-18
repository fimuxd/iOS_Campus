//
//  ViewController.swift
//  test
//
//  Created by Bo-Young PARK on 18/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        var test:OverloadTest = OverloadTest()
        
        test.check(p1: "B", p2: 2)
        
        test.check(p1: "B", p2: "2")
        
    
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

