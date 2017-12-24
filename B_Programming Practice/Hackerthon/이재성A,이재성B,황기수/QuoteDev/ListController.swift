//
//  ListController.swift
//  HackerTon
//
//  Created by 이재성 on 2017. 7. 6..
//  Copyright © 2017년 jaeseong. All rights reserved.
//

import UIKit


//var inputTexted: String? = ""

class ListController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var arrData:[[String:String]] = [["name":"leejaesung", "comment":"1st comment", "date":"07-04"]]
    var originInputViewFrame = CGRect()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputTextView: UIView!
    @IBOutlet var inputText:UITextField? //댓글 입력창
    
    var currentIndex:Int = 0
    var newArrData:arrComment?
    

    
    
    //확인 버튼 누를때 [배열[딕셔너리]] 에 데이터 저장

    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputText?.becomeFirstResponder()
        inputText?.delegate = self
        originInputViewFrame = self.inputTextView.frame
    }
    
    override func viewWillAppear(_ animated: Bool) {
        currentIndex = UserDefaults.standard.integer(forKey: "currentIndex")
        
        newArrData = DataCenter.sharedInstance.getCommentDataOf(index: currentIndex)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.inputTextView.frame = originInputViewFrame
        self.inputTextView.frame = CGRect(x:0 , y: 410, width: 375, height: 44)
        
        // UserDefaults 예외처리 - 데이터가 있으면, 빠져나온다.
        guard UserDefaults.standard.string(forKey: "nickName") == nil else { return print("guard-let")}
        
        let alert = UIAlertController(title: "닉네임 등록", message: "", preferredStyle: .alert)
        
        alert.addTextField { (textfield) in
            textfield.placeholder = "닉네임을 입력하세요."
        }
        
        let okBtn = UIAlertAction(title: "확인", style: .default) { (_) in
            if let title = alert.textFields?[0].text {
                UserDefaults.standard.set(title, forKey: "nickName")
                
            }
        }
        
        let cancelBtn = UIAlertAction(title: "취소", style: .cancel) { (_) in
            self.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(cancelBtn)
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //날짜가지고 와야함..
    @IBAction func okBtn(_ sender:UIButton) { // 확인창
        self.inputTextView.frame = originInputViewFrame
        inputText?.resignFirstResponder()
        let name = UserDefaults.standard.string(forKey: "nickName")
        let contents = self.inputText?.text
        
        // Date
        let dateString = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy hh:mm:ss +zzzz"
        dateFormatter.locale = Locale.init(identifier: "ko_KR")
        dateFormatter.dateFormat = "MM-dd"
        let date = dateFormatter.string(from: dateString)
        
        // Save Data
        let totalData: [String:Any] = ["name" : name!, "comment" : contents!, "date" : date]
//        arrData.insert(totalData, at: 0)
        
        let commentData = comment(data: totalData)
        
        DataCenter.sharedInstance.saveCommentDataTemp(comment: commentData, index: currentIndex)
        
//        DataCenter.sharedInstance.saveCommentDataOf(comment: commentData, index: currentIndex)
        
        // 예외처리
        self.inputText?.text = ""
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arrData.count
        return newArrData?._arrComment.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "ReuseCell") as! ListTableViewCell
        
//        var data = arrData[indexPath.row]
//        
//        cell.nickName?.text = data["name"]!
//        cell.contentText?.text = data["comment"]!
//        cell.writeTime?.text = data["date"]!
        
        myCell.nickName?.text = newArrData?.getDicOf(index: indexPath.row).nickName
        myCell.contentText?.text = newArrData?.getDicOf(index: indexPath.row).comment
        myCell.writeTime?.text = newArrData?.getDicOf(index: indexPath.row).date
        
        return myCell
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("beginedit")
        self.inputTextView.frame = CGRect(x:0 , y: 410, width: 375, height: 44)
        return true
    }

    
}
