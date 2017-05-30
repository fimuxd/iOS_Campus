//
//  ViewController.swift
//  UserDefaults
//
//  Created by Bo-Young PARK on 30/5/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    
    
    /***********************************************************************************/
    //                      수업시간에 해본 간단한 예제_UserDefault 이해하기                     //
    /***********************************************************************************/
    
    // @IBOutlet weak var nameResultLabel: UILabel!
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //
    //        UserDefaults.standard.set("Bo-Young", forKey: "First Name")
    //        UserDefaults.standard.set("Park", forKey: "Last Name")
    //        UserDefaults.standard.set(31, forKey: "Age")
    
    //        let firstName:String = UserDefaults.standard.string(forKey: "First Name")!
    //        let lastName:String = UserDefaults.standard.string(forKey: "Last Name")!
    //        let age:Int = UserDefaults.standard.object(forKey: "Age") as! Int
    //
    //        nameResultLabel.text = "이름 : \(lastName)" + "\( firstName)" + ". 나이는 \(age) 입니다."
    //     }
    
    
    
    /***********************************************************************************/
    //          자습_UITextFieldDelegate & UserDefault & Present Modally 활용             //
    /***********************************************************************************/
    
    
    // 성, 이름, 나이에 대한 TextField 연결
    @IBOutlet weak var lNTextField: UITextField!
    @IBOutlet weak var fNTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TextField에서 Return Key 눌렀을 때, 다음 TF로 넘어가다가 마지막에는 키보드가 내려가는 method 구현을 위한 Delegate 설정
        lNTextField.delegate = self
        fNTextField.delegate = self
        ageTextField.delegate = self
        
    }
    
    // TextField에서 Return Key 눌렀을 때, 다음 TF로 넘어가다가 마지막에는 키보드가 내려가는 method 구현
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 1 {
            fNTextField.becomeFirstResponder()
        }else if textField.tag == 2 {
            ageTextField.becomeFirstResponder()
        }else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    
    // '입력' 버튼을 눌렀을 때, TextField 상에 입력한 각각의 내용들이 UserDefault 상에 저장되도록 method 설정
    @IBAction func inputBtn(_ sender: UIButton) {

            //1. UserDefault Set을 먼저 해주어야 한다
            UserDefaults.standard.set(lNTextField.text, forKey: "Last Name")
            UserDefaults.standard.set(fNTextField.text, forKey: "First Name")
            UserDefaults.standard.set(ageTextField.text, forKey: "Age")
            
        //2. Set된 UserDefualt의 Key값에 대한 변수 설정
        let lastName:String = UserDefaults.standard.string(forKey: "Last Name")!
        let firstName:String = UserDefaults.standard.string(forKey: "First Name")!
        let age:String = UserDefaults.standard.string(forKey: "Age")!

        
        //3. 제대로 저장되었는지 확인용ㅋㅋ
            print(lastName)
            print(firstName)
            print(age)
    
    
    }
    
    
    // UserDefault에 저장된 값 Data를 MainVC로 Segua할 때, 넘겨준 다음 MainVC에 있는 Label에 표시되도록 하려고 함
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mainVC:MainViewController = segue.destination as! MainViewController
        mainVC.data1 = lNTextField.text
        mainVC.data2 = fNTextField.text
        
    }
    
    
    //Segue Rewind(Dismiss)
    @IBAction func rewindSegue(backToVC:UIStoryboardSegue) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

