//
//  DetailViewController.swift
//  TimeCapslets
//
//  Created by Bo-Young PARK on 7/7/2017.
//  Copyright © 2017 IosCamp. All rights reserved.
//

import UIKit
import JSSAlertView

class DetailViewController: UIViewController, UITextViewDelegate {
    
    /****************************************/
    //              LifeCycle               //
    /****************************************/
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUserData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserData()
        contentTextField.text = "새로운 메모를 입력하세요"
        contentTextField.textColor = UIColor.lightGray
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    /****************************************/
    //           IBOutlet | 전역변수           //
    /****************************************/
    @IBOutlet weak var contentTextField:UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageSaveBtnOutlet: UIButton!
    
    private var currentUserArray:[User]!
    var userID:Int?
    
    /****************************************/
    //           IBAction | Methods          //
    /****************************************/
    @IBAction func AddPageBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func AddPageDoneButton(_ sender: Any) {
        warningAlert()
    }
    
    //ImagePicker 구현하고 싶었지만 시간 부족
    @IBAction func imageSaveBtnAction(_ sender: UIButton) {
    }
    
    
    //TextView의 Storyboard에는 없는 placeholder의 기능을 구현하기 위한 함수
    func textViewDidBeginEditing(_ textView: UITextView) {
        if contentTextField.textColor == UIColor.lightGray {
            contentTextField.text = ""
            contentTextField.textColor = UIColor.black
        }
    }
    /*
     func registerNewUser() {
     self.view.endEditing(true)
     
     if !(inputNewEmailTextField.text?.isEmpty)! && !(inputNewPasswordTextField.text?.isEmpty)! && inputNewPasswordTextField.text! == inputConfirmPasswordTextField.text! {
     
     DataCenter.shared.addUser([Authentification.plistId:DataCenter.shared.dataArray.count,
     Authentification.plistEmail:self.inputNewEmailTextField.text!,
     Authentification.plistPassword:self.inputNewPasswordTextField.text!,
     
     ]
     )
     
     
     let viewController:LogInViewController = self.storyboard?.instantiateViewController(withIdentifier: Authentification.idForLogInViewController) as! LogInViewController
     self.navigationController?.popViewController(animated: true)
     
     }else{
     
     checkBlankAlert()
     
     }
     
     }
     
     */
    //저장
    func addMemo() {
        self.view.endEditing(true)
        var count:Int = 0
        
        if !(self.contentTextField.text!.isEmpty) {
            let addedContent:String = contentTextField.text!

            var memoList = UserDefaults.standard.array(forKey: "\(userID!) memoList") as? [[String:Any]] ?? [[:]]
            
            let memo: [String:Any] = ["memoDate":count+1, "content":addedContent]
            
            memoList.append(memo)
            UserDefaults.standard.set(memoList, forKey: "\(userID!) memoList")
            
            count += 1
            
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    func warningAlert() {
        
        let alertview = JSSAlertView().show(self, title: "경고",text: "지금 저장하면 1년동안 절대 확인할 수 없습니다. 정말 저장하시겠어요?", buttonText: "확인", cancelButtonText: "취소",color: UIColorFromHex(0x04B4AE, alpha: 0.8))
        alertview.addAction(self.addMemo)
        
        
//        let alert:UIAlertController = UIAlertController(title: "경고", message: "지금 저장하면 1년동안 절대 확인할 수 없습니다. 정말 저장하시겠어요?", preferredStyle: .alert) //하늘님: "1년" 부분에 오늘 날짜에서 10000 더한 것이 들어가게
//        let confirmBtn:UIAlertAction = UIAlertAction(title: "확인", style: .default) { (alert) in
//            self.addMemo()
//            
//            self.navigationController?.popViewController(animated: true)
//        }
//        let cancelBtn:UIAlertAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
//        
//        alert.addAction(confirmBtn)
//        alert.addAction(cancelBtn)
//        
//        self.present(alert, animated: true, completion: nil)
    }
    
    func getUserData() {
        self.currentUserArray = DataCenter.shared.dataArray
    }
}
