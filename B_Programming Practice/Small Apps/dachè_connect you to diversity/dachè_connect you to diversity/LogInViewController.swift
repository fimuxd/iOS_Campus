//
//  LogInViewController.swift
//  dachè
//
//  Created by Bo-Young PARK on 10/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate{
    
    //******************************************//
    //                  IBOutlet                //
    //******************************************//
    @IBOutlet weak var inputIDTextField: UITextField!
    @IBOutlet weak var inputPasswordTextField: UITextField!
    @IBOutlet weak var logInButtonOutlet: UIButton!
    @IBOutlet weak var createUserButtonOutlet: UIButton!
    @IBOutlet weak var findPasswordButtonOutlet: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var currentUserDatas:[User]!
    
    
    //******************************************//
    //              IBAction/함수영역              //
    //******************************************//
    //---ID TextField 상에서 return 키 누르면 PW TextField로, PW TF에선 키보드가 내려가는 method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.tag == 1 {
            self.inputPasswordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 50), animated: true)
    }
    
    //---Login Button
    @IBAction func logInButtonAction(_ sender: UIButton) {
        checkBlankAlert()
    }
    
    //---새로운 유저 생성창 이동 Button
    @IBAction func createUserButtonAction(_ sender: UIButton) {
        let nextViewController:SignUpViewController = storyboard?.instantiateViewController(withIdentifier: Authentification.signUpStoryboardID) as! SignUpViewController
        
        present(nextViewController, animated: true, completion: nil)
    }
    
    //---비밀번호 찾기 이동 Button
    @IBAction func findPasswordButtonAction(_ sender: UIButton) {
//        let nextViewController:FindPasswordViewController = storyboard?.instantiateViewController(withIdentifier: Authentification.findPasswordStoryboardID) as! FindPasswordViewController
//        
//        self.navigationController?.show(nextViewController, sender: sender)
    }
    
    
    
    private func checkBlankAlert() {
        
        if !(self.inputIDTextField.text?.isEmpty)! && !(self.inputPasswordTextField.text?.isEmpty)! {
            
            if let realUserData = checkValidUser(for: self.inputIDTextField.text!) as? User {
                if realUserData.password == self.inputPasswordTextField.text! {
                    let nextViewController:MainViewController = self.storyboard?.instantiateViewController(withIdentifier: Authentification.mainStoryboardID) as! MainViewController
                    self.present(nextViewController, animated: true, completion: nil)
                    print(realUserData)
                }else{
                    invalidUserInfoAlert()
                }
            }
        }else{
            let alert:UIAlertController = UIAlertController(title: "Oh No", message: "Please fill the blanks", preferredStyle: .alert)
            let okBtn:UIAlertAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
            
            alert.addAction(okBtn)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func checkValidUser(for inputEmail:String) -> Any? {
        
        let validUserData = self.currentUserDatas.filter({ (user) -> Bool in
            user.email == inputEmail
        })
        
        if validUserData.count == 1 {
            return validUserData[0]
        }
        return print("")
    }
    
    private func invalidUserInfoAlert() {
        let alert:UIAlertController = UIAlertController(title: "Oh No", message: "Invalid email or password. Would you like to join dachè?", preferredStyle: .alert)
        let okBtn:UIAlertAction = UIAlertAction(title: "Confirm", style: .default) { (alert) in
            let nextViewController:SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: Authentification.signUpStoryboardID) as! SignUpViewController
            
            self.present(nextViewController, animated: true, completion: nil)
        }
        let cancelBtn:UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(okBtn); alert.addAction(cancelBtn)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func getUserDatas() {
        self.currentUserDatas = UserDataCenter.shared.userDataList
    }
    
    @IBAction func backToLogIn(_ sender:UIStoryboardSegue) {}
    
    //******************************************//
    //                 LiftCycle                //
    //******************************************//
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        getUserDatas()
        print("viewWillAppear에서: \(self.currentUserDatas!)")
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserDatas()
        print("viewDidLoad에서: \(self.currentUserDatas!)")
        //storyboard 상에서 구현 가능하으로 주석처리 하였음
        //        //---textfield 설명란(기본 text. 클릭하면 사라짐)
        //        self.inputIDTextField.attributedPlaceholder = NSAttributedString(string: "dachè ID")
        //        self.inputPasswordTextField.attributedPlaceholder = NSAttributedString(string: "Password")
        
        //        //---비번치는 건 텍스트 안나오게
        //        self.inputPasswordTextField.isSecureTextEntry = true
        //
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

