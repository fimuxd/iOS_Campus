//
//  AddMemoViewController.swift
//  PairMemo
//
//  Created by Hyoungsu Ham on 2017. 6. 8..
//  Copyright © 2017년 Hyoungsu Ham. All rights reserved.
//

import UIKit

class AddMemoViewController: UIViewController {

    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    
    
    //메모추가 페이지 백버튼
    @IBAction func AddPageBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    
    
    //메모추가 페이지 확인버튼(누르면 저장되고 디스미스되야합니다)

    @IBAction func AddPageDoneButton(_ sender: Any) {
        addMemo()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    ////////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func addMemo() {
//        var memo: [String: Any] = [:]
        var memolist = UserDefaults.standard.array(forKey: "memoList") as? [[String:String]] ?? []
        
        let title:String = titleTextField.text!
        let contant:String = contentTextField.text!
        
        var memo: [String:String] = ["title":title, "contant":contant]
//        memo.updateValue(titleTextField.text, forKey: "title")
//        memo.updateValue(contentTextField.text, forKey: "content")
        
//        var memolist:[Any] = UserDefaults.standard.array(forKey: "moemoList")
        
        if memolist == nil {
            memolist = [["title":title, "contant":contant]]
        }
        else {
            memolist.append(memo)
        }
        
        UserDefaults.standard.set(memolist, forKey: "memoList")
        
        
    }
}
