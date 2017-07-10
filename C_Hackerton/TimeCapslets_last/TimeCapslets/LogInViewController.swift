//
//  LogInViewController.swift
//  LogInSample
//
//  Created by Bo-Young PARK on 5/7/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit
import JSSAlertView

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    /****************************************/
    //              LifeCycle               //
    /****************************************/
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUserData()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    /****************************************/
    //           IBOutlet | 전역변수           //
    /****************************************/
    @IBOutlet weak var inputEmailTextField: UITextField!
    @IBOutlet weak var inputPassWordTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var currentUserArray:[User]!
    
    /****************************************/
    //           IBAction | Methods          //
    /****************************************/
    
    @IBAction func logInBtnAction(_ sender: UIButton) {
        logInRequest()
        print(DataCenter.shared.dataArray)
        
    }
    
    @IBAction func signUpBtnAction(_ sender: UIButton) {
        let signUpViewController:SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: Authentification.idForSignUpViewController) as! SignUpViewController
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    func logInRequest() {
        self.view.endEditing(true)
        
        //만약 모든 TextField가 채워져있다면 실행해
        if !(self.inputEmailTextField.text?.isEmpty)! && !(self.inputPassWordTextField.text?.isEmpty)! {
            
            if let userData:User = getUser(for: inputEmailTextField.text!) as? User {
                switch userData.userPassword {
                    
                case self.inputPassWordTextField.text!:
                    //                    UserDefaults.standard.set(true, forKey: Authentification.authentificationBool)
                    
                    let nextViewController:MainViewController = self.storyboard?.instantiateViewController(withIdentifier: Authentification.idForMainViewController) as! MainViewController
                    
                    let currentUserID = userData.userId
                    nextViewController.userID = currentUserID
                    
                    self.navigationController?.pushViewController(nextViewController, animated: true)
                    
                default:
                    checkIDAndPasswordAlert()
                }
            }
        }else{
            checkBlankAlert()
        }
    }
    
    //UserDataArray에서 입력한 Email과 똑같은 Email을 가진 UserData를 뽑아내줘 (근데...제대로 작동안하는거 같아요..ㅠㅠ)
    //    func getUser(for inputEmail:String) -> User? {
    //        let getUserData = self.currentUserArray.filter { (user) -> Bool in
    //            user.userEmail == inputEmail
    //        }
    //            return getUserData[0]
    //    }
    
    
    func getUser(for inputEmail:String) -> Any? {
        let realUserData = self.currentUserArray.filter { (user) -> Bool in
            user.userEmail == inputEmail
        }
        
        if realUserData.count == 1 {
            return realUserData[0]
        }else{
            return invalidUserInfoAlert()
        }
    }
    
    //아이디랑 패스워드가 다를 때 뜨는 Alert
    func checkIDAndPasswordAlert() {
        _ = JSSAlertView().show(self, title: "로그인 실패",text: "아이디 또는 비밀번호를 다시 확인하세요.", buttonText: "확인",color: UIColorFromHex(0x04B4AE, alpha: 0.8))
        
        //----- 기본 얼럿 설정 코드
        //        let alert:UIAlertController = UIAlertController(title: "로그인 실패", message: "아이디 또는 비밀번호를 다시 확인하세요.", preferredStyle: .alert)
        //        let okBtn:UIAlertAction = UIAlertAction(title: "확인", style: .default) { (alert) in
        //            self.inputEmailTextField.text = ""
        //            self.inputPassWordTextField.text = ""
        //        }
        //
        //        alert.addAction(okBtn)
        //        self.present(alert, animated: true, completion: nil)
    }
    
    //존재하지 않는 아이디를 입력했을 때 뜨는 Alert
    func invalidUserInfoAlert() {
        _ = JSSAlertView().show(self, title: "로그인 실패",text: "등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.", buttonText: "확인",color: UIColorFromHex(0x04B4AE, alpha: 0.8))
        self.inputEmailTextField.text = ""
        self.inputPassWordTextField.text = ""
        
        //----- 기본 얼럿 설정 코드
        //        let alert:UIAlertController = UIAlertController(title: "로그인 실패", message: "등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.", preferredStyle: .alert)
        //        let okBtn:UIAlertAction = UIAlertAction(title: "확인", style: .default) { (alert) in
        //            self.inputEmailTextField.text = ""
        //            self.inputPassWordTextField.text = ""
        //        }
        //
        //        alert.addAction(okBtn)
        //        self.present(alert, animated: true, completion: nil)
    }
    
    //빈칸이 있을 때 뜨는 Alert
    func checkBlankAlert() {
        
        _ = JSSAlertView().show(self, title: "알림",text: "빈칸을 모두 채워주세요", buttonText: "확인",color: UIColorFromHex(0x04B4AE, alpha: 0.8))
        
        //----- 기본 얼럿 설정 코드
        //        let alert:UIAlertController = UIAlertController(title: "알림", message: "빈칸을 모두 채워주세요", preferredStyle: .alert)
        //        let okBtn:UIAlertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        //
        //        alert.addAction(okBtn)
        //        self.present(alert, animated: true, completion: nil)
    }
    
    //TextField 수정이 끝났을 때, 키보드에 가려지지 않게 View를 올려줘
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 100), animated: true)
    }
    
    //UserData를 가져오렴
    func getUserData() {
        self.currentUserArray = DataCenter.shared.dataArray
    }
}
