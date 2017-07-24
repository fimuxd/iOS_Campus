//
//  SignUpViewController.swift
//  firebasePractice_Instagram
//
//  Created by Bo-Young PARK on 24/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class SignUpViewController:UIViewController {
    
    /********************************************/
    //                  전역변수                   //
    /********************************************/
    
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
    
    let photoButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.rgbColor(230, 230, 230, 0.5)
//        button.setTitle("+", for: .normal)
        //        button.setTitleColor(UIColor.init(red: 1, green: 0, blue: 0.502, alpha: 1), for: .normal)
//        button.setTitleColor(UIColor.rgbColor(230, 230, 230, 1), for: .normal)
//        button.titleLabel?.font = UIFont(name: (button.titleLabel?.font.fontName)!, size: 100)
        button.setImage(#imageLiteral(resourceName: "add_profile"), for: .normal)
        
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor.rgbColor(230, 230, 230, 1).cgColor
        
        //버튼의 액션 추가
        button.addTarget(self, action: #selector(photoActionHandle), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false //얘를 false 시켜야만 autolayout(하기 viewDidLoad에 적용한 anchor들)이 적용된다.
        
        return button
    }() // 클로저로 만든 것을 바로 실행한 것
    
    
    let emailTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.layer.borderColor = UIColor.rgbColor(230, 230, 230, 1).cgColor
        textField.layer.borderWidth = 1.0
        textField.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
        textField.leftViewMode = UITextFieldViewMode.always
        textField.layer.cornerRadius = 10
        textField.backgroundColor = UIColor.rgbColor(230, 230, 230, 0.3)
        textField.font = UIFont(name: (textField.font?.fontName)!, size: 13.5)
        
        //        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    let userNameTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.layer.borderColor = UIColor.rgbColor(230, 230, 230, 1).cgColor
        textField.layer.borderWidth = 1.0
        textField.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
        textField.leftViewMode = UITextFieldViewMode.always
        textField.layer.cornerRadius = 10
        textField.backgroundColor = UIColor.rgbColor(230, 230, 230, 0.3)
        textField.font = UIFont(name: (textField.font?.fontName)!, size: 13.5)
        
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
        textField.backgroundColor = UIColor.rgbColor(230, 230, 230, 0.3)
        textField.font = UIFont(name: (textField.font?.fontName)!, size: 13.5)
        
        return textField
    }()
    
    let signUpButton:UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.rgbColor(84, 149, 233, 1)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 10
        //버튼의 액션 추가
        button.addTarget(self, action: #selector(signUpActionHandle), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()
    
    
    /********************************************/
    //                  method                   //
    /********************************************/
    
    //버튼의 액션 함수
    func photoActionHandle() {
        print("action PhotoButton")
    }
    
    func signUpActionHandle() {
        print("action SignUpButton")
    }
    
    
    
    // 레이아웃 부분을 함수로 따로 저장
    fileprivate func setUpSubViewsLayout() {
        //        photoButton.frame = CGRect(x: 10, y: 10, width: 100, height: 100) //프레임 베이스가 아닌 오토레이아웃을 쓸거기 때문에 주석 처리
        
        //오토레이아웃 코드로 설정하기. 보통은 NSLayoutConstraint로 알고 있었지만, Anchor라는 놈을 쓰면 쪼금 쉬울 수 있다.
        //UIView의 extension에 가면 NSLayoutAchor로 되어있는 녀석들을 볼 수 있다.
        //단점은 모든 기능을 커버하지 않는다는 것 (예. ratio). iOSVerson 9. 대부터 적용가능
        //싫으면 NSLayoutConstraint로 사용
        
        //        //        photoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20) //default는 margin 없는 것
        //        photoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        //        photoButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        //        photoButton.heightAnchor.constraint(equalToConstant: 120).isActive = true
        //        photoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //extension 사용하여 간단하게
        
        headerBackgroundImageView.anchor(top: nil, left: nil, right: nil, bottom: nil, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: view.frame.width, height: view.frame.height, centerX: view.centerXAnchor, centerY: view.centerYAnchor)
        
        photoButton.anchor(top: view.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 80, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: view.frame.width/4, height: view.frame.width/4, centerX: view.centerXAnchor, centerY: nil)
        
        stackView.anchor(top: photoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 40, leftConstant: 40, rightConstant: 40, bottomConstant: 0, width: 0, height: 200, centerX: nil, centerY: nil)
        
        photoButton.layer.cornerRadius = view.frame.width/4/2
        
        
    }
    
    
    /********************************************/
    //                LifeCycle                 //
    /********************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(headerBackgroundImageView)
        view.addSubview(photoButton)
        
        stackView.addArrangedSubViews([emailTextField, userNameTextField, passwordTextField, signUpButton])
        view.addSubview(stackView)
        
        setUpSubViewsLayout()
        
        //        //StackVIew
        //        let stackView = UIStackView(arrangedSubviews: [emailTextField, userNameTextField, passwordTextField])
        //        stackView.axis = .vertical
        //        stackView.distribution = .fillEqually
        //        stackView.translatesAutoresizingMaskIntoConstraints = false
        //        stackView.backgroundColor = .red
        //        stackView.spacing = 10
        
        
        //        stackView.topAnchor.constraint(equalTo: photoButton.bottomAnchor, constant: 20).isActive = true
        //        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        //        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        //        stackView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        
        
        
    }
    
}
