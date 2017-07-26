//
//  SignUpViewController.swift
//  firebasePractice_Instagram
//
//  Created by Bo-Young PARK on 24/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage

class SignUpViewController:UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
        textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
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
        textField.backgroundColor = UIColor.rgbColor(230, 230, 230, 0.3)
        textField.font = UIFont(name: (textField.font?.fontName)!, size: 13.5)
        textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    let signUpButton:UIButton = {
        let button = UIButton(type: .system)
        //        button.backgroundColor = UIColor.rgbColor(84, 149, 233, 1)
        button.isEnabled = false
        button.backgroundColor = UIColor.rgbColor(230, 230, 230, 0.8)
        button.setTitle("SignUp", for: .normal)
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
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true // 기본 이미지가 너무 커서 이미지를 crop 하고 싶을 때
        
        self.present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // 선택을 했을 때 들어오는 정보 확인
        print("info://", info) // ["UIImagePickerControllerMediaType": public.image,
        //  "UIImagePickerControllerReferenceURL": assets-library://asset/asset.JPG?id=106E99A1-4F6A-45A2-B320-B0AD4A8E8473&ext=JPG,
        //  "UIImagePickerControllerOriginalImage": <UIImage: 0x6080002905e0> size {4288, 2848} orientation 0 scale 1.000000]
        
        
        guard let image = info["UIImagePickerControllerEditedImage"] as? UIImage else {return}
        
        image.withRenderingMode(.alwaysOriginal)
        photoButton.setImage(image, for: .normal)
        photoButton.clipsToBounds = true
        self.dismiss(animated: true, completion: nil)
    }
    
    func signUpActionHandle() {
        print("action SignUpButton")
        
        //        guard let email = emailTextField.text else {return}
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if let error = error {
                print("error://",error)
                return
            }
            
            guard let userName = self.userNameTextField.text else {return}
            
            //success
            guard let uid = user?.uid else {return}
            
            guard let image = self.photoButton.imageView?.image else {return}
            guard let uploadData = UIImageJPEGRepresentation(image, 0.3) else {return}
            
            let uuid = UUID().uuidString //코드가 실행될 때마다 계속 새롭게 생성되는 숫자
            
            Storage.storage().reference().child("ProfileImage").child(uuid).putData(uploadData, metadata: nil, completion: { (metaData, error) in
                
                if let error = error {
                    print("error://", error)
                    return
                }
                
                print("metaData://", metaData)
                
                guard let urlStr = metaData?.downloadURL()?.absoluteString else {return}
                print(urlStr)
                
                Database.database().reference().child(uid).updateChildValues(["email":self.emailTextField.text!, "userName":self.userNameTextField.text!, "profileImage":urlStr], withCompletionBlock: { (error, ref) in
                    print("database error://", error)
                    print("database reference://", ref)
                    
                    
                    //DataCenter로 옮겨서 주석처리함
                    //                    guard let uid = Auth.auth().currentUser?.uid else {return}
                    //                    Database.database().reference().child(uid).child("UserInfo").observeSingleEvent(of: .value, with: { (snapShot) in
                    //                        let dic = snapShot.value as? [String:Any]
                    //                        print(dic)
                    //                    })
                    
                    //mainPage이동
                    self.navigationController?.popViewController(animated: true)
                })
                
            })
            
            
            //
            //            print("userData://",user)
            //            print("error://",error)
            
            
            
        }
        
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
        
        photoButton.anchor(top: view.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 100, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: view.frame.width/4, height: view.frame.width/4, centerX: view.centerXAnchor, centerY: nil)
        
        stackView.anchor(top: photoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 40, leftConstant: 40, rightConstant: 40, bottomConstant: 0, width: 0, height: 200, centerX: nil, centerY: nil)
        
        photoButton.layer.cornerRadius = view.frame.width/4/2
        
        
    }
    
    func handleTextInputChange() {
        let isFormValid  = emailTextField.text?.characters.count ?? 0 > 0 && userNameTextField.text?.characters.count ?? 0 > 0 && passwordTextField.text?.characters.count ?? 0 > 0
        
        if isFormValid {
            signUpButton.isEnabled = true
            signUpButton.backgroundColor = UIColor.rgbColor(84, 149, 233, 1)
        }else{
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = UIColor.rgbColor(230, 230, 230, 1)
        }
        
    }
    
    
    
    
    
    /********************************************/
    //                LifeCycle                 //
    /********************************************/
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
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
