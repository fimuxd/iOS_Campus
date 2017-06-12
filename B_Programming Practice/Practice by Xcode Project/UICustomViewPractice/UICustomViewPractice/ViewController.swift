//
//  ViewController.swift
//  UICustomViewPractice
//
//  Created by Bo-Young PARK on 9/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomVendingMachineViewDelegate {
    
    @IBOutlet weak var CustomVendingMachineView: CustomVendingMachineView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        roundBtn1.setTitleText("첫번째")
//        roundBtn2.setTitleText("두번째")
        
        self.CustomVendingMachineView.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func didSelectedItem(item: CustomVendingMachineView) {
        print(item.titleLabel?.text)
    }
    
    func isAbleToTouch() -> Bool {
        return true
    }

}

