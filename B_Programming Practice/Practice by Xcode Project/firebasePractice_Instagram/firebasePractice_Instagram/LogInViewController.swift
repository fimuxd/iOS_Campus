//
//  LogInViewController.swift
//  firebasePractice_Instagram
//
//  Created by Bo-Young PARK on 24/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LogInViewController:UIViewController {
    
    /********************************************/
    //                  전역변수                   //
    /********************************************/
    let headerView:UIView = {
        let headerView:UIView = UIView()
        
        return headerView
    }()
    
    let headerBackgroundImageView:UIImageView = {
        let headerBackgroundImageView:UIImageView = UIImageView()
        headerBackgroundImageView.image = #imageLiteral(resourceName: "background")
        
        let blurEffect  = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = headerBackgroundImageView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        headerBackgroundImageView.addSubview(blurEffectView)
        
        return headerBackgroundImageView
    }()
    
    let headerImageView:UIImageView = {
        let headerImageView:UIImageView = UIImageView()
        headerImageView.image = #imageLiteral(resourceName: "instagram")
        headerImageView.contentMode = .scaleAspectFit
        
        return headerImageView
    }()
    
    let fieldAreaBackgroundImageView:UIImageView = {
        let fieldAreaBackgroundImageView:UIImageView = UIImageView()
        fieldAreaBackgroundImageView.backgroundColor = .white
        
        return fieldAreaBackgroundImageView
    }()
    
    let emailTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Phone number, username or email"
        textField.layer.borderColor = UIColor.rgbColor(230, 230, 230, 1).cgColor
        textField.layer.borderWidth = 1.0
        textField.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
        textField.leftViewMode = UITextFieldViewMode.always
        textField.layer.cornerRadius = 10
        textField.backgroundColor = UIColor.rgbColor(230, 230, 230, 0.5)
        textField.font = UIFont(name: (textField.font?.fontName)!, size: 13.5)
        
        //        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return textField
    }()
    
    let passwordTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.layer.borderColor = UIColor.rgbColor(230, 230, 230, 1).cgColor
        textField.layer.borderWidth = 1.0
        textField.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
        textField.leftViewMode = UITextFieldViewMode.always
        textField.layer.cornerRadius = 10
        textField.backgroundColor = UIColor.rgbColor(230, 230, 230, 0.5)
        textField.font = UIFont(name: (textField.font?.fontName)!, size: 13.5)
        textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    let logInButton:UIButton = {
        let button = UIButton(type: .system)
        button.isEnabled = false
        button.backgroundColor = UIColor.rgbColor(230, 230, 230, 1)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 10
        //버튼의 액션 추가
        button.addTarget(self, action: #selector(logInActionHandle), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let doNotHaveAnAccountButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Don't have an account? Sign up.", for: .normal)
        button.setTitleColor(UIColor.rgbColor(84, 149, 233, 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        //버튼의 액션 추가
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        
        return stackView
    }()
    
    
    /********************************************/
    //                  method                   //
    /********************************************/
    
    func logInActionHandle() {
        print("action LogInButton")
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if let error = error {
                print("error://", error)
                return
            }
            
            //success
            print("userID", user?.uid)
            self.navigationController?.dismiss(animated: true, completion: nil)
            
            //mainPage이동
            UIApplication.shared.keyWindow?.rootViewController = MainTabBarViewController()
        }
    }
    
    fileprivate func setUpSubViewsLayout() {
        //        headerView.anchor(top: view.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 20, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: view.frame.width, height: view.frame.height/5, centerX: view.centerXAnchor, centerY: nil)
        
        headerBackgroundImageView.anchor(top: nil, left: nil, right: nil, bottom: nil, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: view.frame.width, height: view.frame.height, centerX: view.centerXAnchor, centerY: view.centerYAnchor)
        
        headerImageView.anchor(top: view.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 20, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: view.frame.width*1/2, height: view.frame.width*1/2*5/8, centerX: view.centerXAnchor, centerY: nil)
        
        fieldAreaBackgroundImageView.anchor(top: headerImageView.bottomAnchor, left: nil, right: nil, bottom: nil, topConstant: 10, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: view.frame.width, height: view.frame.height, centerX: view.centerXAnchor, centerY: nil)
        
        stackView.anchor(top: fieldAreaBackgroundImageView.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 40, leftConstant: 40, rightConstant: 40, bottomConstant: 0, width: 0, height: 220, centerX: nil, centerY: nil)
    }
    
    func handleTextInputChange() {
        let isFormValid  = emailTextField.text?.characters.count ?? 0 > 0 && passwordTextField.text?.characters.count ?? 0 > 0
        
        if isFormValid {
            logInButton.isEnabled = true
            logInButton.backgroundColor = UIColor.rgbColor(84, 149, 233, 1)
        }else{
            logInButton.isEnabled = false
            logInButton.backgroundColor = UIColor.rgbColor(230, 230, 230, 1)
        }
        
    }
    
    func handleSignUp() {
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    /********************************************/
    //                LifeCycle                 //
    /********************************************/
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.isHidden = true

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        //        view.addSubview(headerView)
        view.addSubview(headerBackgroundImageView)
        view.addSubview(headerImageView)
        view.addSubview(fieldAreaBackgroundImageView)
        
        stackView.addArrangedSubViews([emailTextField, passwordTextField, logInButton, doNotHaveAnAccountButton])
        
        view.addSubview(stackView)
        
        setUpSubViewsLayout()
    }
}
