//
//  SignUpViewController.swift
//  Geuneul
//
//  Created by Eunyeong Kim on 2017. 7. 6..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var textFieldId: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldPasswordConfirm: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldId.delegate = self
        textFieldPassword.delegate = self
        textFieldPasswordConfirm.delegate = self
    }
    
    
    
    @IBAction func buttonSignUpAction(_ sender: UIButton)
    {
        if !((textFieldId.text?.isEmpty)! && (textFieldPassword.text?.isEmpty)! && (textFieldPasswordConfirm.text?.isEmpty)!) {
            
            if self.textFieldPassword.text != self.textFieldPasswordConfirm.text {
                
                let alertVC = UIAlertController.init(title: "입력하신 정보가 틀리셨네요", message: "다시 확인 바랄게요", preferredStyle: .alert)
                let okButton = UIAlertAction.init(title: "확인", style: .default, handler: nil)
                alertVC.addAction(okButton)
                self.present(alertVC, animated: true, completion: nil)
            }else{
                var arrayUserTotal:[[String:String]] = []
                
                arrayUserTotal = UserDefaults.standard.array(forKey: "user") as? [[String : String]] ?? []
                
                let dicNewUser = [UserInfo.id:textFieldId.text!, UserInfo.password:textFieldPassword.text!]
                
                
                if arrayUserTotal.count == 0{
                    arrayUserTotal = [dicNewUser]
                }else{
                    arrayUserTotal.append(dicNewUser)
                }
                
                
                UserDefaults.standard.set(arrayUserTotal, forKey: "user")
                
                
                
                navigationController?.popViewController(animated: true)
                }
        }
        
     
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
  
    
    func showAlert(message msg:String) {
        let alertVC = UIAlertController.init(title: "경고", message: msg, preferredStyle: .alert)
        let okButton = UIAlertAction.init(title: "확인", style: .default, handler: nil)
        alertVC.addAction(okButton)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 10:
            textFieldPassword.becomeFirstResponder()
        case 20:
            textFieldPasswordConfirm.becomeFirstResponder()
        case 30:
            textFieldPasswordConfirm.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
