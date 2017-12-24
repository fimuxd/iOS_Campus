//
//  AddViewController.swift
//  SingletonPractice
//
//  Created by Bo-Young PARK on 3/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    /*************************************/
    //              LifeCycle            //
    /*************************************/
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*************************************/
    //          IBOutlet | 전역변수         //
    /*************************************/
    
    @IBOutlet weak var saveBtnOutlet: UIButton!
    @IBOutlet weak var inputNameTF: UITextField!
    @IBOutlet weak var inputAgeTF: UITextField!
    @IBOutlet weak var inputGenderSegmentedControlOutlet: UISegmentedControl!
    @IBOutlet weak var phoneNumberTF: UITextField!
    
    
    /*************************************/
    //         IBAction | Methods         //
    /*************************************/

    @IBAction func saveBtnAction(_ sender: UIButton) {
    }

    @IBAction func inputGenderSegmentedControlAction(_ sender: UISegmentedControl) {
    }
}
