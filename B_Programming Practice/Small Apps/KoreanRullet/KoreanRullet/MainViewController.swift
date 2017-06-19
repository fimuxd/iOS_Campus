//
//  MainViewController.swift
//  KoreanRullet
//
//  Created by Bo-Young PARK on 15/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, MainTableViewCellDelegate{
    
    
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
            makeRandomArray()
            makeResultMoney()
            
        }else{
            setAlert()
        }
        
    }
    
    @IBAction func memberAddBtn(_ sender: UIButton) {
        let adjustArray:[String] = [""]
        
        if DataCentre.inputMemberNames.count < 10 {
            DataCentre.inputMemberNames += adjustArray
        }else{
        }
        mainTableView.reloadData()
        print(DataCentre.inputMemberNames)
    }
    
    @IBAction func memberRemoveBtn(_ sender: UIButton) {
        
        if DataCentre.inputMemberNames.count > 2{
            DataCentre.inputMemberNames.removeLast()
        }
        mainTableView.reloadData()
        print(DataCentre.inputMemberNames)
    }
    
    
    //****************************************//
    //                  함수영역                //
    //****************************************//
    
    // TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if DataCentre.inputMemberNames.count < 2 {
            return 2
        }else{
        return DataCentre.inputMemberNames.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mainCell:MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainTableViewCell
        
        mainCell.delegate = self
        
        return mainCell
    }
    
 
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
        print(DataCentre.resultValues)
        return DataCentre.resultValues
    }
    
    func setAlert() {
        let alert:UIAlertController = UIAlertController(title: "Warning", message: "모든 값을 입력해주세요", preferredStyle: .alert)
        
        let okBtn:UIAlertAction = UIAlertAction(title: "Done", style: .default, handler: nil)
        
        alert.addAction(okBtn)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func didTextFieldOnCellEditing(inputNameText: String, tableViewCell: MainTableViewCell) {
        
        let indexPath = mainTableView.indexPath(for: tableViewCell)?.row
        
        DataCentre.inputMemberNames[indexPath!] = inputNameText
        print(DataCentre.inputMemberNames)
    }
    
    
    //****************************************//
    //               LifeCycle                //
    //****************************************//
    override func viewWillAppear(_ animated: Bool) {


    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}
