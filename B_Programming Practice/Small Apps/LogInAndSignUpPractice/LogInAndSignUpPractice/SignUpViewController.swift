//
//  SignUpViewController.swift
//  LogInAndSignUpPractice
//
//  Created by Bo-Young PARK on 31/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Button & Labels
    
    @IBAction func dismissBtn(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var eMailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var pWTextField: UITextField!
    @IBOutlet weak var cPWTextField: UITextField!
    
    @IBOutlet weak var subLabel: UILabel!
    
    
    
    
    // MARK: - SingUp Btn Action
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        self.signUpRequest()
    }
    
    
    // MARK: - SignUp Btn에 들어갈 함수 설정
    func signUpRequest() {
        self.view.endEditing(true)
        
        // 1. 모든 TextField가 빈칸이 아니고, 동시에 Password와 Confirm Password의 String 이 같다면, UserDefault 해주겠니?
        if !(eMailTextField.text?.isEmpty)! && !(nameTextField.text?.isEmpty)! && !(pWTextField.text?.isEmpty)! && pWTextField.text! == cPWTextField.text! {
            
            UserDefaults.standard.set(eMailTextField.text!, forKey: Authentification.email)
            UserDefaults.standard.set(nameTextField.text!, forKey: Authentification.name)
            UserDefaults.standard.set(pWTextField.text!, forKey: Authentification.password)
            
            // 2. 스스로를 UnwindSegue 하렴 (Main으로 가도록 함)
            self.performSegue(withIdentifier: "UnwindSegue", sender: self)
            
        }else {
            
            // 3. if 내 값을 입력을 하지 않았을 때 SubLabel에 입력하라고 표시해
            self.subLabel.text = "fill blank"
        }
    }
    
    // MARK: - TextField Return Action
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField.tag = 1 {
//            
//        }
//    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 180), animated: true)
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
