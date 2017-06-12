//
//  ViewController.swift
//  UICustomViewPractice
//
//  Created by Bo-Young PARK on 9/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var roundBtn1:RoundView!
    @IBOutlet var roundBtn2:RoundView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundBtn1.setTitleText("첫번째")
        roundBtn2.setTitleText("두번째")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

