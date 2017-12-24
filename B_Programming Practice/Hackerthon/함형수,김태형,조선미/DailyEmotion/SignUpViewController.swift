//
//  SignUpViewController.swift
//  Hackerthon
//
//  Created by Hyoungsu Ham on 2017. 7. 6..
//  Copyright © 2017년 Hyoungsu Ham. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController , UITextFieldDelegate{

    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var userIDTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        userIDTextField.delegate = self
        passwordTextField.delegate = self
        confirmTextField.delegate = self
        userIDTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func signUpButtonTouched(_ sender: UIButton) {

        print(DataCenter.standard.rawArray)
        
        
        guard !nickNameCheck(DataCenter.standard.rawArray) else {
            return print("이미 등록된 닉네임입니다.")
        }
        
        guard passwordCheck() else {
            return print("암호 컨펌이 잘못되었습니다.")
        }
        
        
        var user: [String: Any] = [:]
        
        let userCount = DataCenter.standard.rawArray.count 
        
        user.updateValue(userCount, forKey: "user_number")
        user.updateValue(userIDTextField.text!, forKey: "user_id")
        user.updateValue(passwordTextField.text!, forKey: "user_password")
        
        DataCenter.standard.addUser(user)
        DataCenter.standard.saveToDoc2()
        print("등록 완료")
        print(DataCenter.standard.rawArray)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // 아이디 중복 체크
    func nickNameCheck(_ userList: [User]) -> Bool {
        
        var isRegistered = false
        
        for item in userList {
            if item.userId == self.userIDTextField.text! {
                isRegistered = true
            }
        }
        return isRegistered
    }
    
    // 패스워드 중복 체크
    func passwordCheck() -> Bool {
        
        if passwordTextField.text == confirmTextField.text {
            return true
        } else {
            return false
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if userIDTextField.isFirstResponder {
            passwordTextField.becomeFirstResponder()
        } else if passwordTextField.isFirstResponder {
            confirmTextField.becomeFirstResponder()
        } else {
            confirmTextField.resignFirstResponder()
        }
        
        return true
    }
    
    
    
    
    
    
    
    

}
