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
        scrollView.setContentOffset(CGPoint(x: 0, y: 50), animated: true)
    }
    
    //---Login Btn 누르면
    @IBAction func logInButtonAction(_ sender: UIButton) {
        if self.inputIDTextField.isEditing {
            self.inputPasswordTextField.resignFirstResponder()
        } else {
            self.inputPasswordTextField.resignFirstResponder()
        }
    }
    
    
    @IBAction func createUserButtonAction(_ sender: UIButton) {
        let nextViewController:SignUpViewController = storyboard?.instantiateViewController(withIdentifier: Authentification.signUpStoryboardID) as! SignUpViewController
        
        present(nextViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func findPasswordButtonAction(_ sender: UIButton) {
    }
    
    private func getUserDatas() {
        self.currentUserDatas = UserDataCenter.shared.userDataList
    }
    
    //******************************************//
    //                 LiftCycle                //
    //******************************************//
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.currentUserDatas)
        getUserDatas()
        print(self.currentUserDatas)
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

