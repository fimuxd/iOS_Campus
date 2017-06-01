//
//  LogInViewController.swift
//  LogInAndSignUpPractice
//
//  Created by Bo-Young PARK on 31/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pWTextField: UITextField!
    @IBAction func logInBtn(_ sender: UIButton) {
        logInRequest()
    }
    @IBAction func signUpBtn(_ sender: UIButton) {
    
//        let viewController:SignUpViewController = self.storyboard!.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
//        self.present(viewController, animated: true, completion: nil)
        
        let signUpVC:SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
        self.navigationController?.pushViewController(signUpVC, animated: true)


    
    }
    
    func logInRequest() {
        self.view.endEditing(true)
        if !(emailTextField.text?.isEmpty)! && !(pWTextField.text?.isEmpty)! {
            if emailTextField.text! == UserDefaults.standard.string(forKey: Authentification.email) && pWTextField.text! == UserDefaults.standard.string(forKey: Authentification.password) {
                print("로그인성공")
                
                UserDefaults.standard.set(true, forKey: Authentification.authentificationBool)
                
                self.dismiss(animated: true, completion: nil)
                
            } else {
                print("로그인실패")
                
                let alert:UIAlertController = UIAlertController(title: "Alert!", message: "존재하지 않는 아이디 또는 잘못된 패스워드", preferredStyle: .alert)
                
                let okBtn:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                
                alert.addAction(okBtn)
                self.present(alert, animated: true, completion: nil)
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 100), animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
