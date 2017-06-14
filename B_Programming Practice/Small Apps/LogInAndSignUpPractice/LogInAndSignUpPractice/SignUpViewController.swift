//
//  SignUpViewController.swift
//  LogInAndSignUpPractice
//
//  Created by Bo-Young PARK on 31/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//


// 지금 현재는 유저를 1명만 둘 수 있다. 계속 덮어쓰기 하므로
// 여러 유저를 쓸 수 있는 방법? > user라는 dictionary를 가지는 array를 만든다.



import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    /******************************************************************************/
    //                                 IBOutlet                                   //
    /******************************************************************************/
    
    @IBOutlet weak var eMailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var pWTextField: UITextField!
    @IBOutlet weak var cPWTextField: UITextField!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    /******************************************************************************/
    //                                 IBAction                                   //
    /******************************************************************************/
    
    @IBAction func dismissBtn(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
     setAlert()
        
    }
    
    
    /******************************************************************************/
    //                                 함수 모음                                     //
    /******************************************************************************/
    
    func signUpRequest() {
        self.view.endEditing(true)
        
        // 1. 모든 TextField가 빈칸이 아니고, 동시에 Password와 Confirm Password의 String 이 같다면, UserDefault 해주겠니?
        if !(eMailTextField.text?.isEmpty)! && !(nameTextField.text?.isEmpty)! && !(pWTextField.text?.isEmpty)! && pWTextField.text! == cPWTextField.text! {
            
            UserDefaults.standard.set(eMailTextField.text!, forKey: Authentification.email)
            UserDefaults.standard.set(nameTextField.text!, forKey: Authentification.name)
            UserDefaults.standard.set(pWTextField.text!, forKey: Authentification.password)
            
            // 2. 스스로를 UnwindSegue 하렴 (Main으로 가도록 함)
            
            let viewController:MainViewController = self.storyboard!.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            self.navigationController?.dismiss(animated: true, completion: nil)
            
        }else {
            
            // 3. if 내 값을 입력을 하지 않았을 때 SubLabel에 입력하라고 표시해
            self.subLabel.text = "fill blank"
        }
    }
    
    func setAlert() {
        let alert:UIAlertController = UIAlertController(title: "Confirm SignUp", message: "입력한 내용이 맞습니까? \n ID: \(eMailTextField.text!), PW:\(pWTextField.text!)", preferredStyle: .actionSheet)
        
        let okBtn:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: {(alert:UIAlertAction) in self.signUpRequest() })
        let cancleBtn:UIAlertAction = UIAlertAction(title: "NO", style: .cancel, handler: nil)
        
        alert.addAction(okBtn)
        alert.addAction(cancleBtn)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    /******************************************************************************/
    //                                 LifeCycle                                  //
    /******************************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 180), animated: true)
    }
    
    
}
