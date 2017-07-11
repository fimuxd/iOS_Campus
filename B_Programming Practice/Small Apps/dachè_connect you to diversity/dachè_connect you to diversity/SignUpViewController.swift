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
    
    @IBOutlet weak var birthdayDatePickerOutlet: UIDatePicker!
    
    @IBOutlet weak var signUpButtonOutlet: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var currentUserDatas:[User]!
    internal var selectedGender:[String] = [""]
    
    private var dateFormatter:DateFormatter = DateFormatter()
    
    
    //******************************************//
    //              IBAction / 함수              //
    //******************************************//
    
    @IBAction func inputGenderSegmentedControlAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            self.selectedGender[0] = Gender.female.rawValue
            print(selectedGender)
        }else{
            self.selectedGender[0] = Gender.male.rawValue
            print(selectedGender)
        }
    }
    
    @IBAction func birthdayDatePicker(_ sender: UIDatePicker) {
        self.dateFormatter.dateFormat = "dd MMMM, yyyy"
        self.inputbirthdayTextField.text = self.dateFormatter.string(from: sender.date)
    }
    
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        isExistUserEmail(self.inputEmailTextField.text!)
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //-----회원가입 요청시 실행 함수
    func registerNewUser() {
        self.view.endEditing(true)
        
        // 1. 모든 TextField가 빈칸이 아니고, 동시에 Password와 Confirm Password의 String 이 같다면, UserDate add 해주겠니?
        if !(self.inputEmailTextField.text?.isEmpty)! && !(self.inputNameTextField.text?.isEmpty)! && !(self.inputbirthdayTextField.text?.isEmpty)! && !(self.inputPhoneNumberTextField.text?.isEmpty)! && self.inputGenderSegmentedControlOutlet.isSelected && !(self.inputPasswordTextField.text?.isEmpty)! && !(self.inputConfirmPasswordTextField.text?.isEmpty)! && self.inputPasswordTextField.text! == self.inputConfirmPasswordTextField.text! {
            
            UserDataCenter.shared.addUserData([Authentification.id:UserDataCenter.shared.userDataList.count,
                                               Authentification.email:self.inputEmailTextField.text!,
                                               Authentification.name:self.inputNameTextField.text!,
                                               Authentification.birthday:self.birthdayDatePickerOutlet.date,
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
        let alert:UIAlertController = UIAlertController(title: "Are you sure?", message: "Email: \(self.inputEmailTextField.text!) \n Name: \(self.inputNameTextField.text!) \n Birthday: \(self.inputbirthdayTextField.text!) \n Phone Number: \(self.inputPhoneNumberTextField.text!) \n Gender: \(self.selectedGender[0])", preferredStyle: .actionSheet)
        
        let okBtn:UIAlertAction = UIAlertAction(title: "Confirm", style: .default) { (alert) in
            self.registerNewUser()
        }
        let cancleBtn:UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(okBtn)
        alert.addAction(cancleBtn)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //-----textField가 키보드에 가려지지 않도록 적정 위치 조절
    internal func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.inputEmailTextField.tag = 0
        self.inputNameTextField.tag = 0
        self.inputbirthdayTextField.tag = 1
        self.inputPhoneNumberTextField.tag = 2
        self.inputPasswordTextField.tag = 2
        self.inputConfirmPasswordTextField.tag = 2
        
        switch textField.tag {
        case 0:
            self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            self.birthdayDatePickerOutlet.isHidden = true
            return true
        case 1:
            self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            self.birthdayDatePickerOutlet.isHidden = false
            textField.endEditing(true)
            self.view.endEditing(true)
            return false
        case 2:
            self.scrollView.setContentOffset(CGPoint(x: 0, y: 180), animated: true)
            self.birthdayDatePickerOutlet.isHidden = true
            return true
        default:
            print("넌 머야")
            return false
        }
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
        self.birthdayDatePickerOutlet.isHidden = true
        self.birthdayDatePickerOutlet.backgroundColor = .white
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
