//
//  FindPasswordViewController.swift
//  dachè
//
//  Created by Bo-Young PARK on 10/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class FindPasswordViewController: UIViewController,UITextFieldDelegate {

    //******************************************//
    //                  IBOutlet                //
    //******************************************//
    
    @IBOutlet weak var inputEmailTextField: UITextField!
    @IBOutlet weak var inputNameTextField: UITextField!
    @IBOutlet weak var inputPhoneNumberTextField: UITextField!
    
    @IBOutlet weak var continueButtonOutlet: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var currentUserDatas:[User]!
    
    //******************************************//
    //              IBAction/함수영역              //
    //******************************************//
    
    @IBAction func continueButtonAction(_ sender: UIButton) {
        checkValidUser()
    }
    
    
    private func checkValidUser() {
        if !(self.inputEmailTextField.text?.isEmpty)! && !(self.inputNameTextField.text?.isEmpty)! && !(self.inputPhoneNumberTextField.text?.isEmpty)! {
            
            let userData = self.currentUserDatas.filter({ (user) -> Bool in
                user.email == self.inputEmailTextField.text!
            })
            
            if userData.count == 1 && userData[0].name == inputNameTextField.text! && userData[0].phoneNumber == self.inputPhoneNumberTextField.text! {
                let nextViewController:ResetPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: Authentification.ResetPasswordStoryboardID) as! ResetPasswordViewController
                
                nextViewController.currentUserData = userData[0]
                
                present(nextViewController, animated: true, completion: nil)

//                performSegue(withIdentifier: Authentification.ResetPasswordStoryboardID, sender: self.continueButtonOutlet)
                
            }else if userData.count == 1 && (userData[0].name == inputNameTextField.text! || userData[0].phoneNumber == self.inputPhoneNumberTextField.text!) {
                checkUserInfo()
            }else{
                invalidUserInfoAlert()
            }
            
        }else{
            checkBlankAlert()
        }
    }
    
    
    //입력된 정보가 올바르지 않습니다. 다시 확인해주세요.
    private func checkUserInfo() {
        let alert:UIAlertController = UIAlertController(title: "Oh No", message: "Please check your name or phone number", preferredStyle: .alert)
        let okBtn:UIAlertAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }
    
    //존재하지 않는 email. 새로가입? alert
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
    
    //모든 칸을 입력해주세요 alert
    private func checkBlankAlert() {
        let alert:UIAlertController = UIAlertController(title: "Oh No", message: "Please fill the blanks", preferredStyle: .alert)
        let okBtn:UIAlertAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 50), animated: true)
    }
    
    private func getUserDatas() {
        self.currentUserDatas = UserDataCenter.shared.userDataList
    }
    
    //******************************************//
    //                 LiftCycle                //
    //******************************************//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        
        getUserDatas()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
