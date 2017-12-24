//
//  LogInViewController.swift
//  Geuneul
//
//  Created by Eunyeong Kim on 2017. 7. 6..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var textFieldId: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldId.delegate = self
        textFieldPassword.delegate = self
    }
    
    @IBAction func buttonLoginAction(_ sender: UIButton)
    {
        var arrayUserInfo:[[String:String]] = []
        
        arrayUserInfo = UserDefaults.standard.array(forKey: "user") as? [[String : String]] ?? []
        
        
        if arrayUserInfo.count == 0{
            return
        }else{
            for dicArrayUserInfo in arrayUserInfo {
                
                if textFieldId.text! == dicArrayUserInfo[UserInfo.id]! && textFieldPassword.text == dicArrayUserInfo[UserInfo.password]!{
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarViewController") as! MainTabBarViewController
                    print(dicArrayUserInfo)
                    self.present(vc, animated: true, completion: nil)
                    
                }
//                showAlert(msg: "FF")
            }
            
            
        }
        
    }
    
    func showAlert(msg:String){
        let alertVC = UIAlertController.init(title: "로그인", message: msg, preferredStyle: .alert)
        let okBtn = UIAlertAction.init(title: "확인", style: .default, handler: nil)
        alertVC.addAction(okBtn)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 10:
            textFieldPassword.becomeFirstResponder()
        case 20:
            textFieldPassword.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
