//
//  SignUpViewController.swift
//  LogInSample
//
//  Created by Bo-Young PARK on 5/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

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
    @IBOutlet weak var inputNewEmailTextField: UITextField!
    @IBOutlet weak var inputNewNameTextField: UITextField!
    @IBOutlet weak var inputNewPasswordTextField: UITextField!
    @IBOutlet weak var inputConfirmPasswordTextField: UITextField!
    @IBOutlet weak var inputNewPhoneNumberTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    /****************************************/
    //           IBAction | Methods          //
    /****************************************/

    @IBAction func continueBtnAction(_ sender: UIButton) {
        requestConfirmationAlert()
        
    }
    
    //-----새로운 유저를 등록하는 함수
    func registerNewUser() {
        self.view.endEditing(true)
        
        if !(inputNewEmailTextField.text?.isEmpty)! && !(inputNewNameTextField.text?.isEmpty)! && !(inputNewPasswordTextField.text?.isEmpty)! && !(inputNewPhoneNumberTextField.text?.isEmpty)! && inputNewPasswordTextField.text! == inputConfirmPasswordTextField.text! {
            
            DataCenter.shared.addUser(["user_ID":DataCenter.shared.dataArray.count,
                                       "user_email":self.inputNewEmailTextField.text!,
                                       "user_name":self.inputNewNameTextField.text!,
                                       "user_password":self.inputNewPasswordTextField.text!,
                                       "user_phoneNumber":inputNewPhoneNumberTextField.text!])
        
            let viewController:MainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            self.navigationController?.dismiss(animated: true, completion: nil)
        
        }else{
            
            checkBlankAlert()
            
        }
        
    }
    
    //-----입력 후 내용 확인 요청 알람
    func requestConfirmationAlert() {
        let alert:UIAlertController = UIAlertController(title: "확인해주세요", message: "입력한 내용이 맞습니까? \n email: \(inputNewEmailTextField.text!) \n 이름: \(inputNewNameTextField.text!) \n 연락처: \(inputNewPhoneNumberTextField.text!)", preferredStyle: .actionSheet)
        
        let confirmBtn:UIAlertAction = UIAlertAction(title: "확인", style: .default) { (alert:UIAlertAction) in
            self.registerNewUser()
        }
        let cancelBtn:UIAlertAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(confirmBtn)
        alert.addAction(cancelBtn)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //-----빈칸 없이 입력했는지 확인 알람
    func checkBlankAlert() {
        let alert:UIAlertController = UIAlertController(title: "알림", message: "빈칸을 모두 채워주세요", preferredStyle: .alert)
        let okBtn:UIAlertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }

    //-----키보드가 올라오면 텍스트 필드를 올리는 delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 100), animated: true)
    }
    

}
