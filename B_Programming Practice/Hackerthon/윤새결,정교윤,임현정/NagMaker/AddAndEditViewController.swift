//
//  AddAndEditViewController.swift
//  NagMaker
//
//  Created by 정교윤 on 2017. 7. 6..
//  Copyright © 2017년 HyunJung. All rights reserved.
//

import UIKit

class AddAndEditViewController: UIViewController {

    @IBOutlet weak var nagOne: UITextField!//nag
    @IBOutlet weak var nagTwo: UITextField!//nag_after_y
    @IBOutlet weak var nagThree: UITextField!//nag_after_n
    
    @IBOutlet weak var deleteButton: UIButton!//delete
    @IBOutlet weak var minutesTF: UITextField!
    @IBOutlet weak var secondsTF: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    var isEditMode:Bool = true
    
    var minutesArray:[String] = [""]
    var secondsArray:[String] = [""]
    
    var minutes:Int?
    var seconds:Int?
    var totalSeconds:Int?
    var segueProceed:Bool?
    var editedItem:Nag?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeMinutesArray()
        makeSecondsArray()
        
        self.deleteButton.layer.borderColor = UIColor.lightGray.cgColor
        self.deleteButton.layer.borderWidth = 1
        self.deleteButton.layer.cornerRadius = 5
        
        if isEditMode == true {
            self.title = "수정하기"
            self.titleLabel.text = "EDIT NAG"
            self.deleteButton.isHidden = false 
        } else { // 추가하기
            self.title = "추가하기"
            self.titleLabel.text = "ADD NAG"
            self.deleteButton.isHidden = true
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print(editedItem ?? "none")
        if self.isEditMode == true {
            
            convertToMinutesSeconds()
            
            if let item = editedItem {
                
                self.nagOne.text = item.nagTitle // self.editedCell.xxx
                self.nagTwo.text = item.nagAnswerY // self.editedCell.xxx
                self.nagThree.text = item.nagAnswerN // self.editedCell.xxx
            
                //loadDropdownDataEditMode(data: ages, text: "11")
                self.minutesTF.loadDropdownDataEditMode(data: minutesArray, text: String(self.minutes!))
                self.secondsTF.loadDropdownDataEditMode(data: secondsArray, text: String(self.seconds!))
                
                totalSeconds = convertToSeconds(self.minutes!, self.seconds!)
                
            }
            
            
        } else {
            
            self.nagOne.text = ""
            self.nagTwo.text = ""
            self.nagThree.text = ""
            
            //loadDropdownData(data: ages)
            self.minutesTF.loadDropdownData(data: minutesArray)
            self.secondsTF.loadDropdownData(data: secondsArray)
        }
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("started")
        self.view.endEditing(true)
    }
    
    func makeMinutesArray() {
        for i in 1...59 {
            minutesArray.append(String(i))
        }
    }

    func makeSecondsArray() {
        for i in 0...59 {
            secondsArray.append(String(i))
        }
    }
    
    @IBAction func saveButtonTouched(_ sender: UIBarButtonItem) {
        
        
        if self.nagOne.text == "" || self.nagTwo.text == "" || self.nagThree.text == "" || self.minutesTF.text == "" || self.secondsTF.text == "" {
            
            presentAlertWithTitleSuccess(title: "입력 에러", message: "모든 입력란에 값을 입력하여 주세요!")
            
        } else {
            presentAlertWithTitleSuccess(title: "입력값 체크완료", message : "이대로 저장하시겠습니까?")
        }
        
    }
    
    
    @IBAction func deleteButtonTouched(_ sender: UIButton) {
        
        presentAlertWithTitleSuccess(title: "데이터 삭제 확인 메시지", message : "이대로 삭제하시겠습니까?")
        
    }
    
    func presentAlertWithTitleSuccess(title: String, message : String) {
        
        
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action: UIAlertAction) in
            
//                DataCenter.standard.addNag(["nag_title":self.nagOne.text!,"nag_answer_Y":self.nagTwo.text!,"nag_answer_N":self.nagThree.text!,"duration":self.totalSeconds!])
//                self.navigationController?.popViewController(animated: true)//self.segueProceed = true
            
        }
        
        let CANCELAction = UIAlertAction(title: "CANCEL", style: .default) {
            (action: UIAlertAction) in print("CANCEL Button")//self.segueProceed = false
        }
        
        alertController.addAction(OKAction)
        alertController.addAction(CANCELAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func presentAlertWithTitleFail(title: String, message : String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action: UIAlertAction) in self.segueProceed = false
        }
        
        
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func convertToMinutesSeconds() {
        
        // 3559 => 59 59
        
         
        self.minutes = (10 % 3600) / 60
        self.seconds = (10 % 3600) % 60
        
    }
    
    func convertToSeconds(_ minutes:Int, _ seconds:Int) -> Int {
        
        let totalSeconds = (minutes * 60) + seconds
        
        return totalSeconds
        
    }
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        
//        // 데이터가 다 들어갔다면 성공 메시지를 보여주고 OK 버튼 클릭시 이전 화면으로 넘어갈 수 있도록 한다. CANCEL 버튼 클릭시 넘어가지 못하게 막는다.
//        // SAVE 버튼 클릭시
//        if identifier == "SAVE_SEGUE" {
//            
//            if self.nagOne.text == "" || self.nagTwo.text == "" || self.nagThree.text == "" || self.minutesTF.text == "" || self.secondsTF.text == "" {
//                
//                presentAlertWithTitleFail(title: "입력 에러", message: "모든 입력란에 값을 입력하여 주세요!")
//                
//                
//            } else {
//                presentAlertWithTitleSuccess(title: "입력값 체크완료", message : "이대로 저장하시겠습니까?")
//            }
//
//            
//        } else { // DELETE 버튼 클릭시 
//            
//            presentAlertWithTitleSuccess(title: "데이터 삭제 확인 메시지", message : "이대로 삭제하시겠습니까?")
//        }
//        
//        
//        return self.segueProceed!
//        
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == "SAVE_SEGUE" {
//            
//        } else {
//            
//        }
//        
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
