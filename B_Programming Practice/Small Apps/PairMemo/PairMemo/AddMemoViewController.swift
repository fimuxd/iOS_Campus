//
//  AddMemoViewController.swift
//  PairMemo
//
//  Created by Hyoungsu Ham on 2017. 6. 8..
//  Copyright © 2017년 Hyoungsu Ham. All rights reserved.
//

import UIKit

// 새로운 메모를 추가하는 ViewController

class AddMemoViewController: UIViewController, UITextViewDelegate {

    /***********************************************************************/
    //                             IBLayout 영역                             //
    /***********************************************************************/
    @IBOutlet weak var titleTextField: UITextField!

    //    보영: 주석처리이유 - 중복되는 Outlet 입니다.
    //    @IBOutlet weak var contentTextField: UITextField!
    
    @IBOutlet weak var contentTextField: UITextView!
    @IBOutlet weak var priorityBtnOutlet: UIButton!
    
    
    /***********************************************************************/
    //                             IBAction 영역                             //
    /***********************************************************************/
    
    //'Back' 버튼
    @IBAction func AddPageBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    //'Done' 버튼 (누르면 저장되고 디스미스되야합니다)
    @IBAction func AddPageDoneButton(_ sender: Any) {
        addMemo()
        self.dismiss(animated: true, completion: nil)
    }
    
    //'별표' 버튼 (중요도 설정 버튼)
    @IBAction func priorityBtn(_ sender: UIButton) {
        if sender.titleColor(for: .normal) == UIColor.yellow {
            sender.setTitleColor(.lightGray, for: .normal)
        } else {
            sender.setTitleColor(.red, for: .normal)
        }
    }
    
    
    /***********************************************************************/
    //                             LifeCycle 영역                            //
    /***********************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()

        contentTextField.text = "새로운 메모를 입력하세요"
        contentTextField.textColor = UIColor.lightGray
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /***********************************************************************/
    //                              함수설정 영역                              //
    /***********************************************************************/
    
    //TextView의 Storyboard에는 없는 placeholder의 기능을 구현하기 위한 함수
    func textViewDidBeginEditing(_ textView: UITextView) {
        if contentTextField.textColor == UIColor.lightGray {
            contentTextField.text = ""
            contentTextField.textColor = UIColor.black
        }
    }
    
    //'done' 버튼을 눌렀을 때, 입력한 값들을 저장하는 기능을 구현하기 위한 함수
    func addMemo() {

        //        보영: 주석처리이유 - 하단에 다시 default값을 주었습니다.
        //        var memo: [String: Any] = [:]

        //        보영: 주석처리 이유 - ?? 이후 Default 값을 바꿨습니다
        //        var memolist = UserDefaults.standard.array(forKey: "memoList") as? [[String:String]] ?? []
        
        let title:String = titleTextField.text!
        let addedContent:String = contentTextField.text!
        
        var memoList = UserDefaults.standard.array(forKey: "memoList") as? [[String:String]] ?? []
        
        let memo: [String:String] = ["title":title, "content":addedContent]

        //        memo.updateValue(titleTextField.text, forKey: "title")
        //        memo.updateValue(contentTextField.text, forKey: "content")
        //        var memolist:[Any] = UserDefaults.standard.array(forKey: "moemoList")
        
        //        보영: 주석처리이유 - 상기 memoList의 Default 값을 수정함으로써, if memoList == nil 은 언제나 false입니다.
        //        if memoList == nil {
        //            memoList = [["title":title, "contant":content]]
        //        }else if priorityBtnOutlet.titleColor(for: .normal) == .red {
        //            memoList.insert(memo, at: 0)
        //        }else {
        //            memoList.append(memo)
        //        }
        
        if priorityBtnOutlet.titleColor(for: .normal) == .red {
            memoList.insert(memo, at: 0)
        }else {
            memoList.append(memo)
        }
        
        UserDefaults.standard.set(memoList, forKey: "memoList")
        
    }

}
