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
    
    @IBOutlet weak var inputEmailTextField: UITextField!
    @IBOutlet weak var inputNameTextField: UITextField!
    @IBOutlet weak var inputbirthdayTextField: UITextField!
    @IBOutlet weak var inputPhoneNumberTextField: UITextField!
    @IBOutlet weak var inputPasswordTextField: UITextField!
    @IBOutlet weak var inputConfirmPasswordTextField: UITextField!
    
    @IBOutlet weak var inputGenderSegmentedControlOutlet: UISegmentedControl!
    
    @IBOutlet weak var signUpButtonOutlet: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var currentUserDatas:[User]!
    private var selectedGender:[Gender] = []
    
    //******************************************//
    //              IBAction / 함수              //
    //******************************************//
    
    @IBAction func inputGenderSegmentedControlAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            self.selectedGender[0] = Gender.female
            print(selectedGender)
        }else{
            self.selectedGender[0] = Gender.male
            print(selectedGender)
        }
    }
    
    
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        isExistUserEmail(self.inputEmailTextField.text!)
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
    }
    
    //-----회원가입 요청시 실행 함수
    func registerNewUser() {
        self.view.endEditing(true)
        
        // 1. 모든 TextField가 빈칸이 아니고, 동시에 Password와 Confirm Password의 String 이 같다면, UserDefault 해주겠니?
        if !(self.inputEmailTextField.text?.isEmpty)! && !(self.inputNameTextField.text?.isEmpty)! && !(self.inputbirthdayTextField.text?.isEmpty)! && !(self.inputPhoneNumberTextField.text?.isEmpty)! && self.inputGenderSegmentedControlOutlet.isSelected && !(self.inputPasswordTextField.text?.isEmpty)! && !(self.inputConfirmPasswordTextField.text?.isEmpty)! && self.inputPasswordTextField.text! == self.inputConfirmPasswordTextField.text! {
            
            UserDataCenter.shared.addUserData([Authentification.id:UserDataCenter.shared.userDataList.count,
                                               Authentification.email:self.inputEmailTextField.text!,
                                               Authentification.name:self.inputNameTextField.text!,
                                               Authentification.birthday:self.inputbirthdayTextField.text!,//TODO: 여기서 birthday는 Date로 받아야 하므로 추후 변경 필요함
                Authentification.phoneNumber:self.inputPhoneNumberTextField.text!,
                Authentification.password:self.inputPasswordTextField.text!,
                Authentification.gender:selectedGender[0]]
            )
            
            // 2. 스스로를 UnwindSegue 하렴 (Main으로 가도록 함)
            
            let viewController:LogInViewController = self.storyboard!.instantiateViewController(withIdentifier: Authentification.logInStoryboardID) as! LogInViewController
            self.navigationController?.popViewController(animated: true)
            
        }else {
            // 3. if 내 값을 입력을 하지 않았을 때 SubLabel에 입력하라고 표시해
            checkBlankAlert()
        }
    }
    
    //기존에 존재하는 유저이메일 인지 확인
    func isExistUserEmail(_ inputEmail:String) {
        let realUserData = self.currentUserDatas.filter { (user) -> Bool in
            user.email == inputEmail
        }
        
        if realUserData.count != 1 {
            requestConfirmationAlert()
        }else{
            existEmailAlert()
        }
    }
    
    //존재하는 이메일 알람
    private func existEmailAlert() {
        let alert:UIAlertController = UIAlertController(title: "Oh No", message: "The email is already exist. Please choose another email address.", preferredStyle: .alert)
        let okBtn:UIAlertAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }
    
    //빈칸 없이 입력했는지 확인 알람
    
    private func checkBlankAlert() {
        let alert:UIAlertController = UIAlertController(title: "Oh No", message: "Please fill the blanks", preferredStyle: .alert)
        let okBtn:UIAlertAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }
    
    // 입력 후 내용 확인 요청 알람
    private func requestConfirmationAlert() {
        let alert:UIAlertController = UIAlertController(title: "Are you sure?", message: "Email: \(self.inputEmailTextField.text!) \n Name: \(self.inputNameTextField.text!) \n Birthday: \(self.inputbirthdayTextField.text!) \n Phone Number: \(self.inputPhoneNumberTextField.text!) \n Gender: \(self.selectedGender[0].rawValue)", preferredStyle: .actionSheet)
        
        let okBtn:UIAlertAction = UIAlertAction(title: "Confirm", style: .default) { (alert) in
            self.registerNewUser()
        }
        let cancleBtn:UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(okBtn)
        alert.addAction(cancleBtn)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //-----textField가 키보드에 가려지지 않도록 적정 위치 조절
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 180), animated: true)
    }
    
    private func getUserDatas() {
        self.currentUserDatas = UserDataCenter.shared.userDataList
    }
    
    //******************************************//
    //                 LifeCycle                //
    //******************************************//
    //MARK: Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserDatas()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
