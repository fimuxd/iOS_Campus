//
//  DetailViewController.swift
//  FriendList
//
//  Created by youngmin joo on 2017. 6. 26..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    /******************************************/
    //            IBOutlet | 전역변수           //
    /******************************************/

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var saveBtnOutlet: UIButton!
    
    /******************************************/
    //            IBAction | Methods          //
    /******************************************/
    
    @IBAction func saveBtn(_ sender: UIButton) {
        if !(nameTextField.text.isEmpty)! && !(genderTextField.text.isEmpty)! && !(ageTextField.text.isEmpty)! {
            
        }
        
    }
   
    
    
    
    /******************************************/
    //                Life Cycle              //
    /******************************************/
    override func viewDidLoad() {
        super.viewDidLoad()


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    

}
