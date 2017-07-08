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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUserData()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserData()
        
        print(self.currentUserArray)
        
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
    
    private var currentUserArray:[User]!
    
    /****************************************/
    //           IBAction | Methods          //
    /****************************************/
    
    @IBAction func logInBtnAction(_ sender: UIButton) {
        logInRequest()
        print(DataCenter.shared.dataArray)
        
    }
    
    @IBAction func signUpBtnAction(_ sender: UIButton) {
        let signUpViewController:SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: Authentification.idForSignUpViewController) as! SignUpViewController
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    func logInRequest() {
        self.view.endEditing(true)
        
        //만약 모든 TextField가 채워져있다면 실행해
        if !(self.inputEmailTextField.text?.isEmpty)! && !(self.inputPassWordTextField.text?.isEmpty)! {
            
            //입력한 이메일이 UserData에 존재하는지 확인
            if let userData = getUser(for: inputEmailTextField.text!) {
                
                //존재한다면,
                switch userData.userPassword {
                    
                case self.inputPassWordTextField.text!:
                    //                    UserDefaults.standard.set(true, forKey: Authentification.authentificationBool)
                    
                    let nextViewController:MainViewController = self.storyboard?.instantiateViewController(withIdentifier: Authentification.idForMainViewController) as! MainViewController
                    
                    let currentUserID = userData.userId
                    nextViewController.userID = currentUserID
                    
                    self.navigationController?.pushViewController(nextViewController, animated: true)
                    
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
        let getUserData = self.currentUserArray.filter { (user) -> Bool in
            user.userEmail == inputEmail
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
        self.present(alert, animated: true, completion: nil)
    }
    
    func invalidUserInfoAlert() {
        let alert:UIAlertController = UIAlertController(title: "로그인 실패", message: "등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.", preferredStyle: .alert)
        let okBtn:UIAlertAction = UIAlertAction(title: "확인", style: .default) { (alert) in
            self.inputEmailTextField.text = ""
            self.inputPassWordTextField.text = ""
        }
        
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
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
    
    func getUserData() {
        self.currentUserArray = DataCenter.shared.dataArray
    }
}
