//
//  DetailViewController.swift
//  FriendList
//
//  Created by youngmin joo on 2017. 6. 26..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate{
    
    /******************************************/
    //            IBOutlet | 전역변수           //
    /******************************************/
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var saveOrEditBtnOutlet: UIButton!
    @IBOutlet weak var genderPickerViewOutlet: UIPickerView!
    @IBOutlet var genderPickerView: [UIPickerView]!
    
    var name:String?
    var age:String?
    var gender:String?
    var rowForIndexPath:Int?
    
    var genderList:[String] = ["남성", "여성"]
    
    /******************************************/
    //            IBAction | Methods          //
    /******************************************/
    
    @IBAction func saveOrEditBtn(_ sender: UIButton) {
        if saveOrEditBtnOutlet.titleLabel?.text == "추가" {
            setConfirmAleart()
        }else if saveOrEditBtnOutlet.titleLabel?.text == "수정"{
            self.nameTextField.isUserInteractionEnabled = true
            self.genderTextField.isUserInteractionEnabled = true
            self.ageTextField.isUserInteractionEnabled = true
            
            self.saveOrEditBtnOutlet.setTitle("저장", for: .normal)
        }else{
            setConfirmAleart()
        }
        
    }
    
    
    //----- "저장" 버튼을 눌렀을 때, Alert이 뜨도록 하는 method 입니다.
    //-----   1) 모든 값을 입력하였으면, 값 확인 후 저장할 수 있는 Alert
    //-----   2) 그렇지 않을 땐, 값을 입력하라는 Alert
    func setConfirmAleart() {
        if !(nameTextField.text?.isEmpty)! && !(genderTextField.text?.isEmpty)! && !(ageTextField.text?.isEmpty)! && self.saveOrEditBtnOutlet.titleLabel?.text == "추가" {
            let confirmAlert:UIAlertController = UIAlertController(title: "확인", message: "입력한 내용이 맞습니까? \n 이름: \(nameTextField.text!) \n 성별: \(genderTextField.text!) \n 나이: \(ageTextField.text!)", preferredStyle: .alert)
            
            let okBtn:UIAlertAction = UIAlertAction(title: "네", style: .default, handler: {(alert:UIAlertAction) in
                
                //  (조교님) 이렇게 하면 뷰가 계속 쌓이게 되므로 좋지 않은 방법.
                //                let viewController:UINavigationController = self.storyboard?.instantiateViewController(withIdentifier: "MainNavigationController") as! UINavigationController
                //                self.present(viewController, animated: true, completion: nil)
                
                self.saveNewPersonData()
                self.navigationController?.popViewController(animated: true)
            })
            
            let cancleBtn:UIAlertAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
            
            confirmAlert.addAction(okBtn)
            confirmAlert.addAction(cancleBtn)
            
            self.present(confirmAlert, animated: true, completion: nil)
        }else if !(nameTextField.text?.isEmpty)! && !(genderTextField.text?.isEmpty)! && !(ageTextField.text?.isEmpty)! && self.saveOrEditBtnOutlet.titleLabel?.text == "저장"{
            let confirmAlert:UIAlertController = UIAlertController(title: "확인", message: "수정한 내용이 맞습니까? \n 이름: \(nameTextField.text!) \n 성별: \(genderTextField.text!) \n 나이: \(ageTextField.text!)", preferredStyle: .alert)
            
            let okBtn:UIAlertAction = UIAlertAction(title: "네", style: .default, handler: {(alert:UIAlertAction) in
                
                self.editPersonData()
                self.navigationController?.popViewController(animated: true)
            })
            
            let cancleBtn:UIAlertAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
            
            confirmAlert.addAction(okBtn)
            confirmAlert.addAction(cancleBtn)
            
            self.present(confirmAlert, animated: true, completion: nil)
            
            
            
        }else{
            let denyAlert:UIAlertController = UIAlertController(title: "경고", message: "모든 값을 정확히 입력하세요.", preferredStyle: .alert)
            
            let okBtn:UIAlertAction = UIAlertAction(title: "확인", style: .default , handler: nil)
            
            denyAlert.addAction(okBtn)
            self.present(denyAlert, animated: true, completion: nil)
        }
    }
    
    
    //각 텍스트 필드의 값들을 Person의 property에 입력하여, 각각의 Person 객체를 만들고 DataFile(Singleton) 에 저장합니다.
    
    func saveNewPersonData () {
        
        let name:String = self.nameTextField.text!
        let age:Int = Int(self.ageTextField.text!)!
        
        let gender:(String) -> Gender = {(genderStr:String) -> Gender in
            if self.genderTextField.text! == "남성" {
                return .Man
            }else{
                return .Woman
            }
        }
        
        let newPerson:Person = Person(name: name, gender: gender(self.genderTextField.text!), age: age)
        
        DataFile.sharedData.friendsList.append(newPerson)
        
        print(DataFile.sharedData.friendsList)
    }
    
    func editPersonData() {
        
        let name:String = self.nameTextField.text!
        let age:Int = Int(self.ageTextField.text!)!
        
        let gender:(String) -> Gender = {(genderStr:String) -> Gender in
            if self.genderTextField.text! == "남성" {
                return .Man
            }else{
                return .Woman
            }
        }
        
        let newPerson:Person = Person(name: name, gender: gender(self.genderTextField.text!), age: age)
        
        DataFile.sharedData.friendsList[rowForIndexPath!] = newPerson
        print(DataFile.sharedData.friendsList)
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.tag == 1 {
            self.genderPickerViewOutlet.isHidden = false
            view.endEditing(true)
        }else{
            self.genderPickerViewOutlet.isHidden = true
        }
        return true
    }

    
    /******************************************/
    //         UIPickerView DataSource         //
    /******************************************/
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.genderTextField.text = genderList[row]
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 1{
        self.genderTextField.isUserInteractionEnabled = false
            textField.endEditing(true)
        }else{
            textField.isUserInteractionEnabled = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        textField.isUserInteractionEnabled = true
    }
    

    
    /******************************************/
    //                Life Cycle              //
    /******************************************/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if name != nil && age != nil && gender != nil {
            self.nameTextField.text = name
            self.ageTextField.text = age
            self.genderTextField.text = gender
        }
        
        if saveOrEditBtnOutlet.titleLabel?.text == "수정" {
            self.nameTextField.isUserInteractionEnabled = false
            self.genderTextField.isUserInteractionEnabled = false
            self.ageTextField.isUserInteractionEnabled = false
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
}
