//
//  ReadAndEditViewController.swift
//  PairMemo
//
//  Created by Hyoungsu Ham on 2017. 6. 8..
//  Copyright © 2017년 Hyoungsu Ham. All rights reserved.
//

import UIKit

// 기존의 메모를 확인하고, 필요시 수정을 할 수 있는 ViewController

class ReadAndEditViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    
    /***********************************************************************/
    //                    property 설정; data를 받을 그릇들                     //
    /***********************************************************************/
    var textTitle: String?
    var content: String?
    var indexPath: Int?
    
    
    /***********************************************************************/
    //                             IBLayout 영역                             //
    /***********************************************************************/
    
    //제목(Title) TextField
    @IBOutlet weak var titleTextField: UITextField!
    
    //내용(Content) TextField
    @IBOutlet weak var contentTextView: UITextView!
    
    //수정을 하려고 제목이나 내용 TF를 탭했을 때 나오는 'Done' 버튼 아울렛
    @IBOutlet weak var doneBtnOutlet: UIButton!
    
    //    보영: 주석처리이유 - 중복되는 아울렛
    //    @IBOutlet weak var contentsTextField: UITextField!
    
    
    /***********************************************************************/
    //                             IBAction 영역                             //
    /***********************************************************************/
    
    // 'Done' 버튼을 눌렀을 때, 수정된 값을 저장
    @IBAction func doneBtn(_ sender: UIButton) {
    
        let indexPath:Int = self.indexPath!
        
        var editedMemoList = UserDefaults.standard.array(forKey:"memoList") as? [[String:String]] ?? []
        
        let title:String = self.titleTextField.text!
        let content:String = self.contentTextView.text!
        let memo: [String:String] = ["title":title, "content":content]
        
        //        다음 방법으로 하기 두 줄을 한 줄로 줄일 수 있습니다.
        //        editedMemoList.remove(at: Int(indexPath))
        //        editedMemoList.insert(memo, at: Int(indexPath))
        editedMemoList[Int(indexPath)] = memo
        
        UserDefaults.standard.set(editedMemoList, forKey: "memoList")
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    /***********************************************************************/
    //                             LifeCycle 영역                            //
    /***********************************************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        보영: 주석처리이유 - Optional Type으로 들어가더라도, 어차피 text가 옵셔널(String?)이므로 괜찮다.
                let textTitle:String = self.textTitle!
                let content:String = self.content!
        let indexPath:Int = self.indexPath!
    
        //        print(indexPath)
        
        self.titleTextField.text = textTitle
        self.contentTextView.text = content
        self.doneBtnOutlet.isHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /***********************************************************************/
    //                                함수 영역                               //
    /***********************************************************************/
    
    func showDoneButton() {
        self.doneBtnOutlet.isHidden = false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //        보영: 주석처리이유 - 이렇게 비슷한 기능을 구현할 때는 함수를 만들어서 그 함수를 넣어주는 것이 좋다고 합니다.
        //        self.doneBtnOutlet.isHidden = false
        
        showDoneButton()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        //        보영: 주석처리이유 - 상동
        //        self.doneBtnOutlet.isHidden = false
        
        showDoneButton()
    }

}
