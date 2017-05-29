//
//  ViewController.swift
//  LogInCoverPractice
//
//  Created by Bo-Young PARK on 29/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {

    @IBOutlet weak var iDTextField: UITextField!

    @IBOutlet weak var pWTextField: UITextField!

    @IBOutlet weak var textFieldsScroll: UIScrollView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //textfield 설명란(기본 text. 클릭하면 사라짐)
        iDTextField.attributedPlaceholder = NSAttributedString(string: "dachè ID")
        pWTextField.attributedPlaceholder = NSAttributedString(string: "Password")
        
        //비번치는 건 텍스트 안나오게
        pWTextField.isSecureTextEntry = true
        
        //delegate
        iDTextField.delegate = self
        pWTextField.delegate = self
        textFieldsScroll.delegate = self
    
    
    }

    //ID TextField 상에서 return 키 누르면 PW TextField로, PW TF에선 키보드가 내려가는 method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.tag == 1 {
            pWTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldsScroll.setContentOffset(CGPoint(x: 0, y: 50), animated: true)
    }
    
    // Login Btn 누르면
    @IBAction func LogInBtn(_ sender: UIButton) {
        
        if iDTextField.isEditing {
        pWTextField.resignFirstResponder()
        } else {
        pWTextField.resignFirstResponder()
        }
    
    }
    @IBOutlet weak var newAccBtn: UIButton!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

