//
//  MainViewController.swift
//  KoreanRullet
//
//  Created by Bo-Young PARK on 15/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    
    //****************************************//
    //               IBOutlet                 //
    //****************************************//
    
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var inputMoneyValueTextField: UITextField!
    
    
    //****************************************//
    //                IBAction                //
    //****************************************//
    
    @IBAction func LetsDoThisBtn(_ sender: UIButton) {
        
        if inputMoneyValueTextField.text != "" /* !DataCentre.inputMemberNames.contains("") */ {
            
            print(DataCentre.inputMemberNames)
            makeRandomArray()
            makeResultMoney()
            
        }else{
            print(DataCentre.inputMemberNames)
            setAlert()
        }
        
    }
    
    @IBAction func memberAddBtn(_ sender: UIButton) {
        let adjustArray:[String] = [""]
        
        if DataCentre.inputMemberNames.count < 10 {
            DataCentre.inputMemberNames += adjustArray
        }
        
        mainTableView.reloadData()
        print(DataCentre.inputMemberNames)
    }
    
    @IBAction func memberRemoveBtn(_ sender: UIButton) {
        
        let mainCell:MainTableViewCell = mainTableView.dequeueReusableCell(withIdentifier: "mainCell") as! MainTableViewCell
        
        if DataCentre.inputMemberNames.count > 2{
            DataCentre.inputMemberNames.remove(at: DataCentre.inputMemberNames.count-1)
            mainCell.inputMemberNameTextField.text = ""
        }
        mainTableView.reloadData()
        print(DataCentre.inputMemberNames)
    }
    
    
    //****************************************//
    //                  함수영역                //
    //****************************************//
    
    // TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataCentre.inputMemberNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mainCell:MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainTableViewCell
        
        let inputMemberNameTF:UITextField = mainCell.inputMemberNameTextField
        
//        textFieldDidEndEditing(inputMemberNameTF)
            textFieldShouldEndEditing(inputMemberNameTF)

            DataCentre.inputMemberNames[indexPath.row] = inputMemberNameTF.text!
        
        
        return mainCell
    }
    
    
    // TextField Delegate: 이 부분 모르겠습니다.
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        
//        let testCell:MainTableViewCell = mainTableView.dequeueReusableCell(withIdentifier: "mainCell") as! MainTableViewCell
//        let indexPath:IndexPath = mainTableView.indexPath(for: testCell)
//        
//        
//        DataCentre.inputMemberNames[indexPath.row] = textField.text!
//        
//    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    //    func isTextFieldEndEditing() -> Bool {
    //        return true
    //    }
    
    
    // 일반 함수
    
    func makeRandomArray() -> [Int] {
        
        while (DataCentre.randomCounts.count) < (DataCentre.inputMemberNames.count) {
            let randomNumber:UInt32 = arc4random_uniform(UInt32(DataCentre.inputMemberNames.count))
            
            if !(DataCentre.randomCounts.contains(Int(randomNumber))) {
                DataCentre.randomCounts.append(Int(randomNumber))
            }
        }
        
        return DataCentre.randomCounts
    }
    
    func makeResultMoney() -> [Int] {
        var result:Int = Int(self.inputMoneyValueTextField.text!)!
        
        for _ in 1..<DataCentre.inputMemberNames.count-1 {
            if DataCentre.resultValues.count < DataCentre.inputMemberNames.count-2 {
                result /= 2
                DataCentre.resultValues.append(result)
            }else{
                result /= 2
                DataCentre.resultValues.append(result)
                DataCentre.resultValues.append(result)
            }
        }
        return DataCentre.resultValues
    }
    
    func setAlert() {
        let alert:UIAlertController = UIAlertController(title: "Warning", message: "모든 값을 입력해주세요", preferredStyle: .alert)
        
        let okBtn:UIAlertAction = UIAlertAction(title: "Done", style: .default, handler: nil)
        
        alert.addAction(okBtn)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //****************************************//
    //               LifeCycle                //
    //****************************************//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}
