//
//  LogInViewController.swift
//  LogInSample
//
//  Created by Bo-Young PARK on 5/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    /****************************************/
    //              LifeCycle               //
    /****************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    /****************************************/
    //           IBOutlet | 전역변수           //
    /****************************************/
    @IBOutlet weak var inputEmailTextField: UITextField!
    @IBOutlet weak var inputPassWordTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    /****************************************/
    //           IBAction | Methods          //
    /****************************************/
    
    @IBAction func logInBtnAction(_ sender: UIButton) {
        logInRequest()
    }
    
    @IBAction func signUpBtnAction(_ sender: UIButton) {
        let signUpViewController:SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    func logInRequest() {
        self.view.endEditing(true)
        
        //만약 모든 TextField가 채워져있다면 실행해
        if !(self.inputEmailTextField.text?.isEmpty)! && !(self.inputPassWordTextField.text?.isEmpty)! {
            
            //입력한 이메일이 UserData에 존재하는지 확인
            if let userData = getUser(for: inputEmailTextField.text!) {
                
                //존재한다면,
                switch userData.password {
                    
                case self.inputPassWordTextField.text!:
                    UserDefaults.standard.set(true, forKey: "authentification")
                    self.dismiss(animated: true, completion: nil)
                    
                default:
                    checkIDAndPasswordAlert()
                    
                }
                
            }else{
                invalidUserInfoAlert()
            }
        }else{
            checkBlankAlert()
        }
    }
    
    func getUser(for inputEmail:String) -> User? {
        let getUserData = DataCenter.shared.dataArray.filter { (user) -> Bool in
            user.email == inputEmail
        }
        return getUserData[0]
    }
    
    func checkIDAndPasswordAlert() {
        let alert:UIAlertController = UIAlertController(title: "로그인 실패", message: "아이디 또는 비밀번호를 다시 확인하세요.", preferredStyle: .alert)
        let okBtn:UIAlertAction = UIAlertAction(title: "확인", style: .default) { (alert) in
            self.inputEmailTextField.text = ""
            self.inputPassWordTextField.text = ""
        }
        
        alert.addAction(okBtn)
        alert.present(alert, animated: true, completion: nil)
    }
    
    func invalidUserInfoAlert() {
        let alert:UIAlertController = UIAlertController(title: "로그인 실패", message: "등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.", preferredStyle: .alert)
        let okBtn:UIAlertAction = UIAlertAction(title: "확인", style: .default) { (alert) in
            self.inputEmailTextField.text = ""
            self.inputPassWordTextField.text = ""
        }
        
        alert.addAction(okBtn)
        alert.present(alert, animated: true, completion: nil)
    }
    
    func checkBlankAlert() {
        let alert:UIAlertController = UIAlertController(title: "알림", message: "빈칸을 모두 채워주세요", preferredStyle: .alert)
        let okBtn:UIAlertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 100), animated: true)
    }
    
    
}
