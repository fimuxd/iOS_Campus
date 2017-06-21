//
//  ViewController.swift
//  LogInCoverPractice
//
//  Created by Bo-Young PARK on 29/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit


//최초 로그인 ViewController 입니다.

class ViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    //******************************************//
    //                  IBOutlet                //
    //******************************************//
    @IBOutlet weak var iDTextField: UITextField!
    @IBOutlet weak var pWTextField: UITextField!
    @IBOutlet weak var textFieldsScroll: UIScrollView!
    @IBOutlet weak var newAccBtn: UIButton!

    //******************************************//
    //              IBAction/함수영역              //
    //******************************************//
    //---ID TextField 상에서 return 키 누르면 PW TextField로, PW TF에선 키보드가 내려가는 method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.tag == 1 {
            pWTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldsScroll.setContentOffset(CGPoint(x: 0, y: 50), animated: true)
    }
    
    //---Login Btn 누르면
    @IBAction func LogInBtn(_ sender: UIButton) {
        
        if iDTextField.isEditing {
            pWTextField.resignFirstResponder()
        } else {
            pWTextField.resignFirstResponder()
        }
        
    }
    
    //---PresentModally 돌아오는 함수
    @IBAction func comeBackTo(loginViewController:UIStoryboardSegue) {
        
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
    
        //---textfield 설명란(기본 text. 클릭하면 사라짐)
        iDTextField.attributedPlaceholder = NSAttributedString(string: "dachè ID")
        pWTextField.attributedPlaceholder = NSAttributedString(string: "Password")
        
        //---비번치는 건 텍스트 안나오게
        pWTextField.isSecureTextEntry = true
        
        //---delegate
        iDTextField.delegate = self
        pWTextField.delegate = self
        textFieldsScroll.delegate = self
    
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

