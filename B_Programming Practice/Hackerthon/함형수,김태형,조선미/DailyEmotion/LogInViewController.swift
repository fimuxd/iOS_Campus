//
//  LogInViewController.swift
//  Hackerthon
//
//  Created by Hyoungsu Ham on 2017. 7. 6..
//  Copyright © 2017년 Hyoungsu Ham. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userIDTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userIDTextField.delegate = self
        passwordTextField.delegate = self
        userIDTextField.becomeFirstResponder()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func logInButtonTouched(_ sender: UIButton) {
        
        var isLogInSuccess = false
        
        for item in DataCenter.standard.rawArray {
            if item.userId == userIDTextField.text && item.userPassword == passwordTextField.text {
                
                isLogInSuccess = true
                
                UserDefaults.standard.set(true, forKey: "logInStatus")
                UserDefaults.standard.set(item.userId, forKey: "currentUser")
            }
        }
        
        if isLogInSuccess {
            print("log in success !!!")
            
            self.dismiss(animated: true, completion: nil)
            DataCenter.standard.setUser()
            
        } else {
            print("log in failed ...")
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if userIDTextField.isFirstResponder {
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
        }
        
        return true
    }
    
}
