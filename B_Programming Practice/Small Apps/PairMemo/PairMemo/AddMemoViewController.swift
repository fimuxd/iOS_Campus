//
//  AddMemoViewController.swift
//  PairMemo
//
//  Created by Hyoungsu Ham on 2017. 6. 8..
//  Copyright © 2017년 Hyoungsu Ham. All rights reserved.
//

import UIKit

class AddMemoViewController: UIViewController, UITextViewDelegate {

   
    @IBOutlet weak var titleTextField: UITextField!
//    @IBOutlet weak var contentTextField: UITextField!
    
    @IBOutlet weak var contentTextField: UITextView!
    
    //메모추가 페이지 백버튼
    @IBAction func AddPageBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    
    
    //메모추가 페이지 확인버튼(누르면 저장되고 디스미스되야합니다)

    @IBAction func AddPageDoneButton(_ sender: Any) {
        addMemo()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var priorityBtnOutlet: UIButton!
    @IBAction func priorityBtn(_ sender: UIButton) {
        
        if sender.titleColor(for: .normal) == UIColor.yellow {
            sender.setTitleColor(.lightGray, for: .normal)
        } else {
            sender.setTitleColor(.red, for: .normal)
        }
    }
    
    
    ////////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()

        contentTextField.text = "새로운 메모를 입력하세요"
        contentTextField.textColor = UIColor.lightGray
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if contentTextField.textColor == UIColor.lightGray {
            contentTextField.text = ""
            contentTextField.textColor = UIColor.black
        }
    }
    
    func addMemo() {
//        var memo: [String: Any] = [:]
        var memolist = UserDefaults.standard.array(forKey: "memoList") as? [[String:String]] ?? []
        
        let title:String = titleTextField.text!
        let contant:String = contentTextField.text!
        
        let memo: [String:String] = ["title":title, "contant":contant]
//        memo.updateValue(titleTextField.text, forKey: "title")
//        memo.updateValue(contentTextField.text, forKey: "content")
        
//        var memolist:[Any] = UserDefaults.standard.array(forKey: "moemoList")
        
        if memolist == nil {
            memolist = [["title":title, "contant":contant]]
        }
        else if priorityBtnOutlet.titleColor(for: .normal) == .red {
            memolist.insert(memo, at: 0)
        }else {
            memolist.append(memo)
        }
        
        UserDefaults.standard.set(memolist, forKey: "memoList")
        
        
    }



}
