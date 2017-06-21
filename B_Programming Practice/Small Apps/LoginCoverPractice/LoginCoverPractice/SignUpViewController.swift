//
//  SignUpViewController.swift
//  LogInCoverPractice
//
//  Created by Bo-Young PARK on 20/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit


//회원가입(SignUp) viewController 입니다.

class SignUpViewController: UIViewController, UITextFieldDelegate {

    //******************************************//
    //            IBOutlet / 전역변수              //
    //******************************************//
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var inputIDTextField: UITextField!
    @IBOutlet weak var inputEmailTextField: UITextField!
    @IBOutlet weak var inputNameTextField: UITextField!
    @IBOutlet weak var inputNickNameTextField: UITextField!
    @IBOutlet weak var inputPasswordTextField: UITextField!
    @IBOutlet weak var inputConfirmPasswordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //******************************************//
    //              IBAction / 함수              //
    //******************************************//
    
    //-----회원가입 버튼 눌렀을 때 액션
    @IBAction func signUpBtn(_ sender: UIButton) {
        setAlert()
    }
    
    //-----회원가입 요청시 실행 함수
    func signUpRequest() {
        self.view.endEditing(true)
        
        // 1. 모든 TextField가 빈칸이 아니고, 동시에 Password와 Confirm Password의 String 이 같다면, UserDefault 해주겠니?
        if !(inputIDTextField.text?.isEmpty)! && !(inputEmailTextField.text?.isEmpty)! && !(inputNameTextField.text?.isEmpty)! && !(inputNickNameTextField.text?.isEmpty)! && !(inputPasswordTextField.text?.isEmpty)! && inputPasswordTextField.text! == inputConfirmPasswordTextField.text! {
            
            UserDefaults.standard.set(inputEmailTextField.text!, forKey: Authentification.email)
            UserDefaults.standard.set(inputNickNameTextField.text!, forKey: Authentification.name)
            UserDefaults.standard.set(inputPasswordTextField.text!, forKey: Authentification.password)
            
            // 2. 스스로를 UnwindSegue 하렴 (Main으로 가도록 함)
            
            let viewController:MainViewController = self.storyboard!.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            self.navigationController?.dismiss(animated: true, completion: nil)
            
        }else {
            
            // 3. if 내 값을 입력을 하지 않았을 때 SubLabel에 입력하라고 표시해
            self.statusLabel.text = "fill blank"
        }
    }
    
    //-----알람 관련 함수
    func setAlert() {
        let alert:UIAlertController = UIAlertController(title: "Confirmation", message: "Are you sure all information is right? \n ID: \(self.inputIDTextField.text) \n Email: \(self.inputEmailTextField.text) \n Name: \(self.inputNameTextField.text) \n Nickname: \(self.inputNickNameTextField.text)", preferredStyle: .actionSheet)
        
        let okBtn:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: {(alert:UIAlertAction) in self.signUpRequest() })
        let cancleBtn:UIAlertAction = UIAlertAction(title: "NO", style: .cancel, handler: nil)
        
        alert.addAction(okBtn)
        alert.addAction(cancleBtn)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //-----textField가 키보드에 가려지지 않도록 적정 위치 조절
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 180), animated: true)
    }
    
    //******************************************//
    //                 LifeCycle                //
    //******************************************//
    //MARK: Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
    }
    
}
