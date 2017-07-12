//
//  ResetPasswordViewController.swift
//  dachè_connect you to diversity
//
//  Created by Bo-Young PARK on 12/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController, UITextFieldDelegate {
    //******************************************//
    //                  IBOutlet                //
    //******************************************//
    
    @IBOutlet weak var inputPasswordTextField: UITextField!
    @IBOutlet weak var inputConfirmPasswordTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var currentUserData:User?
    
    private var currentUserDatas:[User]!
    
    //******************************************//
    //              IBAction/함수영역              //
    //******************************************//
    
    @IBAction func confirmButtonAction(_ sender: UIButton) {
        confirmToChangePassword()
    }
    
    
    
    private func confirmToChangePassword() {
        if !(self.inputPasswordTextField.text?.isEmpty)! && !(self.inputConfirmPasswordTextField.text?.isEmpty)! {
            
            if self.inputConfirmPasswordTextField.text! == self.inputPasswordTextField.text! {
                
                UserDataCenter.shared.modifyUserData(id: (self.currentUserData?.id)!, keyOfDatas: Authentification.password, to: self.inputPasswordTextField.text!)
                
                let nextViewController:LogInViewController = self.storyboard?.instantiateViewController(withIdentifier: Authentification.logInStoryboardID) as! LogInViewController
                present(nextViewController, animated: true, completion: nil)
                
            }else{
                checkPasswordAlert()
            }
            
        }else{
            checkBlankAlert()
        }
    }
    
    private func checkPasswordAlert() {
        let alert:UIAlertController = UIAlertController(title: "Oh No", message: "Please check password.", preferredStyle: .alert)
        let okBtn:UIAlertAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }
    
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

        getUserDatas()
        print(self.currentUserData!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    



}
