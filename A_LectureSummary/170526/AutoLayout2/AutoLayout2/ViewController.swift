//
//  ViewController.swift
//  AutoLayout2
//
//  Created by Bo-Young PARK on 26/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var fNTextField: UITextField!
    @IBOutlet weak var sNTextField: UITextField!
    @IBOutlet weak var tNTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fNTextField.delegate = self
        fNTextField.tag = 1
        
        sNTextField.delegate = self
        sNTextField.tag = 2
        
        tNTextField.delegate = self
        tNTextField.tag = 3
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        if ((textField.text?.characters.count)! >= 10) && range.length == 0 {
            return false
        }
            return true
    }
    
    //return key(엔터키)를 눌렀을 때, 쓰이는 delegate -> textFieldShouldReturn
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.tag == 1 {
            sNTextField.becomeFirstResponder()
        }
        else if textField.tag == 2 {
            tNTextField.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return true
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

